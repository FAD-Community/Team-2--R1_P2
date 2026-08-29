using FixNow.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace FixNow.Infrastructure.Data.Configurations;

// Future entity per SRS 4.12 — table is created now (matches ERD) but not
// wired into any Command/Query yet. See Payment.cs for the flagged note.
public class PaymentConfiguration : IEntityTypeConfiguration<Payment>
{
    public void Configure(EntityTypeBuilder<Payment> builder)
    {
        builder.ToTable("Payments");
        builder.HasKey(p => p.Id);
        builder.Property(p => p.Id).HasColumnName("PaymentId").HasDefaultValueSql("NEWSEQUENTIALID()");

        builder.Property(p => p.Amount).HasPrecision(18, 2).IsRequired();
        builder.Property(p => p.Method).HasConversion<string>().HasMaxLength(20).IsRequired();
        builder.Property(p => p.Status).HasConversion<string>().HasMaxLength(20).IsRequired();

        builder.HasOne(p => p.ServiceRequest)
            .WithOne(sr => sr.Payment)
            .HasForeignKey<Payment>(p => p.RequestId)
            .OnDelete(DeleteBehavior.Restrict);
    }
}
