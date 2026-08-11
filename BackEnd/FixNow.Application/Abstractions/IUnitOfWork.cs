
using FixNow.Domain;

namespace FixNow.Application.Abstractions
{
    public interface IUnitOfWork:IDisposable
    {
        IGenericRepo<TEntity,TKey> GetRepo<TEntity, TKey>() where TEntity :class, TEntity<TKey>;

        Task<int> SaveChangesAsync();

    }
}
