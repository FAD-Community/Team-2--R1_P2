namespace FixNow.Domain.Entities;

public class Message : TEntity<Guid>
{
    public Guid Id { get; set; }
    public Guid RequestId { get; set; }
    public Guid SenderId { get; set; }
    public string Content { get; set; } = null!;
    public bool IsRead { get; set; } = false;
    public DateTime SentAt { get; set; }

    // Navigation Properties
    public ServiceRequest ServiceRequest { get; set; } = null!;
    public User Sender { get; set; } = null!;
}
