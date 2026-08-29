namespace FixNow.Domain.Entities;

// Future entity per SRS 4.13.
public class Notification : TEntity<Guid>
{
    public Guid Id { get; set; }
    public Guid UserId { get; set; }
    public string Title { get; set; } = null!;
    public string Message { get; set; } = null!;
    public bool IsRead { get; set; } = false;
    public DateTime CreatedAt { get; set; }

    // Navigation Property
    public User User { get; set; } = null!;
}
