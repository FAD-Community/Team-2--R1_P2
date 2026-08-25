using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using static FixNow.Domain.Enums.Enums;

namespace FixNow.Application.Common.Dtos;

public class TechnicianDocumentDto
{
    public Guid Id { get; set; }
    public DocumentType Type { get; set; }
    public string FileUrl { get; set; } = null!;
    public DateTime UploadedAt { get; set; }
}