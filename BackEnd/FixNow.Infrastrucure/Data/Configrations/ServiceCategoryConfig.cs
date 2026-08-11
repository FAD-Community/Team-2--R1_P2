
using FixNow.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace FixNow.Infrastructure.Configurations;

public class ServiceCategoryConfiguration
    : IEntityTypeConfiguration<ServiceCategory>
{
    public void Configure(EntityTypeBuilder<ServiceCategory> builder)
    {
        builder.ToTable("ServiceCategories");

        // Primary Key
        builder.HasKey(x => x.Id);
        builder.Property(x => x.Id)
   .HasColumnName("CategoryId");
        builder.Property(x => x.Id).ValueGeneratedOnAdd()
    .HasDefaultValueSql("NEWSEQUENTIALID()");

        // Properties
        builder.Property(x => x.Name)
            .IsRequired()
            .HasMaxLength(100);

        builder.Property(x => x.Description)
            .HasMaxLength(500);

        builder.Property(x => x.IconUrl)
            .HasMaxLength(500);

        builder.Property(x => x.IsActive)
            .IsRequired()
            .HasDefaultValue(true);


        // Unique Name
        builder.HasIndex(x => x.Name)
            .IsUnique();


        // Relationship
        builder.HasMany(x => x.ServiceRequests)
            .WithOne(x => x.Category)
            .HasForeignKey(x => x.CategoryId)
            .OnDelete(DeleteBehavior.NoAction);
    }
}