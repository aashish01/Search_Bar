class SearchCourseModel {
  List<String> topSearch;
  List<BrowseCat> browseCat;

  SearchCourseModel({this.topSearch, this.browseCat});

  SearchCourseModel.fromJson(Map<String, dynamic> json) {
    topSearch = json['Top_search'].cast<String>();
    if (json['Browse_cat'] != null) {
      browseCat = new List<BrowseCat>();
      json['Browse_cat'].forEach((v) {
        browseCat.add(new BrowseCat.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Top_search'] = this.topSearch;
    if (this.browseCat != null) {
      data['Browse_cat'] = this.browseCat.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BrowseCat {
  int id;
  String imageUri;
  String courseCatagory;

  BrowseCat({this.id, this.imageUri, this.courseCatagory});

  BrowseCat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUri = json['image_uri'];
    courseCatagory = json['Course_Catagory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image_uri'] = this.imageUri;
    data['Course_Catagory'] = this.courseCatagory;
    return data;
  }
}
