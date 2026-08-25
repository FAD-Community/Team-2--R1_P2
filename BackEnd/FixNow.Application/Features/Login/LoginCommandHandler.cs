using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using FixNow.Application.Abstractions;
using FixNow.Application.Common;
using FixNow.Application.Common.Dtos;
using FixNow.Domain;
using FixNow.Domain.Entities;
using MediatR;

namespace FixNow.Application.Features.Auth.Login;

public class LoginCommandHandler : IRequestHandler<LoginCommand, ApiResponse<AuthResponseDto>>
{
    private const int MaxFailedAttempts = 5;
    private static readonly TimeSpan LockoutDuration = TimeSpan.FromMinutes(15);

    private readonly IUnitOfWork _unitOfWork;
    private readonly IPasswordHasher _passwordHasher;
    private readonly IJwtTokenGenerator _jwtTokenGenerator;

    public LoginCommandHandler(
        IUnitOfWork unitOfWork,
        IPasswordHasher passwordHasher,
        IJwtTokenGenerator jwtTokenGenerator)
    {
        _unitOfWork = unitOfWork;
        _passwordHasher = passwordHasher;
        _jwtTokenGenerator = jwtTokenGenerator;
    }

    public async Task<ApiResponse<AuthResponseDto>> Handle(LoginCommand request, CancellationToken cancellationToken)
    {
        var userRepo = _unitOfWork.GetRepo<User, Guid>();

        var user = await userRepo.FindOneAsync(u =>
            u.Email == request.EmailOrPhone || u.PhoneNumber == request.EmailOrPhone);

        if (user is null)
            return ApiResponse<AuthResponseDto>.FailureResponse("Invalid credentials.", 401);

        if (user.LockoutEnd is not null && user.LockoutEnd > DateTime.UtcNow)
            return ApiResponse<AuthResponseDto>.FailureResponse(
                $"Account locked. Try again after {user.LockoutEnd:HH:mm} UTC.", 401);

        if (!user.IsActive)
            return ApiResponse<AuthResponseDto>.FailureResponse("Please verify your email before logging in.", 401);

        if (!_passwordHasher.Verify(request.Password, user.PasswordHash))
        {
            user.FailedLoginAttempts++;
            if (user.FailedLoginAttempts >= MaxFailedAttempts)
            {
                user.LockoutEnd = DateTime.UtcNow.Add(LockoutDuration);
                user.FailedLoginAttempts = 0;
            }
            userRepo.update(user);
            await _unitOfWork.SaveChangesAsync();

            return ApiResponse<AuthResponseDto>.FailureResponse("Invalid credentials.", 401);
        }

        // Success — reset throttling, issue tokens
        user.FailedLoginAttempts = 0;
        user.LockoutEnd = null;

        var accessToken = _jwtTokenGenerator.GenerateAccessToken(user.Id, user.Role.ToString());
        var refreshToken = _jwtTokenGenerator.GenerateRefreshToken();

        user.RefreshToken = refreshToken;
        user.RefreshTokenExpiryTime = DateTime.UtcNow.AddDays(7);
        userRepo.update(user);
        await _unitOfWork.SaveChangesAsync();

        var response = new AuthResponseDto
        {
            UserId = user.Id,
            FullName = user.FullName,
            Role = user.Role.ToString(),
            AccessToken = accessToken,
            RefreshToken = refreshToken
        };

        return ApiResponse<AuthResponseDto>.SuccessResponse(response, "Login successful.");
    }
}