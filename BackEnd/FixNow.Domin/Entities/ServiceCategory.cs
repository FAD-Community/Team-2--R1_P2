namespace FixNow.Domain.Entities
{
    public class ServiceCategory : TEntity<Guid>
    {
        public Guid Id { get; set; }
        public string Name { get; set; } = null!;
        public string? Description { get; set; }
        public string? IconUrl { get; set; }
        public bool IsActive { get; set; } = true;

        // Navigation Properties
        public ICollection<ServiceRequest> ServiceRequests { get; set; } = new List<ServiceRequest>();
        public ICollection<TechnicianCategory> TechnicianCategories { get; set; } = new List<TechnicianCategory>();
    }
}
