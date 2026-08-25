using FixNow.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace FixNow.Infrastructure.Data.Configurations;

public class OtpVerificationConfiguration : IEntityTypeConfiguration<OtpVerification>
{
    public void Configure(EntityTypeBuilder<OtpVerification> builder)
    {
        builder.ToTable("OtpVerifications");
        builder.HasKey(o => o.Id);
        builder.Property(o => o.Id).HasColumnName("OtpId").HasDefaultValueSql("NEWSEQUENTIALID()");
        builder.Property(o => o.Code).IsRequired().HasMaxLength(10);
        builder.Property(o => o.Purpose).HasConversion<string>().HasMaxLength(20).IsRequired();
        builder.Property(o => o.ExpiresAt).IsRequired();
        builder.Property(o => o.IsUsed).HasDefaultValue(false);
        builder.Property(o => o.CreatedAt).IsRequired();

        builder.HasIndex(o => new { o.UserId, o.Purpose });

        builder.HasOne(o => o.User)
            .WithMany(u => u.OtpVerifications)
            .HasForeignKey(o => o.UserId)
            .OnDelete(DeleteBehavior.Cascade);
    }
}