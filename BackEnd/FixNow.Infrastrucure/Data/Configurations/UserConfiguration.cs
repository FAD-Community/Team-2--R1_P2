using FixNow.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace FixNow.Infrastructure.Data.Configurations;

public class UserConfiguration : IEntityTypeConfiguration<User>
{
    public void Configure(EntityTypeBuilder<User> builder)
    {
        builder.ToTable("Users");
        builder.HasKey(u => u.Id);
        builder.Property(u => u.Id).HasColumnName("UserId").HasDefaultValueSql("NEWSEQUENTIALID()");

        builder.Property(u => u.FullName).IsRequired().HasMaxLength(150);

        builder.Property(u => u.Email).IsRequired().HasMaxLength(150);
        builder.HasIndex(u => u.Email).IsUnique();

        builder.Property(u => u.PhoneNumber).IsRequired().HasMaxLength(30);
        builder.HasIndex(u => u.PhoneNumber).IsUnique();

        builder.Property(u => u.PasswordHash).IsRequired();

        builder.Property(u => u.Role)
            .HasConversion<string>()
            .HasMaxLength(20)
            .IsRequired();

        builder.Property(u => u.ProfileImageUrl).HasMaxLength(500);
        builder.Property(u => u.IsActive).HasDefaultValue(true);
        builder.Property(u => u.CreatedAt).IsRequired();
        builder.Property(u => u.UpdatedAt).IsRequired();
        builder.Property(u => u.RefreshToken).HasMaxLength(500);
        builder.Property(u => u.FailedLoginAttempts).HasDefaultValue(0);
        builder.Property(u => u.Governorate).IsRequired().HasMaxLength(100);
        builder.Property(u => u.Area).IsRequired().HasMaxLength(100);
        builder.Property(u => u.DateOfBirth);
    }
}
