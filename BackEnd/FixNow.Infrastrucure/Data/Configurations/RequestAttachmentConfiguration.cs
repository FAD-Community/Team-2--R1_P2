using FixNow.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace FixNow.Infrastructure.Data.Configurations;

public class RequestAttachmentConfiguration : IEntityTypeConfiguration<RequestAttachment>
{
    public void Configure(EntityTypeBuilder<RequestAttachment> builder)
    {
        builder.ToTable("RequestAttachments");
        builder.HasKey(a => a.Id);
        builder.Property(a => a.Id).HasColumnName("AttachmentId").HasDefaultValueSql("NEWSEQUENTIALID()");

        builder.Property(a => a.FileUrl).IsRequired().HasMaxLength(1000);
        builder.Property(a => a.Type).HasConversion<string>().HasMaxLength(30).IsRequired();
        builder.Property(a => a.UploadedAt).IsRequired();

        // One and only cascade path into this table (via ServiceRequest).
        builder.HasOne(a => a.ServiceRequest)
            .WithMany(r => r.Attachments)
            .HasForeignKey(a => a.RequestId)
            .OnDelete(DeleteBehavior.Cascade);

        builder.HasOne(a => a.UploadedByUser)
            .WithMany(u => u.UploadedAttachments)
            .HasForeignKey(a => a.UploadedByUserId)
            .OnDelete(DeleteBehavior.Restrict);
    }
}
