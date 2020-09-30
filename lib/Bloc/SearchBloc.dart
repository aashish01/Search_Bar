import 'package:InternTask/Models/searchCourse.dart';
import 'package:InternTask/Repository/Repository.dart';
import 'package:rxdart/rxdart.dart';

class SearchBloc{
  final BehaviorSubject<SearchCourseModel> _SearchData = BehaviorSubject<SearchCourseModel>();
  Observable<SearchCourseModel> get currentSearchDataData => _SearchData.stream;

  void GetSearchPageData(){
    Repository repositoy=Repository();
    repositoy.getSearchPage().then((value){
      _SearchData.sink.add(value);
    });
  }
}
SearchBloc bloc=SearchBloc();