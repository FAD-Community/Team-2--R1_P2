using FixNow.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace FixNow.Infrastructure.Configurations;

public class ServiceRequestConfiguration
    : IEntityTypeConfiguration<ServiceRequest>
{
    public void Configure(EntityTypeBuilder<ServiceRequest> builder)
    {
        builder.ToTable("ServiceRequests");

        // Primary Key
        builder.HasKey(x => x.Id);
        builder.Property(x => x.Id)
        .HasColumnName("RequestId");
        builder.Property(x => x.Id).ValueGeneratedOnAdd()
            .HasDefaultValueSql("NEWSEQUENTIALID()");

        // Properties
        builder.Property(x => x.Description)
            .IsRequired();

        builder.Property(x => x.Status)
            .IsRequired()
            .HasConversion<string>();

        builder.Property(x => x.PriceEstimate)
            .HasPrecision(18, 2);

        builder.Property(x => x.FinalPrice)
            .HasPrecision(18, 2);

        builder.Property(x => x.CreatedAt)
            .IsRequired();

        builder.Property(x => x.UpdatedAt)
            .IsRequired();


        // Customer
        builder.HasOne(x => x.Customer)
            .WithMany()
            .HasForeignKey(x => x.CustomerId)
            .OnDelete(DeleteBehavior.NoAction);


        

        // Accepted Technician
        builder.HasOne(x => x.AcceptedTechnician)
            .WithMany()
            .HasForeignKey(x => x.AcceptedTechnicianId)
            .OnDelete(DeleteBehavior.NoAction);


        // Indexes
        builder.HasIndex(x => x.CustomerId);

        builder.HasIndex(x => x.CategoryId);

        builder.HasIndex(x => x.AddressId);

        builder.HasIndex(x => x.AcceptedTechnicianId);

        builder.HasIndex(x => x.Status);
    }
}