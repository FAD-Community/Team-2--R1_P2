
using static FixNow.Domain.Enums.Enums;

namespace FixNow.Domain.Entities
{
    public class User : TEntity<Guid>
    {
        public Guid Id { get; set; }

        public string FullName { get; set; } = null!;

        public string Email { get; set; } = null!;

        public string PhoneNumber { get; set; } = null!;

        public string PasswordHash { get; set; } = null!;

        public Role Role { get; set; }

        public string? ProfileImageUrl { get; set; }

        public bool IsActive { get; set; } = true;

        public DateTime CreatedAt { get; set; }

        public DateTime UpdatedAt { get; set; }


        // Navigation Properties

        public ICollection<ServiceRequest> ServiceRequests { get; set; }
            = new List<ServiceRequest>();
        public ICollection<Address> Address { get; set; }
            = new List<Address>();
        public TechnicianProfile? TechnicianProfile { get; set; }
    }
}
