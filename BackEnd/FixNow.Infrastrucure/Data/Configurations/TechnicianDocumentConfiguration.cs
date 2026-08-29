using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using FixNow.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace FixNow.Infrastructure.Data.Configurations;

public class TechnicianDocumentConfiguration : IEntityTypeConfiguration<TechnicianDocument>
{
    public void Configure(EntityTypeBuilder<TechnicianDocument> builder)
    {
        builder.ToTable("TechnicianDocuments");
        builder.HasKey(d => d.Id);
        builder.Property(d => d.Id).HasColumnName("DocumentId").HasDefaultValueSql("NEWSEQUENTIALID()");
        builder.Property(d => d.Type).HasConversion<string>().HasMaxLength(30).IsRequired();
        builder.Property(d => d.FileUrl).IsRequired().HasMaxLength(1000);
        builder.Property(d => d.UploadedAt).IsRequired();

        builder.HasOne(d => d.Technician)
            .WithMany(t => t.Documents)
            .HasForeignKey(d => d.TechnicianId)
            .OnDelete(DeleteBehavior.Cascade);
    }
}