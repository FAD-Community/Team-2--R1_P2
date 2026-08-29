using FixNow.Domain;
using System.Threading.Tasks;

namespace FixNow.Application.Abstractions
{
    public interface IUnitOfWork
    {
        IGenericRepo<TEntity, TKey> GetRepo<TEntity, TKey>() where TEntity : class, TEntity<TKey>;
        Task SaveChangesAsync();
    }
}
