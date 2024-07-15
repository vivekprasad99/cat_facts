import 'package:hive_flutter/hive_flutter.dart';

import '../boxes.dart';
part 'cat_feed.g.dart';

@HiveType(typeId: Boxes.catFeedHoTypeID)
class DataResponse extends HiveObject {

  @HiveField(0)
  String? fact;

  @HiveField(1)
  int? length;

  DataResponse({this.fact,this.length});

  DataResponse.fromJson(Map<String, dynamic> json) {
    fact = json['fact'];
    length = json['length'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fact'] = fact;
    data['length'] = length;
    return data;
  }
}