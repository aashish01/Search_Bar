class CourseDetail {
  List<CourseDetails> courseDetails;

  CourseDetail({this.courseDetails});

  CourseDetail.fromJson(Map<String, dynamic> json) {
    if (json['courseDetails'] != null) {
      courseDetails = new List<CourseDetails>();
      json['courseDetails'].forEach((v) {
        courseDetails.add(new CourseDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.courseDetails != null) {
      data['courseDetails'] =
          this.courseDetails.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CourseDetails {
  String title;
  String offeredBy;
  String aboutCourse;
  List<Cards> cards;
  List<String> skills;
  List<Specialization> specialization;
  Instructor instructor;
  List<AskedQuestions> askedQuestions;

  CourseDetails(
      {this.title,
      this.offeredBy,
      this.aboutCourse,
      this.cards,
      this.skills,
      this.specialization,
      this.instructor,
      this.askedQuestions});

  CourseDetails.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    offeredBy = json['offeredBy'];
    aboutCourse = json['aboutCourse'];
    if (json['cards'] != null) {
      cards = new List<Cards>();
      json['cards'].forEach((v) {
        cards.add(new Cards.fromJson(v));
      });
    }
    skills = json['skills'].cast<String>();
    if (json['specialization'] != null) {
      specialization = new List<Specialization>();
      json['specialization'].forEach((v) {
        specialization.add(new Specialization.fromJson(v));
      });
    }
    instructor = json['instructor'] != null
        ? new Instructor.fromJson(json['instructor'])
        : null;
    if (json['askedQuestions'] != null) {
      askedQuestions = new List<AskedQuestions>();
      json['askedQuestions'].forEach((v) {
        askedQuestions.add(new AskedQuestions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['offeredBy'] = this.offeredBy;
    data['aboutCourse'] = this.aboutCourse;
    if (this.cards != null) {
      data['cards'] = this.cards.map((v) => v.toJson()).toList();
    }
    data['skills'] = this.skills;
    if (this.specialization != null) {
      data['specialization'] =
          this.specialization.map((v) => v.toJson()).toList();
    }
    if (this.instructor != null) {
      data['instructor'] = this.instructor.toJson();
    }
    if (this.askedQuestions != null) {
      data['askedQuestions'] =
          this.askedQuestions.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cards {
  String cardimg;
  String cardTitle;
  String cardSubtitle;

  Cards({this.cardimg, this.cardTitle, this.cardSubtitle});

  Cards.fromJson(Map<String, dynamic> json) {
    cardimg = json['cardimg'];
    cardTitle = json['cardTitle'];
    cardSubtitle = json['cardSubtitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cardimg'] = this.cardimg;
    data['cardTitle'] = this.cardTitle;
    data['cardSubtitle'] = this.cardSubtitle;
    return data;
  }
}

class Specialization {
  String week;
  String heading;
  String body;

  Specialization({this.week, this.heading, this.body});

  Specialization.fromJson(Map<String, dynamic> json) {
    week = json['week'];
    heading = json['heading'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['week'] = this.week;
    data['heading'] = this.heading;
    data['body'] = this.body;
    return data;
  }
}

class Instructor {
  String photo;
  String name;
  String qualification;

  Instructor({this.photo, this.name, this.qualification});

  Instructor.fromJson(Map<String, dynamic> json) {
    photo = json['photo'];
    name = json['name'];
    qualification = json['qualification'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['photo'] = this.photo;
    data['name'] = this.name;
    data['qualification'] = this.qualification;
    return data;
  }
}

class AskedQuestions {
  String question;
  String answer;

  AskedQuestions({this.question, this.answer});

  AskedQuestions.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['question'] = this.question;
    data['answer'] = this.answer;
    return data;
  }
}
