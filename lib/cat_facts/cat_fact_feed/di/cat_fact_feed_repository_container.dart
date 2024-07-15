import 'package:cat_facts/cat_facts/cat_fact_feed/data/network/repository/cat_remote_repository.dart';
import 'package:cat_facts/core/di/app_injection_container.dart';

void init() {
  /// Repositories
  sl.registerFactory<CatRemoteRepository>(() => CatRemoteRepository());
}