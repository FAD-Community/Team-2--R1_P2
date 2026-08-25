using FixNow.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace FixNow.Infrastructure.Data.Configurations;

public class OfferConfiguration : IEntityTypeConfiguration<Offer>
{
    public void Configure(EntityTypeBuilder<Offer> builder)
    {
        builder.ToTable("Offers");
        builder.HasKey(o => o.Id);
        builder.Property(o => o.Id).HasColumnName("OfferId").HasDefaultValueSql("NEWSEQUENTIALID()");

        builder.Property(o => o.ProposedPrice).HasPrecision(18, 2).IsRequired();
        builder.Property(o => o.Message).HasMaxLength(500);
        builder.Property(o => o.Status).HasConversion<string>().HasMaxLength(20).IsRequired();
        builder.Property(o => o.CreatedAt).IsRequired();

        builder.HasOne(o => o.ServiceRequest)
            .WithMany(r => r.Offers)
            .HasForeignKey(o => o.RequestId)
            .OnDelete(DeleteBehavior.Cascade);

        builder.HasOne(o => o.Technician)
            .WithMany(t => t.Offers)
            .HasForeignKey(o => o.TechnicianId)
            .OnDelete(DeleteBehavior.Restrict);
    }
}
