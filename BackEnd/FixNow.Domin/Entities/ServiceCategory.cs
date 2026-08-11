

namespace FixNow.Domain.Entities
{
    public class ServiceCategory : TEntity<Guid>
    {
        
        public Guid Id {  get; set; }
        public string Name { get; set; } = null!;

        public string? Description { get; set; }

        public string? IconUrl { get; set; }

        public bool IsActive { get; set; } = true;


        // Navigation Property
        public ICollection<ServiceRequest> ServiceRequests { get; set; }
            = new List<ServiceRequest>();
    }
}
