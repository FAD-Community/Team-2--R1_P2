namespace FixNow.Domain.Entities
{
    public class Address : TEntity<Guid>
    {
        public Guid Id { get; set; }
        public Guid UserId { get; set; }
        public string? Label { get; set; }
        public string Street { get; set; } = null!;
        public string City { get; set; } = null!;
        public decimal Latitude { get; set; }
        public decimal Longitude { get; set; }
        public bool IsDefault { get; set; } = false;

        // Navigation Properties
        public User User { get; set; } = null!;
        public ICollection<ServiceRequest> ServiceRequests { get; set; } = new List<ServiceRequest>();
    }
}
