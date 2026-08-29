using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using FixNow.Application.Abstractions;
using FixNow.Application.Common;
using FixNow.Domain;
using FixNow.Domain.Entities;
using MediatR;
using static FixNow.Domain.Enums.Enums;

namespace FixNow.Application.Features.Auth.ResetPassword;

public class ResetPasswordCommandHandler : IRequestHandler<ResetPasswordCommand, ApiResponse<string>>
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly IOtpService _otpService;
    private readonly IPasswordHasher _passwordHasher;

    public ResetPasswordCommandHandler(IUnitOfWork unitOfWork, IOtpService otpService, IPasswordHasher passwordHasher)
    {
        _unitOfWork = unitOfWork;
        _otpService = otpService;
        _passwordHasher = passwordHasher;
    }

    public async Task<ApiResponse<string>> Handle(ResetPasswordCommand request, CancellationToken cancellationToken)
    {
        var userRepo = _unitOfWork.GetRepo<User, Guid>();
        var user = await userRepo.FindOneAsync(u => u.Email == request.Email);

        if (user is null)
            return ApiResponse<string>.FailureResponse("User not found.", 404);

        var isValid = await _otpService.VerifyOtpAsync(user.Id, request.Code, OtpPurpose.PasswordReset);

        if (!isValid)
            return ApiResponse<string>.FailureResponse("Invalid or expired verification code.", 400);

        user.PasswordHash = _passwordHasher.Hash(request.NewPassword);
        // security: force re-login everywhere after a password reset
        user.RefreshToken = null;
        user.RefreshTokenExpiryTime = null;
        user.UpdatedAt = DateTime.UtcNow;
        userRepo.update(user);
        await _unitOfWork.SaveChangesAsync();

        return ApiResponse<string>.SuccessResponse(null, "Password reset successfully. Please log in with your new password.");
    }
}