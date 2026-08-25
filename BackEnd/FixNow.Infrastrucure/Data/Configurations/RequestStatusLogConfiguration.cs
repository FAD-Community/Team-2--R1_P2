using FixNow.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace FixNow.Infrastructure.Data.Configurations;

public class RequestStatusLogConfiguration : IEntityTypeConfiguration<RequestStatusLog>
{
    public void Configure(EntityTypeBuilder<RequestStatusLog> builder)
    {
        builder.ToTable("RequestStatusLogs");
        builder.HasKey(l => l.Id);
        builder.Property(l => l.Id).HasColumnName("LogId").HasDefaultValueSql("NEWSEQUENTIALID()");

        builder.Property(l => l.Status).HasConversion<string>().HasMaxLength(30).IsRequired();
        builder.Property(l => l.Notes).HasMaxLength(1000);
        builder.Property(l => l.CreatedAt).IsRequired();

        builder.HasOne(l => l.ServiceRequest)
            .WithMany(r => r.StatusLogs)
            .HasForeignKey(l => l.RequestId)
            .OnDelete(DeleteBehavior.Cascade);

        builder.HasOne(l => l.ChangedByUser)
            .WithMany(u => u.StatusChanges)
            .HasForeignKey(l => l.ChangedByUserId)
            .OnDelete(DeleteBehavior.Restrict);
    }
}
