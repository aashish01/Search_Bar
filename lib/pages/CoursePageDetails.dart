import 'package:InternTask/Models/courseDetails.dart';
import 'package:InternTask/ServiceProvider/CourseDetailsProvider.dart';
import 'package:flutter/material.dart';
import 'package:expandable_text/expandable_text.dart';
import '../size_config/sizeConfig.dart';

class CourseDetailsPage extends StatefulWidget {
  @override
  _CourseDetailsPageState createState() => _CourseDetailsPageState();
}

class _CourseDetailsPageState extends State<CourseDetailsPage> {
  CourseDetail course;
  String title = "";
  String university = "";
  @override
  void initState() {
    super.initState();
    CourseDetailsProvider().courseDetailsData().then((value) {
      setState(() {
        course = value;
        title = value.courseDetails[0].title;
        university = value.courseDetails[0].offeredBy;
      });
    });
  }

  Widget build(BuildContext context) {
    if (course == null) {
      return Container(
        child: Text('nothing'),
      );
    } else {
      return Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: Text(
                title,
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 6,
                  fontWeight: FontWeight.bold,
                ),
              ),
              floating: false,
              pinned: true,
              expandedHeight: SizeConfig.screenHeight * 0.2,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.14,
                    ),
                    ListTile(
                      title: Padding(
                        padding: EdgeInsets.only(
                            bottom: SizeConfig.safeBlockHorizontal * 2),
                        child: Text(
                          'Offered By',
                          style: TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal * 4,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      subtitle: Text(
                        university,
                        style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 3.5,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              backgroundColor: Colors.blueGrey,
              actions: [
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {},
                ),
              ],
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: course.courseDetails.length,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return Padding(
                        padding:
                            EdgeInsets.only(top: SizeConfig.screenHeight * 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(
                                  left: SizeConfig.screenHeight * 0.02),
                              child: Text(
                                'About this Course',
                                style: TextStyle(
                                  fontSize: SizeConfig.safeBlockHorizontal * 5,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: SizeConfig.screenHeight * 0.01,
                                left: SizeConfig.screenHeight * 0.02,
                                right: SizeConfig.screenHeight * 0.02,
                                bottom: SizeConfig.screenHeight * 0,
                              ),
                              child: ExpandableText(
                                course.courseDetails[index].aboutCourse,
                                textAlign: TextAlign.justify,
                                expandText: 'show More',
                                collapseText: 'Show Less',
                                maxLines: 5,
                                style: TextStyle(
                                  fontSize:
                                      SizeConfig.safeBlockHorizontal * 3.6,
                                ),
                              ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              itemCount:
                                  course.courseDetails[index].cards.length,
                              itemBuilder: (context, int card) {
                                if (card == null) {
                                  return Container();
                                }
                                return Card(
                                  color: Colors.white10,
                                  elevation: SizeConfig.blockSizeHorizontal * 0,
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      radius:
                                          SizeConfig.blockSizeHorizontal * 5,
                                      backgroundImage: NetworkImage(course
                                          .courseDetails[index]
                                          .cards[card]
                                          .cardimg),
                                    ),
                                    title: Text(
                                      course.courseDetails[index].cards[card]
                                          .cardTitle,
                                      style: TextStyle(
                                        fontSize:
                                            SizeConfig.safeBlockHorizontal * 4,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    subtitle: Text(
                                      course.courseDetails[index].cards[card]
                                          .cardSubtitle,
                                      style: TextStyle(
                                        fontSize:
                                            SizeConfig.safeBlockHorizontal * 3,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: SizeConfig.screenHeight * 0.01,
                                left: SizeConfig.screenHeight * 0.02,
                              ),
                              child: Text(
                                'Skills you will Gain',
                                style: TextStyle(
                                  fontSize: SizeConfig.safeBlockHorizontal * 5,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              itemCount:
                                  course.courseDetails[index].skills.length,
                              itemBuilder: (context, int skill) {
                                if (skill == null) {
                                  return Container();
                                }
                                return Container(
                                  margin: EdgeInsets.only(
                                    left: SizeConfig.screenHeight * 0.03,
                                    right: SizeConfig.screenHeight * 0.03,
                                  ),
                                  child: Wrap(
                                    children: [
                                      Chip(
                                        label: Text(
                                          course.courseDetails[index]
                                              .skills[skill],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20.0,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: SizeConfig.screenHeight * 0.01,
                                left: SizeConfig.screenHeight * 0.02,
                                right: SizeConfig.screenHeight * 0.03,
                                bottom: SizeConfig.screenHeight * 0.01,
                              ),
                              child: Text(
                                'How the Specialization Works',
                                style: TextStyle(
                                  fontSize: SizeConfig.safeBlockHorizontal * 5,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              itemCount: course
                                  .courseDetails[index].specialization.length,
                              itemBuilder: (context, int speclizations) {
                                if (speclizations == null) {
                                  return Container();
                                }
                                return ExpansionTile(
                                  leading: Padding(
                                    padding: EdgeInsets.only(
                                      top: SizeConfig.blockSizeHorizontal * 0,
                                      left: SizeConfig.screenHeight * 0.01,
                                    ),
                                    child: Text(
                                      course.courseDetails[index]
                                          .specialization[speclizations].week,
                                      style: TextStyle(
                                        fontSize:
                                            SizeConfig.safeBlockHorizontal * 4,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  title: Padding(
                                    padding: EdgeInsets.only(
                                      left: SizeConfig.screenHeight * 0.04,
                                    ),
                                    child: Text(
                                      course
                                          .courseDetails[index]
                                          .specialization[speclizations]
                                          .heading,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              SizeConfig.safeBlockHorizontal *
                                                  4.5),
                                    ),
                                  ),
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: SizeConfig.screenHeight * 0.06,
                                        right: SizeConfig.screenHeight * 0.02,
                                        bottom: SizeConfig.screenHeight * 0.01,
                                      ),
                                      child: Text(
                                        course.courseDetails[index]
                                            .specialization[speclizations].body,
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          fontSize:
                                              SizeConfig.safeBlockHorizontal *
                                                  3,
                                        ),
                                      ),
                                    )
                                  ],
                                );
                              },
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: SizeConfig.screenHeight * 0.01,
                                left: SizeConfig.blockSizeVertical * 2,
                                bottom: SizeConfig.screenHeight * 0.01,
                              ),
                              child: Text(
                                'Instructors',
                                style: TextStyle(
                                  fontSize: SizeConfig.safeBlockHorizontal * 5,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: SizeConfig.safeBlockHorizontal * 1,
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                left: SizeConfig.screenHeight * 0.02,
                                bottom: SizeConfig.screenHeight * 0.01,
                              ),
                              child: Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: SizeConfig.blockSizeHorizontal * 6,
                                    backgroundColor: Colors.white,
                                    backgroundImage: NetworkImage(course
                                        .courseDetails[index].instructor.photo),
                                  ),
                                  SizedBox(
                                    width: SizeConfig.blockSizeVertical * 6,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      print('clicked');
                                    },
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          course.courseDetails[index].instructor
                                              .name,
                                          style: TextStyle(
                                            fontSize:
                                                SizeConfig.safeBlockHorizontal *
                                                    5,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height:
                                              SizeConfig.safeBlockHorizontal *
                                                  1,
                                        ),
                                        Text(
                                          course.courseDetails[index].instructor
                                              .qualification,
                                          style: TextStyle(
                                            fontSize:
                                                SizeConfig.safeBlockHorizontal *
                                                    3,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: SizeConfig.screenHeight * 0.02,
                                left: SizeConfig.blockSizeVertical * 2,
                                bottom: SizeConfig.screenHeight * 0.01,
                              ),
                              child: Text(
                                'Frequently Asked Questions ?',
                                style: TextStyle(
                                  fontSize: SizeConfig.safeBlockHorizontal * 5,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              itemCount: course
                                  .courseDetails[index].askedQuestions.length,
                              itemBuilder: (context, int question) {
                                if (question == null) {
                                  return Container();
                                }
                                return ExpansionTile(
                                  title: Padding(
                                    padding: EdgeInsets.only(
                                      left: SizeConfig.blockSizeVertical * 0,
                                    ),
                                    child: Text(
                                      course.courseDetails[index]
                                          .askedQuestions[question].question,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize:
                                            SizeConfig.safeBlockHorizontal * 4,
                                      ),
                                    ),
                                  ),
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: SizeConfig.blockSizeVertical * 2,
                                        right: SizeConfig.blockSizeVertical * 2,
                                        bottom: SizeConfig.screenHeight * 0.01,
                                      ),
                                      child: Text(
                                        course.courseDetails[index]
                                            .askedQuestions[question].answer,
                                        textAlign: TextAlign.justify,
                                      ),
                                    )
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}
