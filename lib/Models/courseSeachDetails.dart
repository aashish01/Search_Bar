class SearchCourses {
  List<SearchResult> searchResult;

  SearchCourses({this.searchResult});

  SearchCourses.fromJson(Map<String, dynamic> json) {
    if (json['searchResult'] != null) {
      searchResult = new List<SearchResult>();
      json['searchResult'].forEach((v) {
        searchResult.add(new SearchResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.searchResult != null) {
      data['searchResult'] = this.searchResult.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SearchResult {
  String title;
  String university;
  String type;
  String img;
  String ratings;
  String enrollCount;
  String level;

  SearchResult(
      {this.title,
      this.university,
      this.type,
      this.img,
      this.ratings,
      this.enrollCount,
      this.level});

  SearchResult.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    university = json['university'];
    type = json['type'];
    img = json['img'];
    ratings = json['ratings'];
    enrollCount = json['enrollCount'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['university'] = this.university;
    data['type'] = this.type;
    data['img'] = this.img;
    data['ratings'] = this.ratings;
    data['enrollCount'] = this.enrollCount;
    data['level'] = this.level;
    return data;
  }
}
