using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using FixNow.Application.Common;
using MediatR;

namespace FixNow.Application.Features.Auth.ForgotPassword;

public record ForgotPasswordCommand(string Email) : IRequest<ApiResponse<string>>;