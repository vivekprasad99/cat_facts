import 'package:cat_facts/cat_facts/cat_fact_feed/data/model/cat_feeds_response.dart';
import 'package:cat_facts/cat_facts/cat_fact_feed/data/network/api/cat_api.dart';
import 'package:cat_facts/cat_facts/cat_fact_feed/data/network/data_source/cat_remote_data_source.dart';
import 'package:cat_facts/core/data/network/local/database/model/cat_feed.dart';
import 'package:cat_facts/core/utils/app_log.dart';
import 'package:dio/dio.dart';
import 'dart:math';
import '../../../../../core/data/network/client/rest_client.dart';

class CatRemoteRepository extends CatAPI implements AuthRemoteDataSource {

  @override
  Future<CatFeedsResponse> getFacts() async {
    try {
      Random random = Random();
      int randomNumber = 1 + random.nextInt(17);
      Response response = await catFactRestClient.get(fetchingFactsAPI.replaceFirst('pageNo', randomNumber.toString()));
      return CatFeedsResponse.fromJson(response.data);
    } catch (e) {
      AppLog.e('getFacts : ${e.toString()}');
      rethrow;
    }
  }

  @override
  Future<DataResponse> getSingleFacts() async {
    try {
      Response response = await catFactRestClient.get(fetchingSingleFactsAPI);
      return DataResponse.fromJson(response.data);
    } catch (e) {
      AppLog.e('getSingleFacts : ${e.toString()}');
      rethrow;
    }
  }
}