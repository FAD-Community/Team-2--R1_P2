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

namespace FixNow.Application.Features.Auth.VerifyOtp;

public class VerifyOtpCommandHandler : IRequestHandler<VerifyOtpCommand, ApiResponse<string>>
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly IOtpService _otpService;

    public VerifyOtpCommandHandler(IUnitOfWork unitOfWork, IOtpService otpService)
    {
        _unitOfWork = unitOfWork;
        _otpService = otpService;
    }

    public async Task<ApiResponse<string>> Handle(VerifyOtpCommand request, CancellationToken cancellationToken)
    {
        var userRepo = _unitOfWork.GetRepo<User, Guid>();
        var user = await userRepo.FindOneAsync(u => u.Email == request.Email);

        if (user is null)
            return ApiResponse<string>.FailureResponse("User not found.", 404);

        

        var isValid = await _otpService.VerifyOtpAsync(user.Id, request.Code, OtpPurpose.Registration);

        if (!isValid)
            return ApiResponse<string>.FailureResponse("Invalid or expired verification code.", 400);

        user.IsActive = true;
        user.UpdatedAt = DateTime.UtcNow;
        userRepo.update(user);
        await _unitOfWork.SaveChangesAsync();

        return ApiResponse<string>.SuccessResponse(null, "Account verified successfully. You can now log in.");
    }
}