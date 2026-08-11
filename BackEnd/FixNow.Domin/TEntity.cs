

namespace FixNow.Domain
{
  public interface TEntity<Tkey>
    {
        Tkey Id { get; set; }
    }
}
