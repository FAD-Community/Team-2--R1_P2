using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

using FixNow.Application.Features.Technician.GetMyKycDocuments;
using FixNow.Application.Features.Technician.UploadKycDocument;
using MediatR;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;
using static FixNow.Domain.Enums.Enums;


namespace FixNow.Api.Controllers;

[ApiController]
[Route("api/technicians")]
[Authorize(Roles = "Technician")]
public class TechniciansController : ControllerBase
{
    private readonly IMediator _mediator;

    public TechniciansController(IMediator mediator)
    {
        _mediator = mediator;
    }

    private Guid CurrentUserId => Guid.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier)!);

    [HttpPost("me/kyc-documents")]
    [Consumes("multipart/form-data")]
    public async Task<IActionResult> UploadKycDocument([FromForm] DocumentType type, IFormFile file)
    {
        var command = new UploadKycDocumentCommand(CurrentUserId, type, file);
        var result = await _mediator.Send(command);
        return StatusCode(result.StatusCode, result);
    }

    [HttpGet("me/kyc-documents")]
    public async Task<IActionResult> GetMyKycDocuments()
    {
        var result = await _mediator.Send(new GetMyKycDocumentsQuery(CurrentUserId));
        return StatusCode(result.StatusCode, result);
    }
}