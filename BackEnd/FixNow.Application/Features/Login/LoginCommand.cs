using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using FixNow.Application.Common;
using FixNow.Application.Common.Dtos;
using MediatR;

namespace FixNow.Application.Features.Auth.Login;

public record LoginCommand(string EmailOrPhone, string Password) : IRequest<ApiResponse<AuthResponseDto>>;