using FixNow.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace FixNow.Infrastructure.Data.Configurations;

public class MessageConfiguration : IEntityTypeConfiguration<Message>
{
    public void Configure(EntityTypeBuilder<Message> builder)
    {
        builder.ToTable("Messages");
        builder.HasKey(m => m.Id);
        builder.Property(m => m.Id).HasColumnName("MessageId").HasDefaultValueSql("NEWSEQUENTIALID()");

        builder.Property(m => m.Content).IsRequired().HasMaxLength(2000);
        builder.Property(m => m.IsRead).HasDefaultValue(false);
        builder.Property(m => m.SentAt).IsRequired();

        builder.HasOne(m => m.ServiceRequest)
            .WithMany(r => r.Messages)
            .HasForeignKey(m => m.RequestId)
            .OnDelete(DeleteBehavior.Cascade);

        builder.HasOne(m => m.Sender)
            .WithMany(u => u.SentMessages)
            .HasForeignKey(m => m.SenderId)
            .OnDelete(DeleteBehavior.Restrict);
    }
}
