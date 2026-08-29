using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using FixNow.Application.Common;
using MediatR;
using static FixNow.Domain.Enums.Enums;

namespace FixNow.Application.Features.Auth.Register;

public record RegisterCommand(
    string FullName,
    string Email,
    string PhoneNumber,
    string Password,
    string Role,
    string Governorate,
    string Area,
    DateTime? DateOfBirth
) : IRequest<ApiResponse<string>>;