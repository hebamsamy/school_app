import 'dart:convert';

import 'package:school_app/models/student.dart';
import 'package:http/http.dart';

class Apihelper {
  Future<List<Student>> listStudents() async {
    // https://api.mohamed-sadek.com/Student/POST
    Uri path = Uri.https("api.mohamed-sadek.com", "/Student/GET");
    Map<String, String> myheaders = {"Content-Type": "application/json"};
    var responce = await get(path, headers: myheaders);

    var data = json.decode(responce.body)["Data"] as List;
    List<Student> list = data.map((item) => Student.fromJson(item)).toList();
    return list;
  }

  Future<bool> deleteStudent(int id) async {
    // https://api.mohamed-sadek.com/Student/Delete?id=1399
    final Uri path = Uri.parse('https://api.mohamed-sadek.com/Student/Delete?id=$id');
    Map<String, String> myheaders = {"Content-Type": "application/json"};
    var responce = await delete(path, headers: myheaders);

    var success = json.decode(responce.body)["Success"] as bool;
    return success;
  }

  Future<bool> addStudent(Student student) async {
    // https://api.mohamed-sadek.com/Student/POST
    Uri path = Uri.https("api.mohamed-sadek.com", "/Student/POST");
    Map<String, String> myheaders = {"Content-Type": "application/json"};
    Map<String, String> object = {
      "FirstName": student.FirstName,
      "LastName": student.LastName,
      "Mobile": student.Mobile,
      "Email": student.Email,
      "NationalID": student.NationalID,
      "Age": student.Age.toString()
    };

    var responce =
        await post(path, headers: myheaders, body: json.encode(object));
    var success = json.decode(responce.body)["Success"] as bool;
    return success;
  }
}
