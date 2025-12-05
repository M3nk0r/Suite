abstract interface class Crud<T>{
  Future<void> create(T entity);
  Future<List<T>> read();
  Future<void> update(T entity);
  Future<void> delete(T entity);
}