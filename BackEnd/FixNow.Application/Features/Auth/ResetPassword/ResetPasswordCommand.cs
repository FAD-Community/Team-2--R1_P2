using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using FixNow.Application.Common;
using MediatR;

namespace FixNow.Application.Features.Auth.ResetPassword;

public record ResetPasswordCommand(string Email, string Code, string NewPassword) : IRequest<ApiResponse<string>>;