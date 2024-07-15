import 'dart:async';

import 'package:cat_facts/cat_facts/cat_fact_feed/features/fact_feed/cubit/fact_feed_cubit.dart';
import 'package:cat_facts/cat_facts/cat_fact_feed/features/fact_feed/cubit/fact_feed_state.dart';
import 'package:cat_facts/cat_facts/cat_fact_feed/features/fact_feed/widget/tiles/cat_feed_tile.dart';
import 'package:cat_facts/core/dialog/loading/app_circular_Progress_indicator.dart';
import 'package:cat_facts/core/utils/helper.dart';
import 'package:cat_facts/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widget/network_sensitive/internet_sensitive.dart';

class FactFeedWidget extends StatefulWidget {
  const FactFeedWidget({Key? key}) : super(key: key);

  @override
  State<FactFeedWidget> createState() => _FactFeedWidgetState();
}

class _FactFeedWidgetState extends State<FactFeedWidget> {
  @override
  void initState() {
    super.initState();
    apiAndTimerCall();
    getSingleFacts();
    Timer.periodic(const Duration(seconds: 10), (timer) {
      context.read<FactFeedCubit>().getFacts();
    });
  }

  void apiAndTimerCall() {
    context.read<FactFeedCubit>().getFacts();
    context.read<FactFeedCubit>().getSingleFacts();
    context.read<FactFeedCubit>().showTimer();
  }

  void getSingleFacts() {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      context.read<FactFeedCubit>().getSingleFacts();
      context.read<FactFeedCubit>().showTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return buildWidgetsForMobile(context);
  }

  Widget buildWidgetsForMobile(BuildContext context) {
    return BlocConsumer<FactFeedCubit, FactFeedState>(
      listener: (context, state) {
        if (state.failedWithoutAlertMessage?.isNotEmpty ?? false) {
          Helper.showErrorToast(state.failedWithoutAlertMessage ?? "");
        }
      },
      buildWhen: (prev, state) {
        return false;
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white10,
            elevation: 2,
            title: Text(
              Global.baseUrl,
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: buildCatFactFeedtList(),
        );
      },
    );
  }

  Widget buildCatFactFeedtList() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: BlocBuilder<FactFeedCubit, FactFeedState>(
          buildWhen: (preState, curState) {
        return (preState.isLoading != curState.isLoading ||
            preState.timerText != curState.timerText);
      }, builder: (context, state) {
        if (state.isLoading ?? false || state.dataResponse != null) {
          return const Padding(
            padding: EdgeInsets.all(150),
            child: AppCircularProgressIndicator(),
          );
        } else {
          return ListView.separated(
            itemCount: state.dataResponse?.length ?? 0,
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: 16),
            itemBuilder: (context, i) {
              return CatFeedTile(
                catFacts: state.dataResponse?[i].fact ?? "",
                timerText: state.timerText ?? "",
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 12);
            },
          );
        }
      }),
    );
  }
}
