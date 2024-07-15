import 'package:cat_facts/cat_facts/cat_fact_feed/data/model/cat_feeds_response.dart';
import 'package:cat_facts/core/data/network/local/database/model/cat_feed.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
part 'fact_feed_state.g.dart';

@CopyWith()
class FactFeedState extends Equatable {
  final bool? isLoading;
  final CatFeedsResponse? catFeedsResponse;
  final String? timerText;
  final String? failedWithoutAlertMessage;
  final List<DataResponse>? dataResponse;

  const FactFeedState({this.isLoading,this.catFeedsResponse,this.timerText,this.failedWithoutAlertMessage,this.dataResponse});

  @override
  List<Object?> get props => [isLoading,catFeedsResponse,timerText,failedWithoutAlertMessage,dataResponse];
}