using FixNow.Domain;
using System.Linq.Expressions;

namespace FixNow.Application.Abstractions
{
   
    public interface IGenericRepo<TEntity, TKey> where TEntity :class ,TEntity<TKey>
    {
        Task<IReadOnlyList<TEntity>> GetAll();
      
        Task<TEntity> GetById(TKey id);
     
        Task Add(TEntity item);
        void update(TEntity item);
        void delete(TEntity item);
        Task<bool> AnyAsync(Expression<Func<TEntity, bool>> predicate);
        Task<TEntity?> FindOneAsync(Expression<Func<TEntity, bool>> predicate);
        Task<IReadOnlyList<TEntity>> FindAsync(Expression<Func<TEntity, bool>> predicate);
    }
}
