using static FixNow.Domain.Enums.Enums;

namespace FixNow.Domain.Entities;

public class ServiceRequest : TEntity<Guid>
{
    public Guid Id { get; set; }
    public Guid CustomerId { get; set; }
    public Guid CategoryId { get; set; }
    public Guid AddressId { get; set; }
    public string Description { get; set; } = null!;
    public RequestStatus Status { get; set; } = RequestStatus.Created;
    public decimal? PriceEstimate { get; set; }
    public decimal? FinalPrice { get; set; }
    public Guid? AcceptedTechnicianId { get; set; }
    public DateTime? ScheduledDate { get; set; }
    public DateTime CreatedAt { get; set; }
    public DateTime UpdatedAt { get; set; }

    // Navigation Properties
    public User Customer { get; set; } = null!;
    public ServiceCategory Category { get; set; } = null!;
    public Address Address { get; set; } = null!;
    public TechnicianProfile? AcceptedTechnician { get; set; }
    public ICollection<RequestAttachment> Attachments { get; set; } = new List<RequestAttachment>();
    public ICollection<Offer> Offers { get; set; } = new List<Offer>();
    public ICollection<RequestStatusLog> StatusLogs { get; set; } = new List<RequestStatusLog>();
    public ICollection<Message> Messages { get; set; } = new List<Message>();
    public Review? Review { get; set; }
    public Payment? Payment { get; set; }
}
