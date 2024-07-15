import 'package:cat_facts/core/data/network/local/database/cat_feed_preferences/cat_feed_preferences.dart';
import 'package:cat_facts/core/data/network/local/database/model/cat_feed.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'boxes.dart';


class HiveHelper {
  static Future hiveInit() async {
    if (kIsWeb) {
      await Hive.initFlutter();
    } else {
      final appDocumentDirectory = await getApplicationDocumentsDirectory();
      await Hive.initFlutter(appDocumentDirectory.path);
    }

    if (!Hive.isAdapterRegistered(Boxes.catFeedHoTypeID)) {
      Hive.registerAdapter(DataResponseAdapter());
    }
    await CatFeedPreferences.init();
  }
}