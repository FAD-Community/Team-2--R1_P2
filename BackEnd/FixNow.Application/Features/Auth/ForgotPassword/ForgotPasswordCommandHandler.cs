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

namespace FixNow.Application.Features.Auth.ForgotPassword;

public class ForgotPasswordCommandHandler : IRequestHandler<ForgotPasswordCommand, ApiResponse<string>>
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly IOtpService _otpService;
    private readonly IEmailSender _emailSender;

    public ForgotPasswordCommandHandler(IUnitOfWork unitOfWork, IOtpService otpService, IEmailSender emailSender)
    {
        _unitOfWork = unitOfWork;
        _otpService = otpService;
        _emailSender = emailSender;
    }

    public async Task<ApiResponse<string>> Handle(ForgotPasswordCommand request, CancellationToken cancellationToken)
    {
        var userRepo = _unitOfWork.GetRepo<User, Guid>();
        var user = await userRepo.FindOneAsync(u => u.Email == request.Email);

        if (user is null)
            return ApiResponse<string>.FailureResponse("User not found.", 404);

        var code = await _otpService.GenerateAndSaveOtpAsync(user.Id, OtpPurpose.PasswordReset);

        await _emailSender.SendEmailAsync(
            user.Email,
            "FixNow - Password Reset Code",
            $"Your password reset code is: {code}\nThis code expires in 10 minutes.");

        return ApiResponse<string>.SuccessResponse(null, "Password reset code sent to your email.");
    }
}