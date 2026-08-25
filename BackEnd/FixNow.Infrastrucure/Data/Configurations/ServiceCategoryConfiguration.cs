using FixNow.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace FixNow.Infrastructure.Data.Configurations;

public class ServiceCategoryConfiguration : IEntityTypeConfiguration<ServiceCategory>
{
    public void Configure(EntityTypeBuilder<ServiceCategory> builder)
    {
        builder.ToTable("ServiceCategories");
        builder.HasKey(c => c.Id);
        builder.Property(c => c.Id).HasColumnName("CategoryId").HasDefaultValueSql("NEWSEQUENTIALID()");

        builder.Property(c => c.Name).IsRequired().HasMaxLength(100);
        builder.HasIndex(c => c.Name).IsUnique();
        builder.Property(c => c.Description).HasMaxLength(500);
        builder.Property(c => c.IconUrl).HasMaxLength(500);
        builder.Property(c => c.IsActive).HasDefaultValue(true);
    }
}
