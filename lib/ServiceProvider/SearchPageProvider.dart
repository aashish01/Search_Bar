import 'dart:convert';
import 'package:flutter/services.dart';
import '../Models/searchCourse.dart';

class SearchPageProvider {
  Future<Data> getSerchData() async {
    String data = await rootBundle.loadString('assets/Json/data.json');
    return Data.fromJson(json.decode(data));
  }
}
