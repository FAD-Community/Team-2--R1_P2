using static FixNow.Domain.Enums.Enums;

namespace FixNow.Domain.Entities;

public class OtpVerification : TEntity<Guid>
{
    public Guid Id { get; set; }
    public Guid UserId { get; set; }
    public string Code { get; set; } = null!;
    public OtpPurpose Purpose { get; set; }
    public DateTime ExpiresAt { get; set; }
    public bool IsUsed { get; set; } = false;
    public DateTime CreatedAt { get; set; }

    // Navigation Property
    public User User { get; set; } = null!;
}