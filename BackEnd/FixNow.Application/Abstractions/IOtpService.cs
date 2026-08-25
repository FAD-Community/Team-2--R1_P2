using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using static FixNow.Domain.Enums.Enums;

namespace FixNow.Application.Abstractions;
public interface IOtpService
{
    Task<string> GenerateAndSaveOtpAsync(Guid userId, OtpPurpose purpose);
    Task<bool> VerifyOtpAsync(Guid userId, string code, OtpPurpose purpose);
}