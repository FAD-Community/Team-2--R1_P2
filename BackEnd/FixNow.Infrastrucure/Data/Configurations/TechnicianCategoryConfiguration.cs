using FixNow.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace FixNow.Infrastructure.Data.Configurations;

public class TechnicianCategoryConfiguration : IEntityTypeConfiguration<TechnicianCategory>
{
    public void Configure(EntityTypeBuilder<TechnicianCategory> builder)
    {
        builder.ToTable("TechnicianCategories");
        builder.HasKey(tc => new { tc.TechnicianId, tc.CategoryId });

        // Junction table — cascading both sides is fine, the row is meaningless without either parent.
        builder.HasOne(tc => tc.TechnicianProfile)
            .WithMany(t => t.TechnicianCategories)
            .HasForeignKey(tc => tc.TechnicianId)
            .OnDelete(DeleteBehavior.Cascade);

        builder.HasOne(tc => tc.ServiceCategory)
            .WithMany(c => c.TechnicianCategories)
            .HasForeignKey(tc => tc.CategoryId)
            .OnDelete(DeleteBehavior.Cascade);
    }
}
