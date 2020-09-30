import 'package:InternTask/Models/searchCourse.dart';
import 'package:InternTask/ServiceProvider/SearchPageProvider.dart';

class Repository{
  SearchPageProvider searchPageProvider=SearchPageProvider();
  Future<SearchCourseModel> getSearchPage(){
    return searchPageProvider.getSerchData();
  }
}