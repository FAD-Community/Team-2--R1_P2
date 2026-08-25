using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using static FixNow.Domain.Enums.Enums;

namespace FixNow.Domain.Entities;

public class TechnicianDocument : TEntity<Guid>
{
    public Guid Id { get; set; }
    public Guid TechnicianId { get; set; }
    public DocumentType Type { get; set; }
    public string FileUrl { get; set; } = null!;
    public DateTime UploadedAt { get; set; }

    // Navigation Property
    public TechnicianProfile Technician { get; set; } = null!;
}