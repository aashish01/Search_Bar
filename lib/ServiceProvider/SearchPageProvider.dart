import 'dart:convert';
import 'package:InternTask/Utilities/key.dart';
import 'package:flutter/services.dart';
import '../Models/searchCourse.dart';
import 'package:http/http.dart' as http;

class SearchPageProvider {
  String _baseUrl = ServerIp + "admin/tagcategory";

  Future<SearchCourseModel> getSerchData() async {
    http.Response response = await http.get(
      Uri.encodeFull("$_baseUrl"),
      headers: {"Content-Type": "application/json"},
    );
    print("the response is ${response.statusCode}");
    if (response.statusCode == 200) {
      return SearchCourseModel.fromJson(json.decode(response.body));
    }
  }
}
