

using FixNow.Application.Abstractions;
using FixNow.Domain;
using FixNow.Infrastructure.Data;


namespace FixNow.Infrastructure.Reposatories
{
    public class UnitOfWork(AppDbContext Context) : IUnitOfWork
    {
        private readonly Dictionary<string, object> _reposatory = new Dictionary<string, object>();

        public void Dispose()
        {
            Context.Dispose();
        }

        public IGenericRepo<TEntity, TKey> GetRepo<TEntity, TKey>() where TEntity :class, TEntity<TKey>
        {
            string name=typeof(TEntity).Name;
            if(_reposatory.ContainsKey(name))
            {
                return (IGenericRepo<TEntity, TKey>)_reposatory[name];
            }
            else
            {
                var repo = new GenericRepo<TEntity, TKey>(Context);
                _reposatory.Add(name, repo);
                return repo; 
            }
        }

        public async Task<int> SaveChangesAsync()
        {
           return await Context.SaveChangesAsync();
        }
       
    }
}
