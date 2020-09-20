import 'package:InternTask/Models/searchCourse.dart';
import 'package:InternTask/ServiceProvider/SearchPageProvider.dart';
import 'package:InternTask/pages/CoursePageDetails.dart';
import 'package:InternTask/pages/courseDetails.dart';
import 'package:flutter/material.dart';
import '../size_config/sizeConfig.dart';

class SearchCourse extends StatefulWidget {
  @override
  _SearchCourseState createState() => _SearchCourseState();
}

class _SearchCourseState extends State<SearchCourse> {
  Data search;

  @override
  void initState() {
    super.initState();
    SearchPageProvider().getSerchData().then((value) {
      setState(() {
        search = value;
      });
    });
  }

  Widget getTopSearch() {
    if (search == null) {
      return Container();
    } else {
      return ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: search.topSearch.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return Container(
              child: Wrap(
                children: [
                  ActionChip(
                    label: Text(search.topSearch[index].title),
                    onPressed: () {
                      print('im action');
                    },
                  ),
                  SizedBox(
                    width: SizeConfig.safeBlockVertical * 1.5,
                  ),
                ],
              ),
            );
          });
    }
  }

  Widget getBrowserCategory() {
    if (search == null) {
      return Container();
    } else {
      return ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: search.browseCat.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return ListTile(
              leading: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(search.browseCat[index].img),
              ),
              title: Text(
                search.browseCat[index].category,
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 4,
                ),
              ),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return CourseDetailsPage();
                  },
                ));
              },
            );
          });
    }
  }

  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp(
      title: 'CourseSearchBar',
      theme: ThemeData.light(),
      home: DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            iconTheme: new IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            leading: IconButton(icon: Icon(Icons.search), onPressed: null),
            title: Center(
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Search Course',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 4,
                  ),
                ),
                onTap: () {
                  print('hello');
                },
              ),
            ),
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    print('Im Shoping cart');
                  })
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    child: Text(
                      'Top Searches',
                      style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.01,
                  ),
                  getTopSearch(),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.02,
                  ),
                  Container(
                    child: Text(
                      'Browse Categories',
                      style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.01,
                  ),
                  getBrowserCategory(),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.01,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
