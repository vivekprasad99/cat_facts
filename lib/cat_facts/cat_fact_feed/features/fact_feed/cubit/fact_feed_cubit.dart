import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cat_facts/cat_facts/cat_fact_feed/data/model/cat_feeds_response.dart';
import 'package:cat_facts/cat_facts/cat_fact_feed/data/network/repository/cat_remote_repository.dart';
import 'package:cat_facts/cat_facts/cat_fact_feed/features/fact_feed/cubit/fact_feed_state.dart';
import 'package:cat_facts/core/data/network/local/database/cat_feed_preferences/cat_feed_preferences.dart';
import 'package:cat_facts/core/data/network/local/database/model/cat_feed.dart';
import 'package:cat_facts/core/exception/exception.dart';
import 'package:cat_facts/core/utils/app_log.dart';

class FactFeedCubit extends Cubit<FactFeedState> {
  final CatRemoteRepository _catRemoteRepository;
  FactFeedCubit(this._catRemoteRepository) : super(const FactFeedState());

  void getFacts() async {
    try {
      emit(state.copyWith(isLoading: true));
      CatFeedsResponse catFeedsResponse =   await _catRemoteRepository.getFacts();
      List<DataResponse> dataResponseList = [];
      for (DataResponse item in catFeedsResponse.data!) {
        dataResponseList.add(item);
      }
      CatFeedPreferences.getInstance().putCatFeedData(dataResponseList);
      emit(state.copyWith(isLoading: false,dataResponse: dataResponseList));
    } on ServerException catch (e) {
      emit(state.copyWith(
          isLoading: false,dataResponse: null,failedWithoutAlertMessage: e.message!));
    } on FailureException catch (e) {
      emit(state.copyWith(
          isLoading: false,dataResponse: null,failedWithoutAlertMessage: e.message!));
    } catch (e, st) {
      AppLog.e('getFacts : ${e.toString()} \n${st.toString()}');
      emit(state.copyWith(
          isLoading: false,dataResponse: null,failedWithoutAlertMessage: 'we regret the technical error'));
    }
  }

  void showTimer() {
    var interval = const Duration(seconds: 1);
    int timerMaxSeconds = 5;
    int currentSeconds = 0;
    var duration = interval;
    Timer.periodic(duration, (timer) {
      currentSeconds = timer.tick;
      String timerText =
          ((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0');
      if (timerText == '00:00' && !isClosed) {
        emit(state.copyWith(timerText: timerText,));
      } else if(!isClosed) {
        emit(state.copyWith(timerText: timerText,));
      }
      if (timer.tick >= timerMaxSeconds) timer.cancel();
    });
  }

  void getSingleFacts() async {
    try {
      emit(state.copyWith(isLoading: true));
      DataResponse dataResponse =   await _catRemoteRepository.getSingleFacts();
      state.dataResponse?.add(dataResponse);
      CatFeedPreferences.getInstance().putCatFeedData(state.dataResponse ?? []);
      emit(state.copyWith(isLoading: false,dataResponse: state.dataResponse));
    } on ServerException catch (e) {
      emit(state.copyWith(
          isLoading: false,dataResponse: null,failedWithoutAlertMessage: e.message!));
    } on FailureException catch (e) {
      emit(state.copyWith(
          isLoading: false,dataResponse: null,failedWithoutAlertMessage: e.message!));
    } catch (e, st) {
      AppLog.e('getSingleFacts : ${e.toString()} \n${st.toString()}');
      emit(state.copyWith(
          isLoading: false,dataResponse: null,failedWithoutAlertMessage: 'we regret the technical error'));
    }
  }
}
