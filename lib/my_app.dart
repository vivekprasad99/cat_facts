import 'package:cat_facts/core/data/network/local/database/hive_helper.dart';
import 'package:cat_facts/core/di/app_injection_container.dart';
import 'package:cat_facts/core/router/my_global_route_observer.dart';
import 'package:cat_facts/core/router/router.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatFactApp extends StatefulWidget {
  const CatFactApp({super.key});

  @override
  State<CatFactApp> createState() => _CatFactAppState();
}

class _CatFactAppState extends State<CatFactApp> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat Fact Feed',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: sl<MRouter>().onGenerateRoute,
      initialRoute: MRouter.splashRoute,
      navigatorKey: MRouter.globalNavigatorKey,
      navigatorObservers: [MyGlobalRouteObserver()],
    );
  }
}
