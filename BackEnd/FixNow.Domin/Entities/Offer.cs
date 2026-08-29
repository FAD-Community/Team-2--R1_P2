using static FixNow.Domain.Enums.Enums;

namespace FixNow.Domain.Entities;

public class Offer : TEntity<Guid>
{
    public Guid Id { get; set; }
    public Guid RequestId { get; set; }
    public Guid TechnicianId { get; set; }
    public decimal ProposedPrice { get; set; }
    public string? Message { get; set; }
    public OfferStatus Status { get; set; } = OfferStatus.Pending;
    public DateTime CreatedAt { get; set; }

    // Navigation Properties
    public ServiceRequest ServiceRequest { get; set; } = null!;
    public TechnicianProfile Technician { get; set; } = null!;
}
