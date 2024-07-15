import 'package:cat_facts/cat_facts/cat_fact_feed/data/model/cat_feeds_response.dart';
import 'package:cat_facts/core/data/network/local/database/model/cat_feed.dart';

abstract class AuthRemoteDataSource {
  Future<CatFeedsResponse> getFacts();
  Future<DataResponse> getSingleFacts();
}