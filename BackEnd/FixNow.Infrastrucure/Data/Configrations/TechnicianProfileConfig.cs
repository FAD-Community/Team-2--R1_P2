using FixNow.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace FixNow.Infrastructure.Data.Configrations
{
   
        public class TechnicianProfileConfiguration
    : IEntityTypeConfiguration<TechnicianProfile>
        {
            public void Configure(EntityTypeBuilder<TechnicianProfile> builder)
            {
                builder.ToTable("TechnicianProfile");

                builder.HasKey(x => x.Id);

                builder.Property(x => x.Id)
                    .HasColumnName("TechnicianId");

                builder.Property(x => x.Bio);

                builder.Property(x => x.YearsOfExperience)
                    .IsRequired();

                builder.Property(x => x.VerificationStatus)
                    .IsRequired()
                    .HasConversion<string>();

                builder.Property(x => x.AverageRating)
                    .HasPrecision(18, 2)
                    .HasDefaultValue(0);

                builder.Property(x => x.TotalReviews)
                    .HasDefaultValue(0);

                builder.Property(x => x.IsAvailable)
                    .HasDefaultValue(true);

                // User 1 ---- 0..1 TechnicianProfile
                builder.HasOne(x => x.User)
                    .WithOne(x => x.TechnicianProfile)
                    .HasForeignKey<TechnicianProfile>(x => x.Id)
                    .OnDelete(DeleteBehavior.NoAction);
            }
        }
    
}
