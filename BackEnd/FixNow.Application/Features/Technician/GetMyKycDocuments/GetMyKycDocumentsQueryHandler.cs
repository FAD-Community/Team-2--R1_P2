using FixNow.Application.Abstractions;
using FixNow.Application.Common;
using FixNow.Application.Common.Dtos;
using FixNow.Domain;
using FixNow.Domain.Entities;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FixNow.Application.Features.Technician.GetMyKycDocuments;

public class GetMyKycDocumentsQueryHandler
    : IRequestHandler<GetMyKycDocumentsQuery, ApiResponse<List<TechnicianDocumentDto>>>
{
    private readonly IUnitOfWork _unitOfWork;

    public GetMyKycDocumentsQueryHandler(IUnitOfWork unitOfWork)
    {
        _unitOfWork = unitOfWork;
    }

    public async Task<ApiResponse<List<TechnicianDocumentDto>>> Handle(
        GetMyKycDocumentsQuery request, CancellationToken cancellationToken)
    {
        var documentRepo = _unitOfWork.GetRepo<TechnicianDocument, Guid>();
        var documents = await documentRepo.FindAsync(d => d.TechnicianId == request.TechnicianId);

        var dtos = documents.Select(d => new TechnicianDocumentDto
        {
            Id = d.Id,
            Type = d.Type,
            FileUrl = d.FileUrl,
            UploadedAt = d.UploadedAt
        }).ToList();

        return ApiResponse<List<TechnicianDocumentDto>>.SuccessResponse(dtos);
    }
}