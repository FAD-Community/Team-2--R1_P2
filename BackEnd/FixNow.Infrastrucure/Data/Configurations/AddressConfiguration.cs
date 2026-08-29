using FixNow.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace FixNow.Infrastructure.Data.Configurations;

public class AddressConfiguration : IEntityTypeConfiguration<Address>
{
    public void Configure(EntityTypeBuilder<Address> builder)
    {
        builder.ToTable("Addresses");
        builder.HasKey(a => a.Id);
        builder.Property(a => a.Id).HasColumnName("AddressId").HasDefaultValueSql("NEWSEQUENTIALID()");

        builder.Property(a => a.Label).HasMaxLength(100);
        builder.Property(a => a.Street).IsRequired().HasMaxLength(250);
        builder.Property(a => a.City).IsRequired().HasMaxLength(100);
        builder.Property(a => a.Latitude).HasPrecision(9, 6);
        builder.Property(a => a.Longitude).HasPrecision(9, 6);
        builder.Property(a => a.IsDefault).HasDefaultValue(false);

        // Only cascade path from User -> Address. Safe.
        builder.HasOne(a => a.User)
            .WithMany(u => u.Address)
            .HasForeignKey(a => a.UserId)
            .OnDelete(DeleteBehavior.Cascade);
    }
}
