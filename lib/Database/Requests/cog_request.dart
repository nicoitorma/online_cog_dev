import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_cog/Database/Requests/db_response.dart';

class FirebaseOperations {
  static Future<DbResponse> addCogRequest({
    required String name,
    required String idNumber,
    required String email,
    required String schoolYear,
    required String department,
    required int yearLevel,
    required String semester,
  }) async {
    DbResponse response = DbResponse();
    final request =
        FirebaseFirestore.instance.collection('cog_requests').doc(name);

    Map<String, dynamic> data = <String, dynamic>{
      'name': name,
      'idNumber': idNumber,
      'email': email,
      'schoolYear': schoolYear,
      'department': department,
      'yearLevel': yearLevel,
      'semester': semester,
    };

    await request.set(data).whenComplete(() {
      response.code = 200;
      response.message = "Sucessfully added to the database";
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }
}
