using static FixNow.Domain.Enums.Enums;


namespace FixNow.Domain.Entities;

public class TechnicianProfile : TEntity<Guid>
{
    public Guid Id { get; set; }

    public string? Bio { get; set; }

    public int YearsOfExperience { get; set; }

    public VerificationStatus VerificationStatus { get; set; }
       

    public decimal AverageRating { get; set; } = 0;

    public int TotalReviews { get; set; } = 0;

    public bool IsAvailable { get; set; } = true;


    // Navigation Property
    public User User { get; set; } = null!;
}