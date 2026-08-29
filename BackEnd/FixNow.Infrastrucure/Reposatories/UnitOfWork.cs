using FixNow.Application.Abstractions;
using FixNow.Domain;
using FixNow.Infrastructure.Data;
using FixNow.Infrastructure.Reposatories;

namespace FixNow.Infrastrucure.Reposatories
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly AppDbContext _context;

        public UnitOfWork(AppDbContext context)
        {
            _context = context;
        }

        public IGenericRepo<TEntity, TKey> GetRepo<TEntity, TKey>() where TEntity : class, TEntity<TKey>
        {
            return new GenericRepo<TEntity, TKey>(_context);
        }

        public async Task SaveChangesAsync()
        {
            await _context.SaveChangesAsync();
        }
    }
}
