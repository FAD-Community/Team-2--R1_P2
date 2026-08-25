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

namespace FixNow.Application.Features.Auth.RefreshToken;

public class RefreshTokenCommandHandler : IRequestHandler<RefreshTokenCommand, ApiResponse<AuthResponseDto>>
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly IJwtTokenGenerator _jwtTokenGenerator;

    public RefreshTokenCommandHandler(IUnitOfWork unitOfWork, IJwtTokenGenerator jwtTokenGenerator)
    {
        _unitOfWork = unitOfWork;
        _jwtTokenGenerator = jwtTokenGenerator;
    }

    public async Task<ApiResponse<AuthResponseDto>> Handle(RefreshTokenCommand request, CancellationToken cancellationToken)
    {
        var userRepo = _unitOfWork.GetRepo<User, Guid>();

        var user = await userRepo.FindOneAsync(u => u.RefreshToken == request.RefreshToken);

        if (user is null || user.RefreshTokenExpiryTime is null || user.RefreshTokenExpiryTime <= DateTime.UtcNow)
            return ApiResponse<AuthResponseDto>.FailureResponse("Invalid or expired refresh token.", 401);

        var newAccessToken = _jwtTokenGenerator.GenerateAccessToken(user.Id, user.Role.ToString());
        var newRefreshToken = _jwtTokenGenerator.GenerateRefreshToken();

        user.RefreshToken = newRefreshToken;
        user.RefreshTokenExpiryTime = DateTime.UtcNow.AddDays(7);
        userRepo.update(user);
        await _unitOfWork.SaveChangesAsync();

        var response = new AuthResponseDto
        {
            UserId = user.Id,
            FullName = user.FullName,
            Role = user.Role.ToString(),
            AccessToken = newAccessToken,
            RefreshToken = newRefreshToken
        };

        return ApiResponse<AuthResponseDto>.SuccessResponse(response, "Token refreshed.");
    }
}