import 'package:cat_facts/core/di/cubit_container/cubit_container.dart'  as cubit_container;
import 'package:cat_facts/core/router/router.dart';
import 'package:get_it/get_it.dart';
import 'package:cat_facts/core/di/repository_container/repository_container.dart'  as repository_container;

final sl = GetIt.instance;

void init() {
  /* Data Sources */
  // dsc.init();

  /// Repositories
  repository_container.init();

  /// Cubits
  cubit_container.init();

  /* Services */
  // sl.registerLazySingleton<Connectivity>(() => Connectivity());
  // sl.registerLazySingleton<DeepLinkCubit>(() => DeepLinkCubit());

  /* Navigation */
  sl.registerSingleton<MRouter>(MRouter(), dispose: (router) {
    router.closeStream();
    router.closeLocalStream();
  });
}
