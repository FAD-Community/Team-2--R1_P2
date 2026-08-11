

using static FixNow.Domain.Enums.Enums;
namespace FixNow.Domain.Entities;


public class ServiceRequest : TEntity<Guid>
{
    public Guid Id { get; set; }

    public Guid CustomerId { get; set; }

    public Guid CategoryId { get; set; }

    public Guid AddressId { get; set; }

    public string Description { get; set; } = null!;

    public RequestStatus Status { get; set; }

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
}