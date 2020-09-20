import 'dart:convert';
import 'package:flutter/services.dart';
import '../Models/courseDetails.dart';

class CourseDetailsProvider {
  Future<CourseDetail> courseDetailsData() async {
    String courseDetails =
        await rootBundle.loadString('assets/Json/coursedetails.json');
    return CourseDetail.fromJson(json.decode(courseDetails));
  }
}
