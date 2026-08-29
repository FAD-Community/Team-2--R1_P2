using static FixNow.Domain.Enums.Enums;

namespace FixNow.Domain.Entities;

public class User : TEntity<Guid>
{
    public Guid Id { get; set; }
    public string FullName { get; set; } = null!;
    public string Email { get; set; } = null!;
    public string PhoneNumber { get; set; } = null!;
    public string PasswordHash { get; set; } = null!;
    public Role Role { get; set; }
    public string? ProfileImageUrl { get; set; }
    public bool IsActive { get; set; } = true;
    public DateTime CreatedAt { get; set; }
    public DateTime UpdatedAt { get; set; }

    // Navigation Properties
    public ICollection<Address> Address { get; set; } = new List<Address>();
    public TechnicianProfile? TechnicianProfile { get; set; }
    public ICollection<ServiceRequest> ServiceRequests { get; set; } = new List<ServiceRequest>();
    public ICollection<RequestAttachment> UploadedAttachments { get; set; } = new List<RequestAttachment>();
    public ICollection<RequestStatusLog> StatusChanges { get; set; } = new List<RequestStatusLog>();
    public ICollection<Message> SentMessages { get; set; } = new List<Message>();
    public ICollection<Notification> Notifications { get; set; } = new List<Notification>();
    public ICollection<OtpVerification> OtpVerifications { get; set; } = new List<OtpVerification>();
    public string? RefreshToken { get; set; }
    public DateTime? RefreshTokenExpiryTime { get; set; }
    public int FailedLoginAttempts { get; set; } = 0;
    public DateTime? LockoutEnd { get; set; }
    public string Governorate { get; set; } = null!;
    public string Area { get; set; } = null!;
    public DateTime? DateOfBirth { get; set; }
}
