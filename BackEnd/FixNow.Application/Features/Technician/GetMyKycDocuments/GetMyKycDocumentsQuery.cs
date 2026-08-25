using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using FixNow.Application.Common;
using FixNow.Application.Common.Dtos;
using MediatR;

namespace FixNow.Application.Features.Technician.GetMyKycDocuments;

public record GetMyKycDocumentsQuery(Guid TechnicianId) : IRequest<ApiResponse<List<TechnicianDocumentDto>>>;