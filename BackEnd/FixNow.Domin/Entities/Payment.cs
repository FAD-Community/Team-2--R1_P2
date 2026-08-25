using static FixNow.Domain.Enums.Enums;

namespace FixNow.Domain.Entities;

// Future entity per SRS 4.12 — not required for MVP.
// Flagged inconsistency: SRS 3.5 describes a cash-confirmation flow as part of the MVP.
// Confirm with the team before wiring this into the API layer.
public class Payment : TEntity<Guid>
{
    public Guid Id { get; set; }
    public Guid RequestId { get; set; }
    public decimal Amount { get; set; }
    public PaymentMethod Method { get; set; }
    public PaymentStatus Status { get; set; } = PaymentStatus.Pending;
    public DateTime? PaidAt { get; set; }

    // Navigation Property
    public ServiceRequest ServiceRequest { get; set; } = null!;
}
