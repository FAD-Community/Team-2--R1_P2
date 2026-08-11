

using AutoMapper;
using FixNow.Application.Common.Dtos;
using FixNow.Domain.Entities;
namespace Task1.implementation
{
   public class MappingProfile:Profile
    {
        public MappingProfile()
        {
            CreateMap<ServiceRequest, ServiceRequestDto>();
                  }
    }
}
