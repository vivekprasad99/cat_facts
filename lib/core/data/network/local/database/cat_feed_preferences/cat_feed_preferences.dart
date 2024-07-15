
import 'package:cat_facts/core/data/network/local/database/cat_feed_preferences/cat_feed_prefernces_key.dart';
import 'package:cat_facts/core/data/network/local/database/model/cat_feed.dart';
import 'package:hive/hive.dart';

class CatFeedPreferences {
  static const _preferencesBox = '_preferencesBox';
  Box<Object>? _box;

  static init() async {
    await Hive.openBox<Object>(_preferencesBox);
  }

  CatFeedPreferences._() {
    _box = Hive.box<Object>(_preferencesBox);
  }

  static CatFeedPreferences getInstance() {
    return CatFeedPreferences._();
  }

  Future<void>? putCatFeedData(List<DataResponse> data) {
    return _box?.put(CatFeedPreferencesKeys.catFeed, data);
  }

}