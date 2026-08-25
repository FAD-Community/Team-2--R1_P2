namespace FixNow.Domain
{
    public interface TEntity<TKey>
    {
        TKey Id { get; set; }
    }
}
