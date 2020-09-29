import 'package:InternTask/ServiceProvider/courseSearchDetailsProvider.dart';
import 'package:flutter/material.dart';
import '../Models/courseSeachDetails.dart';
import '../size_config/sizeConfig.dart';

class CourseDetailsSearch extends StatefulWidget {
  @override
  _CourseDetailsSearchState createState() => _CourseDetailsSearchState();
}

class _CourseDetailsSearchState extends State<CourseDetailsSearch> {
  SearchCourses detailsCourseSearch;
  int totalResult;
  @override
  void initState() {
    super.initState();
    DetailsCourseSearch().getDetailsCourseSearch().then((value) {
      setState(() {
        detailsCourseSearch = value;
        totalResult = value.searchResult.length;
      });
    });
  }

  Widget build(BuildContext context) {
    if (detailsCourseSearch == null) {
      return Scaffold(
        body: Center(
          child: Container(
            child: Text('Nothing To Display'),
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          iconTheme: new IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: Center(
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search Course',
              ),
              onTap: () {
                print('hello');
              },
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 1),
            child: Column(
              children: <Widget>[
                Card(
                  elevation: 0.5,
                  child: Padding(
                    padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(
                              SizeConfig.safeBlockHorizontal * 3),
                          child: Row(
                            children: [
                              Text(
                                totalResult.toString(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                ' Total Results',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(
                              SizeConfig.safeBlockHorizontal * 3),
                          child: Text(
                            'Flutter',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: detailsCourseSearch.searchResult.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Card(
                          child: InkWell(
                            onTap: () {
                              print('im card');
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  title: Padding(
                                    padding: EdgeInsets.only(
                                        bottom:
                                            SizeConfig.safeBlockHorizontal * 2),
                                    child: Text(
                                      detailsCourseSearch
                                          .searchResult[index].title,
                                      style: TextStyle(
                                        fontSize:
                                            SizeConfig.safeBlockHorizontal * 4,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  subtitle: Text(
                                    detailsCourseSearch
                                        .searchResult[index].university,
                                    style: TextStyle(
                                      fontSize:
                                          SizeConfig.safeBlockHorizontal * 3.5,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  trailing: ConstrainedBox(
                                    constraints: BoxConstraints(),
                                    child: Image.network(detailsCourseSearch
                                        .searchResult[index].img),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: SizeConfig.screenHeight * 0,
                                    bottom: SizeConfig.blockSizeHorizontal * 0,
                                    left: SizeConfig.safeBlockVertical * 1,
                                  ),
                                  child: ChoiceChip(
                                    label: Text(
                                      detailsCourseSearch
                                          .searchResult[index].type,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    selected: false,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(
                                      SizeConfig.safeBlockHorizontal * 0.5),
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          IconButton(
                                            icon: Icon(
                                              Icons.star_half,
                                              color: Colors.orange,
                                            ),
                                            onPressed: null,
                                          ),
                                          Text(
                                            detailsCourseSearch
                                                .searchResult[index].ratings,
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              left:
                                                  SizeConfig.screenWidth * 0.02,
                                              right:
                                                  SizeConfig.screenWidth * 0.02,
                                            ),
                                            child: Container(
                                              color: Colors.black45,
                                              height: SizeConfig.screenHeight *
                                                  0.02,
                                              width: SizeConfig.screenWidth *
                                                  0.004,
                                            ),
                                          ),
                                          Text(
                                            detailsCourseSearch
                                                .searchResult[index]
                                                .enrollCount,
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              left:
                                                  SizeConfig.screenWidth * 0.02,
                                              right:
                                                  SizeConfig.screenWidth * 0.02,
                                            ),
                                            child: Container(
                                              color: Colors.black45,
                                              height: SizeConfig.screenHeight *
                                                  0.02,
                                              width: SizeConfig.screenWidth *
                                                  0.004,
                                            ),
                                          ),
                                          Text(
                                            detailsCourseSearch
                                                .searchResult[index].level,
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
