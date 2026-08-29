using FixNow.Application.Abstractions;
using FixNow.Application.Common;
using FixNow.Domain;
using FixNow.Domain.Entities;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FixNow.Application.Features.Auth.Logout;

public class LogoutCommandHandler : IRequestHandler<LogoutCommand, ApiResponse<string>>
{
    private readonly IUnitOfWork _unitOfWork;

    public LogoutCommandHandler(IUnitOfWork unitOfWork)
    {
        _unitOfWork = unitOfWork;
    }

    public async Task<ApiResponse<string>> Handle(LogoutCommand request, CancellationToken cancellationToken)
    {
        var userRepo = _unitOfWork.GetRepo<User, Guid>();
        var user = await userRepo.GetById(request.UserId);

        if (user is null)
            return ApiResponse<string>.FailureResponse("User not found.", 404);

        user.RefreshToken = null;
        user.RefreshTokenExpiryTime = null;
        userRepo.update(user);
        await _unitOfWork.SaveChangesAsync();

        return ApiResponse<string>.SuccessResponse(null, "Logged out successfully.");
    }
}