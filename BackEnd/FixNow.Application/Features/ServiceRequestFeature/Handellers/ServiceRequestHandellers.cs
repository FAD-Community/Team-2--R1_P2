using AutoMapper;
using MediatR;
using FixNow.Application.Abstractions;
using FixNow.Application.Common.Dtos;
using FixNow.Application.Features.ServiceRequestFeature.Query;
using FixNow.Domain.Entities;


namespace FixNow.Application.Features.ServiceRequestFeature.Handellers
{
    public class ServiceRequestHandellers:IRequestHandler<ServiceRequestQuery, List<ServiceRequestDto>>
    {
        private readonly IUnitOfWork _unitofwork;
        private readonly IMapper _mapper;
        public ServiceRequestHandellers(IUnitOfWork unitofwork, IMapper mapper)
        {
            _unitofwork = unitofwork;
            _mapper = mapper;
        }
        public async Task<List<ServiceRequestDto>> Handle(ServiceRequestQuery request, CancellationToken cancellationToken)
        {
            var Repos=_unitofwork.GetRepo<ServiceRequest,Guid>();
            var serviceRequest = await Repos.GetAll();

            var result = _mapper.Map<List<ServiceRequestDto>>(serviceRequest);
            return result;
        }
    }
}
