part of 'cache_service.dart';

abstract interface class ICacheService {
  void set<T extends Object>(CacheKeys key, T value);
  T? get<T extends Object>(CacheKeys key);
  Set<String> getKeys();
}