using FixNow.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace FixNow.Infrastructure.Data.Configurations;

public class ServiceRequestConfiguration : IEntityTypeConfiguration<ServiceRequest>
{
    public void Configure(EntityTypeBuilder<ServiceRequest> builder)
    {
        builder.ToTable("ServiceRequests");
        builder.HasKey(r => r.Id);
        builder.Property(r => r.Id).HasColumnName("RequestId").HasDefaultValueSql("NEWSEQUENTIALID()");

        builder.Property(r => r.Description).IsRequired();

        builder.Property(r => r.Status)
            .HasConversion<string>()
            .HasMaxLength(30)
            .IsRequired();
        builder.HasIndex(r => r.Status);

        builder.Property(r => r.PriceEstimate).HasPrecision(18, 2);
        builder.Property(r => r.FinalPrice).HasPrecision(18, 2);
        builder.Property(r => r.CreatedAt).IsRequired();
        builder.Property(r => r.UpdatedAt).IsRequired();

        // Every relationship declared exactly ONCE — this is what fixes the
        // duplicate shadow-FK bug (AddressId1 / ServiceCategoryId) from before.
        // All set to Restrict: ServiceRequest is historical data (DR-13 soft
        // delete) and must never be silently deleted via a parent cascade.
        builder.HasOne(r => r.Customer)
            .WithMany(u => u.ServiceRequests)
            .HasForeignKey(r => r.CustomerId)
            .OnDelete(DeleteBehavior.Restrict);

        builder.HasOne(r => r.Category)
            .WithMany(c => c.ServiceRequests)
            .HasForeignKey(r => r.CategoryId)
            .OnDelete(DeleteBehavior.Restrict);

        builder.HasOne(r => r.Address)
            .WithMany(a => a.ServiceRequests)
            .HasForeignKey(r => r.AddressId)
            .OnDelete(DeleteBehavior.Restrict);

        builder.HasOne(r => r.AcceptedTechnician)
            .WithMany(t => t.AcceptedRequests)
            .HasForeignKey(r => r.AcceptedTechnicianId)
            .OnDelete(DeleteBehavior.Restrict);
    }
}
