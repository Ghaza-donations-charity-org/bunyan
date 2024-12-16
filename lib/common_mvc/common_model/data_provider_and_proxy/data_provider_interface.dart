
///DataProvider interface
abstract class DataProvider<T> {
  Future<T> fetchData();
  void clearCache();
}