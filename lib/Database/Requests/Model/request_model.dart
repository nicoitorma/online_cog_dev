class CogRequest {
  String? uid;
  String? name;
  String? idNumber;
  String? email;
  String? schoolYear;
  String? department;
  int? yearLevel;
  List<int>? semester;

  CogRequest(
      {this.uid,
      this.name,
      this.idNumber,
      this.email,
      this.schoolYear,
      this.department,
      this.yearLevel,
      this.semester});
}
