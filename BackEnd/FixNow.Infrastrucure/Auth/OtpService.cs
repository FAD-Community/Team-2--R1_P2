using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using FixNow.Application.Abstractions;
using FixNow.Domain;
using FixNow.Domain.Entities;
using static FixNow.Domain.Enums.Enums;

namespace FixNow.Infrastructure.Auth;

public class OtpService : IOtpService
{
    private readonly IUnitOfWork _unitOfWork;
    private static readonly Random _random = new();

    public OtpService(IUnitOfWork unitOfWork)
    {
        _unitOfWork = unitOfWork;
    }

    public async Task<string> GenerateAndSaveOtpAsync(Guid userId, OtpPurpose purpose)
    {
        var code = _random.Next(100000, 999999).ToString();

        var otp = new OtpVerification
        {
            Id = Guid.NewGuid(),
            UserId = userId,
            Code = code,
            Purpose = purpose,
            ExpiresAt = DateTime.UtcNow.AddMinutes(10),
            IsUsed = false,
            CreatedAt = DateTime.UtcNow
        };

        var otpRepo = _unitOfWork.GetRepo<OtpVerification, Guid>();
        await otpRepo.Add(otp);
        await _unitOfWork.SaveChangesAsync();

        return code;
    }

    public async Task<bool> VerifyOtpAsync(Guid userId, string code, OtpPurpose purpose)
    {
        var otpRepo = _unitOfWork.GetRepo<OtpVerification, Guid>();

        var otp = await otpRepo.FindOneAsync(o =>
            o.UserId == userId &&
            o.Code == code &&
            o.Purpose == purpose &&
            !o.IsUsed &&
            o.ExpiresAt > DateTime.UtcNow);

        if (otp is null) return false;

        otp.IsUsed = true;
        otpRepo.update(otp);
        await _unitOfWork.SaveChangesAsync();

        return true;
    }
}