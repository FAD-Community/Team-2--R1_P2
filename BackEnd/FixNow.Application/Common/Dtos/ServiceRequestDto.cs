using System;
using System.Collections.Generic;
using System.Text;
using System.Text.Json.Serialization;
using static FixNow.Domain.Enums.Enums;

namespace FixNow.Application.Common.Dtos
{
    
    public class ServiceRequestDto
    {
        public Guid CustomerId { get; set; }

        public Guid CategoryId { get; set; }

        public Guid AddressId { get; set; }

        public string Description { get; set; } = null!;

        public string Status { get; set; }

        public decimal? PriceEstimate { get; set; }

        public decimal? FinalPrice { get; set; }

        public Guid? AcceptedTechnicianId { get; set; }

        public DateTime? ScheduledDate { get; set; }
    }
}
