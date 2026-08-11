using FixNow.Application.Common.Dtos;
using MediatR;


namespace FixNow.Application.Features.ServiceRequestFeature.Query
{
    public record ServiceRequestQuery : IRequest<List<ServiceRequestDto>>;
    
}
