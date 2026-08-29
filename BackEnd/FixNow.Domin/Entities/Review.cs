namespace FixNow.Domain.Entities;

public class Review : TEntity<Guid>
{
    public Guid Id { get; set; }
    public Guid RequestId { get; set; }
    public Guid CustomerId { get; set; }
    public Guid TechnicianId { get; set; }
    public int Rating { get; set; }
    public string? Comment { get; set; }
    public DateTime CreatedAt { get; set; }

    // Navigation Properties
    public ServiceRequest ServiceRequest { get; set; } = null!;
    public User Customer { get; set; } = null!;
    public TechnicianProfile Technician { get; set; } = null!;
}
