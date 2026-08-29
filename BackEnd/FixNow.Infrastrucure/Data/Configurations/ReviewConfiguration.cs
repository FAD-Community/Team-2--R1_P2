using FixNow.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace FixNow.Infrastructure.Data.Configurations;

public class ReviewConfiguration : IEntityTypeConfiguration<Review>
{
    public void Configure(EntityTypeBuilder<Review> builder)
    {
        builder.ToTable("Reviews");
        builder.HasKey(r => r.Id);
        builder.Property(r => r.Id).HasColumnName("ReviewId").HasDefaultValueSql("NEWSEQUENTIALID()");

        builder.Property(r => r.Rating).IsRequired();
        builder.ToTable(t => t.HasCheckConstraint("CK_Review_Rating", "[Rating] >= 1 AND [Rating] <= 5"));

        builder.Property(r => r.Comment).HasMaxLength(1000);
        builder.Property(r => r.CreatedAt).IsRequired();

        // DR-07 / one review per request — enforced with a unique FK.
        builder.HasOne(r => r.ServiceRequest)
            .WithOne(sr => sr.Review)
            .HasForeignKey<Review>(r => r.RequestId)
            .OnDelete(DeleteBehavior.Restrict);

        builder.HasOne(r => r.Customer)
            .WithMany()
            .HasForeignKey(r => r.CustomerId)
            .OnDelete(DeleteBehavior.Restrict);

        builder.HasOne(r => r.Technician)
            .WithMany(t => t.Reviews)
            .HasForeignKey(r => r.TechnicianId)
            .OnDelete(DeleteBehavior.Restrict);
    }
}
