using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using FixNow.Application.Abstractions;
using FixNow.Application.Common;
using FixNow.Domain;
using FixNow.Domain.Entities;
using MediatR;

namespace FixNow.Application.Features.Technician.UploadKycDocument;

public class UploadKycDocumentCommandHandler : IRequestHandler<UploadKycDocumentCommand, ApiResponse<string>>
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly IFileStorageService _fileStorage;

    public UploadKycDocumentCommandHandler(IUnitOfWork unitOfWork, IFileStorageService fileStorage)
    {
        _unitOfWork = unitOfWork;
        _fileStorage = fileStorage;
    }

    public async Task<ApiResponse<string>> Handle(UploadKycDocumentCommand request, CancellationToken cancellationToken)
    {
        var technicianRepo = _unitOfWork.GetRepo<TechnicianProfile, Guid>();
        var technician = await technicianRepo.GetById(request.TechnicianId);

        if (technician is null)
            return ApiResponse<string>.FailureResponse("Technician profile not found.", 404);

        var fileUrl = await _fileStorage.SaveFileAsync(request.File, "kyc");

        var document = new TechnicianDocument
        {
            Id = Guid.NewGuid(),
            TechnicianId = request.TechnicianId,
            Type = request.Type,
            FileUrl = fileUrl,
            UploadedAt = DateTime.UtcNow
        };

        var documentRepo = _unitOfWork.GetRepo<TechnicianDocument, Guid>();
        await documentRepo.Add(document);
        await _unitOfWork.SaveChangesAsync();

        return ApiResponse<string>.SuccessResponse(fileUrl, "Document uploaded successfully.", 201);
    }
}