using static FixNow.Domain.Enums.Enums;

namespace FixNow.Domain.Entities;

public class TechnicianProfile : TEntity<Guid>
{
    // Shared primary key with User (1-to-0..1): Id == User.Id
    public Guid Id { get; set; }
    public string? Bio { get; set; }
    public int YearsOfExperience { get; set; }
    public VerificationStatus VerificationStatus { get; set; } = VerificationStatus.Pending;
    public decimal AverageRating { get; set; } = 0;
    public int TotalReviews { get; set; } = 0;
    public bool IsAvailable { get; set; } = true;

    // Navigation Properties
    public User User { get; set; } = null!;
    public ICollection<TechnicianCategory> TechnicianCategories { get; set; } = new List<TechnicianCategory>();
    public ICollection<Offer> Offers { get; set; } = new List<Offer>();
    public ICollection<Review> Reviews { get; set; } = new List<Review>();
    public ICollection<ServiceRequest> AcceptedRequests { get; set; } = new List<ServiceRequest>();
    public ICollection<TechnicianDocument> Documents { get; set; } = new List<TechnicianDocument>();
}
