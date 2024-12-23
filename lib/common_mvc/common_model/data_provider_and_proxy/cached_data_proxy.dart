import 'package:flutter/cupertino.dart';

import 'data_provider_interface.dart';

///CachedDataProxy
/// A class that implements the [DataProvider] interface.
/// A proxy class that caches the data fetched by the real provider.
/// If the data is already cached, it returns the cached data instead of fetching it again (for better performance and less API calls).
/// If the data is not cached, it fetches the data from the real provider and caches it.
/// The cache can be cleared using the [clearCache] method.

class CachedDataProxy<T> implements DataProvider<T> {
  final DataProvider<T> _realProvider;
  T? _cachedData;

  CachedDataProxy(this._realProvider);

  @override
  Future<T> fetchData() async {
    if (_cachedData != null) {
      debugPrint('Returning cached data');
      return _cachedData!;
    }
    debugPrint('Fetching data from Firebase');
    _cachedData = await _realProvider.fetchData();
    return _cachedData!;
  }

  @override
  void clearCache() {
    _cachedData = null;
    debugPrint('Cache cleared');
  }
}