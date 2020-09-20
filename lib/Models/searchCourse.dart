class Data {
  List<BrowseCat> browseCat;
  List<TopSearch> topSearch;

  Data({this.browseCat, this.topSearch});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['Browse_cat'] != null) {
      browseCat = new List<BrowseCat>();
      json['Browse_cat'].forEach((v) {
        browseCat.add(new BrowseCat.fromJson(v));
      });
    }
    if (json['Top_search'] != null) {
      topSearch = new List<TopSearch>();
      json['Top_search'].forEach((v) {
        topSearch.add(new TopSearch.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.browseCat != null) {
      data['Browse_cat'] = this.browseCat.map((v) => v.toJson()).toList();
    }
    if (this.topSearch != null) {
      data['Top_search'] = this.topSearch.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BrowseCat {
  String category;
  String img;

  BrowseCat({this.category, this.img});

  BrowseCat.fromJson(Map<String, dynamic> json) {
    category = json['Category'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Category'] = this.category;
    data['img'] = this.img;
    return data;
  }
}

class TopSearch {
  String title;

  TopSearch({this.title});

  TopSearch.fromJson(Map<String, dynamic> json) {
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    return data;
  }
}
