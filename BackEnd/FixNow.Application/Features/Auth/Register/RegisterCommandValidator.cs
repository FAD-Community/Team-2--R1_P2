using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using FluentValidation;
using static FixNow.Domain.Enums.Enums;


namespace FixNow.Application.Features.Auth.Register;

public class RegisterCommandValidator : AbstractValidator<RegisterCommand>
{
    public RegisterCommandValidator()
    {
        RuleFor(x => x.FullName).NotEmpty().MaximumLength(150);
        RuleFor(x => x.Email).NotEmpty().EmailAddress().MaximumLength(150);
        RuleFor(x => x.PhoneNumber).NotEmpty()
            .Matches(@"^01[0125][0-9]{8}$")
            .WithMessage("Phone number must be a valid Egyptian number.");
        RuleFor(x => x.Password).NotEmpty().MinimumLength(8);
        RuleFor(x => x.Role)
            .Must(r => r == Role.Customer.ToString() || r == Role.Technician.ToString())
            .WithMessage("Role must be Customer or Technician.");

        RuleFor(x => x.Governorate).NotEmpty().MaximumLength(100);
        RuleFor(x => x.Area).NotEmpty().MaximumLength(100);

        // Only required for Technicians for now — screens don't show it as
        // required for Customers. Revisit if UI/UX confirms otherwise.
        RuleFor(x => x.DateOfBirth)
            .NotNull()
            .WithMessage("Date of birth is required for technicians.")
            .When(x => x.Role == Role.Technician.ToString());
    }
}
