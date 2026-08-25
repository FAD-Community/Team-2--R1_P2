using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using FixNow.Application.Common;
using MediatR;
using Microsoft.AspNetCore.Http;
using static FixNow.Domain.Enums.Enums;

namespace FixNow.Application.Features.Technician.UploadKycDocument;

public record UploadKycDocumentCommand(Guid TechnicianId, DocumentType Type, IFormFile File)
    : IRequest<ApiResponse<string>>;