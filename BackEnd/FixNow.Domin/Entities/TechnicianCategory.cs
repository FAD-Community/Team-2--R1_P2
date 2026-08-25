namespace FixNow.Domain.Entities;

// Junction entity — many-to-many between TechnicianProfile and ServiceCategory.
// Composite primary key (TechnicianId, CategoryId) — no single Guid Id, so it does not implement TEntity<Guid>.
public class TechnicianCategory
{
    public Guid TechnicianId { get; set; }
    public Guid CategoryId { get; set; }

    // Navigation Properties
    public TechnicianProfile TechnicianProfile { get; set; } = null!;
    public ServiceCategory ServiceCategory { get; set; } = null!;
}
