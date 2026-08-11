using AutoMapper;
using MediatR;
using Microsoft.Extensions.DependencyInjection;
using System.Reflection;
using Task1.implementation;

namespace FixNow.Application;

public static class DependencyInjection
{
    public static IServiceCollection AddApplication(
        this IServiceCollection services)
    {
        // MediatR
        services.AddMediatR(Assembly.GetExecutingAssembly());


        // AutoMappe
        services.AddAutoMapper(Cfg => { },typeof(MappingProfile).Assembly);

        return services;
    }
}