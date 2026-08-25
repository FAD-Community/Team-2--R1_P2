using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using FixNow.Application.Common;
using MediatR;

namespace FixNow.Application.Features.Auth.VerifyOtp;

public record VerifyOtpCommand(string Email, string Code) : IRequest<ApiResponse<string>>;