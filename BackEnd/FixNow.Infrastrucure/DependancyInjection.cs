using FixNow.Application.Abstractions;
using FixNow.Infrastructure.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

using FixNow.Infrastructure.Reposatories;


namespace FixNow.Infrastructure;

public static class DependencyInjection
{
    public static IServiceCollection AddInfrastructure(
        this IServiceCollection services,
        IConfiguration configuration)
    {
        services.AddDbContext<AppDbContext>(x =>
            x.UseSqlServer(configuration.GetConnectionString("myconec")));

        // Unit Of Work
        services.AddScoped<IUnitOfWork, UnitOfWork>();
        return services;
    }
}