using FixNow.Infrastructure.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using Microsoft.Extensions.Configuration;

public class AppDbContextFactory : IDesignTimeDbContextFactory<AppDbContext>
{
    public AppDbContext CreateDbContext(string[] args)
    {
        var optionsBuilder = new DbContextOptionsBuilder<AppDbContext>();

        optionsBuilder.UseSqlServer("Server=db63267.public.databaseasp.net;Database=db63267;User Id=db63267;Password=5o+FJ6q@m!7H;Encrypt=True;TrustServerCertificate=True;MultipleActiveResultSets=True;");

        return new AppDbContext(optionsBuilder.Options);
    }
}