import 'package:cat_facts/cat_facts/cat_fact_feed/features/splash/cubit/splash_cubit.dart';
import 'package:cat_facts/core/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/splash_state.dart';

class SplashWidget extends StatelessWidget {
  const SplashWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildSplashForMobile();
  }

  Widget buildSplashForMobile() {
    return BlocConsumer<SplashCubit, SplashState>(
      listener: (context, state) {
        if ((state.isTimerCompleted ?? false)) {
          _launchDashboardWidgetOrGenerateToken(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.deepPurpleAccent,
          body: Column(
            children: [
              const Spacer(),
              Center(
                child: Image.asset('assets/images/cat.png', width: 600, height: 200),
              ),
              const SizedBox(height: 8),
              const Text("Cat Facts",style: TextStyle(fontSize: 40,color: Colors.white),),
              const Spacer(),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }

  void _launchDashboardWidgetOrGenerateToken(BuildContext context) {
      MRouter.pushNamedAndRemoveUntil(MRouter.factFeedWidget);
  }
}
