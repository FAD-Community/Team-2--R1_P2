using FixNow.Application.Abstractions;
using FixNow.Domain;
using FixNow.Infrastructure.Data;
using Microsoft.EntityFrameworkCore;




namespace FixNow.Infrastructure.Reposatories
{
    
    public class GenericRepo<TEntity, TKey> : IGenericRepo<TEntity, TKey> where TEntity : class, TEntity<TKey>
    {
        private readonly DbSet<TEntity> _dbSet;
       
        public GenericRepo(AppDbContext context)
        {
            _dbSet = context.Set<TEntity>();
        }

        public async Task<IReadOnlyList<TEntity>> GetAll()
        {
           return await _dbSet.AsNoTracking().ToListAsync();
        }

        public async Task<TEntity> GetById(TKey id)
        {
           return await _dbSet.FindAsync(id);
        }
        public async Task Add(TEntity item)
        {
            await _dbSet.AddAsync(item);

        }

        public void delete(TEntity item)
        {
            _dbSet.Remove(item);
        }

        public void update(TEntity item)
        {
            _dbSet.Update(item);
        }

       
    }
}
