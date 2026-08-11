
using FixNow.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace FixNow.Infrastructure.Configurations;

public class AddressConfiguration
    : IEntityTypeConfiguration<Address>
{
    public void Configure(EntityTypeBuilder<Address> builder)
    {
        builder.ToTable("Addresses");

        // Primary Key
        builder.HasKey(x => x.Id);
      builder.Property(x => x.Id)
    .HasColumnName("AddressId");
        builder.Property(x => x.Id).ValueGeneratedOnAdd()
    .HasDefaultValueSql("NEWSEQUENTIALID()");


        // Properties
        builder.Property(x => x.Label)
            .HasMaxLength(100);

        builder.Property(x => x.Street)
            .IsRequired()
            .HasMaxLength(250);

        builder.Property(x => x.City)
            .IsRequired()
            .HasMaxLength(100);

        builder.Property(x => x.Latitude)
            .IsRequired()
            .HasPrecision(9, 6);

        builder.Property(x => x.Longitude)
            .IsRequired()
            .HasPrecision(9, 6);

        builder.Property(x => x.IsDefault)
            .IsRequired()
            .HasDefaultValue(false);


        // User -> Addresses
        builder.HasOne(x => x.User)
            .WithMany(x => x.Address)
            .HasForeignKey(x => x.UserId)
            .OnDelete(DeleteBehavior.Cascade);


        // Index
        builder.HasIndex(x => x.UserId);
    }
}