class GradeModels {
  String? courseCode;
  String? courseTitle;
  String? rating;

  GradeModels({this.courseCode, this.courseTitle, this.rating});

  toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['courseCode'] = courseCode;
    data['courseTitle'] = courseTitle;
    data['rating'] = rating;
    return data;
  }
}
