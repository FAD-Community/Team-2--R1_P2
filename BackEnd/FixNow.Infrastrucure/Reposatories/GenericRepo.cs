using FixNow.Application.Abstractions;
using FixNow.Domain;
using FixNow.Infrastructure.Data;
using Microsoft.EntityFrameworkCore;
using System.Linq.Expressions;




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

        public async Task<bool> AnyAsync(Expression<Func<TEntity, bool>> predicate)
            => await _dbSet.AnyAsync(predicate);

        public async Task<TEntity?> FindOneAsync(Expression<Func<TEntity, bool>> predicate)
            => await _dbSet.FirstOrDefaultAsync(predicate);

        public async Task<IReadOnlyList<TEntity>> FindAsync(Expression<Func<TEntity, bool>> predicate)
    => await _dbSet.Where(predicate).AsNoTracking().ToListAsync();
    }
}
