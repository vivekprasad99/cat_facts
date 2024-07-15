import 'package:cat_facts/core/di/app_injection_container.dart';
import 'package:cat_facts/global.dart';
import 'package:cat_facts/my_app.dart';
import 'package:flutter/material.dart';

import 'core/data/network/client/rest_client.dart' as rest_client;
import 'core/di/app_injection_container.dart' as app_injection_container;
import 'package:flutter/widgets.dart';
import 'package:cat_facts/core/widget/network_sensitive/cubit/internet_cubit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cat_facts/core/data/network/local/database/hive_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  app_injection_container.init();
  Global.baseUrl = "https://todo-aws/dev/";
  rest_client.init('https://catfact.ninja/');
  await HiveHelper.hiveInit();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<InternetCubit>(
      create: (_) => InternetCubit(sl<Connectivity>()),
    ),
  ], child: const CatFactApp()));
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Global.baseUrl),
      ),
    );
  }
}
