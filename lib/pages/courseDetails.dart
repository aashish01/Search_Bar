import 'package:InternTask/Models/courseDetails.dart';
import 'package:InternTask/ServiceProvider/CourseDetailsProvider.dart';
import 'package:flutter/material.dart';
import 'package:expandable_text/expandable_text.dart';

class DetailsCourse extends StatefulWidget {
  @override
  _DetailsCourseState createState() => _DetailsCourseState();
}

class _DetailsCourseState extends State<DetailsCourse> {
  CourseDetail course;
  @override
  void initState() {
    super.initState();
    CourseDetailsProvider().courseDetailsData().then((value) {
      setState(() {
        course = value;
      });
    });
  }

  Widget getCourseDetails() {
    if (course == null) {
      return Container();
    } else {
      return ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: course.courseDetails.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return Scaffold(
              body: CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    title: Text(course.courseDetails[index].title),
                  ),
                ],
              ),
            );
          });
    }
  }

  Widget build(BuildContext context) {
    return getCourseDetails();
  }
}
