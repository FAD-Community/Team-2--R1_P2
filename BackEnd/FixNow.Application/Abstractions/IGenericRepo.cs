using FixNow.Domain;

namespace FixNow.Application.Abstractions
{
   
    public interface IGenericRepo<TEntity, TKey> where TEntity :class ,TEntity<TKey>
    {
        Task<IReadOnlyList<TEntity>> GetAll();
      
        Task<TEntity> GetById(TKey id);
     
        Task Add(TEntity item);
        void update(TEntity item);
        void delete(TEntity item);
       
    }
}
