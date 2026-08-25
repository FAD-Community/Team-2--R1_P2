using FixNow.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace FixNow.Infrastructure.Data.Configurations;

public class TechnicianProfileConfiguration : IEntityTypeConfiguration<TechnicianProfile>
{
    public void Configure(EntityTypeBuilder<TechnicianProfile> builder)
    {
        builder.ToTable("TechnicianProfile");
        builder.HasKey(t => t.Id);
        // Shared PK — not auto-generated, it always equals User.Id
        builder.Property(t => t.Id).HasColumnName("TechnicianId").ValueGeneratedNever();

        builder.Property(t => t.Bio);
        builder.Property(t => t.YearsOfExperience);

        builder.Property(t => t.VerificationStatus)
            .HasConversion<string>()
            .HasMaxLength(20)
            .IsRequired();

        builder.Property(t => t.AverageRating).HasPrecision(18, 2).HasDefaultValue(0);
        builder.Property(t => t.TotalReviews).HasDefaultValue(0);
        builder.Property(t => t.IsAvailable).HasDefaultValue(true);

        // Shared Primary Key relationship: TechnicianId == UserId (1-to-0..1)
        builder.HasOne(t => t.User)
            .WithOne(u => u.TechnicianProfile)
            .HasForeignKey<TechnicianProfile>(t => t.Id)
            .OnDelete(DeleteBehavior.Cascade);
    }
}
