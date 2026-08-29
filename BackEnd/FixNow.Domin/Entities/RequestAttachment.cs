using static FixNow.Domain.Enums.Enums;

namespace FixNow.Domain.Entities;

public class RequestAttachment : TEntity<Guid>
{
    public Guid Id { get; set; }
    public Guid RequestId { get; set; }
    public string FileUrl { get; set; } = null!;
    public AttachmentType Type { get; set; }
    public Guid UploadedByUserId { get; set; }
    public DateTime UploadedAt { get; set; }

    // Navigation Properties
    public ServiceRequest ServiceRequest { get; set; } = null!;
    public User UploadedByUser { get; set; } = null!;
}
