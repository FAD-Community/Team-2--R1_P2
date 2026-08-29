using static FixNow.Domain.Enums.Enums;

namespace FixNow.Domain.Entities;

public class RequestStatusLog : TEntity<Guid>
{
    public Guid Id { get; set; }
    public Guid RequestId { get; set; }
    public RequestStatus Status { get; set; }
    public Guid ChangedByUserId { get; set; }
    public string? Notes { get; set; }
    public DateTime CreatedAt { get; set; }

    // Navigation Properties
    public ServiceRequest ServiceRequest { get; set; } = null!;
    public User ChangedByUser { get; set; } = null!;
}
