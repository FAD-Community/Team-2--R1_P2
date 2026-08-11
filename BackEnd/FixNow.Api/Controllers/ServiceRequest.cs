using FixNow.Application.Common.Dtos;
using FixNow.Application.Features.ServiceRequestFeature.Query;
using MediatR;
using Microsoft.AspNetCore.Mvc;
using Task1.Response;
namespace FixNow.Api.Controllers
{
    [Route("api/[controller]")]
    [Produces("application/json")]
    [ApiController]
    public class ServiceRequest : ControllerBase
    {
        private readonly IMediator _mediator;
        public ServiceRequest(IMediator mediator)
        {
            _mediator = mediator;
        }
        [HttpGet]
        public async Task<ActionResult<ApiResponse<List<ServiceRequestDto>>>> GetServiceRequests() {
            var serviceRequests = await _mediator.Send(new ServiceRequestQuery());
            if (serviceRequests.Count==0) {
                return NotFound(new ApiResponse<List<ServiceRequestDto>>("No service requests found",new List<string> { "NotFound" },404));

            }
            return Ok(new ApiResponse<List<ServiceRequestDto>>(
               serviceRequests,
            "Service requests retrieved successfully"
                ));
                
        }
    }
}
