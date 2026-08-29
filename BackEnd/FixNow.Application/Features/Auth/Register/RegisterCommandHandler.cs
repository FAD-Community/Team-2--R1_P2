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

namespace FixNow.Application.Features.Auth.Register;

public class RegisterCommandHandler : IRequestHandler<RegisterCommand, ApiResponse<string>>
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly IPasswordHasher _passwordHasher;
    private readonly IOtpService _otpService;
    private readonly IEmailSender _emailSender;

    public RegisterCommandHandler(
        IUnitOfWork unitOfWork,
        IPasswordHasher passwordHasher,
        IOtpService otpService,
        IEmailSender emailSender)
    {
        _unitOfWork = unitOfWork;
        _passwordHasher = passwordHasher;
        _otpService = otpService;
        _emailSender = emailSender;
    }

    public async Task<ApiResponse<string>> Handle(RegisterCommand request, CancellationToken cancellationToken)
    {
        var userRepo = _unitOfWork.GetRepo<User, Guid>();

        var exists = await userRepo.AnyAsync(u =>
            u.Email == request.Email || u.PhoneNumber == request.PhoneNumber);

        if (exists)
            return ApiResponse<string>.FailureResponse("Email or phone number is already registered.", 409); // Conflict
        
        Enum.TryParse<Role>(
    request.Role,
    ignoreCase: true,
    out var userRole
     );
        var user = new User
        {
            Id = Guid.NewGuid(),
            
            FullName = request.FullName,
            Email = request.Email,
            PhoneNumber = request.PhoneNumber,
            PasswordHash = _passwordHasher.Hash(request.Password),
            Role =userRole ,
            Governorate = request.Governorate,
            Area = request.Area,
            DateOfBirth = request.DateOfBirth,
            IsActive = false,
            CreatedAt = DateTime.UtcNow,
            UpdatedAt = DateTime.UtcNow
        };

        await userRepo.Add(user);

        if (request.Role == Role.Technician.ToString())
        {
            var technicianRepo = _unitOfWork.GetRepo<TechnicianProfile, Guid>();
            await technicianRepo.Add(new TechnicianProfile
            {
                Id = user.Id,
                VerificationStatus = VerificationStatus.Pending
            });
        }

        await _unitOfWork.SaveChangesAsync();

        var code = await _otpService.GenerateAndSaveOtpAsync(user.Id, OtpPurpose.Registration);

        await _emailSender.SendEmailAsync(
            user.Email,
            "FixNow - Verify your account",
            $"Your verification code is: {code}\nThis code expires in 10 minutes.");

        return ApiResponse<string>.SuccessResponse(user.Id.ToString(), "Registration successful. Please check your email for the verification code.", 201); // Created
    }
}