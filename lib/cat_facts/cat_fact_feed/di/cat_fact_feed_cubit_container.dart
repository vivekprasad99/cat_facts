import 'package:cat_facts/cat_facts/cat_fact_feed/features/fact_feed/cubit/fact_feed_cubit.dart';
import 'package:cat_facts/cat_facts/cat_fact_feed/features/splash/cubit/splash_cubit.dart';
import 'package:cat_facts/core/di/app_injection_container.dart';
import 'package:cat_facts/core/widget/network_sensitive/cubit/internet_cubit.dart';

void init() {
  /// Cubits
  sl.registerFactory<SplashCubit>(() => SplashCubit());
  sl.registerFactory<FactFeedCubit>(() => FactFeedCubit(sl()));
}