import 'dart:convert';
import 'package:flutter/services.dart';
import '../Models/courseSeachDetails.dart';

class DetailsCourseSearch {
  Future<SearchCourses> getDetailsCourseSearch() async {
    String courseSearch =
        await rootBundle.loadString('assets/Json/courseSearchDetails.json');
    return SearchCourses.fromJson(json.decode(courseSearch));
  }
}
