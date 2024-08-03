import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:pill_reminder_system/Utilities/Global/global.dart';

class Patient {
  Patient.Cons1();
  late String name;
  late int id;
  Patient();
  Patient.fromMap(Map<int, dynamic> map) {
    id = map["id"];
    name = map["name"];
  }
  Map<String, dynamic> tomap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  Future<dynamic> adddoctor(int pid, int did) async {
    print('add doctor body3');
    String url = '${ip2}/patient/adddoctor?pid=${pid}&did=${did}';
    Uri uri = Uri.parse(url);
    //  var body=jsonEncode(<String,dynamic>{
    //   'email':email,
    //   'password':password,
    //   'role':role
    //  });
    print('add doctor body4');
    var reseponse = await http.post(uri,
        body: jsonEncode(tomap()),
        headers: <String, String>{'Content-Type': 'application/json'});
    print('add doctor body5');
    if (reseponse.statusCode == 200) {
      return reseponse.body;
    }

    return null;
  }

  Future<dynamic> Isavailable(int pid) async {
    print('add doctor body3');
    String url = '${ip2}/patient/doctoravailability?pid=${pid}';
    Uri uri = Uri.parse(url);
    //  var body=jsonEncode(<String,dynamic>{
    //   'email':email,
    //   'password':password,
    //   'role':role
    //  });
    print('add doctor body4');
    var reseponse = await http.get(uri);

    print('add doctor body5');
    print(reseponse.body);
    if (reseponse.statusCode == 200) {
      return reseponse.body;
    }

    return null;
  }

  Future<String?> GetMedicines(int patient_id) async {
    print('get medicines body1');
    String url = '${ip2}/patient/getmedicines?patient_id=${patient_id}';
    Uri uri = Uri.parse(url);
    print('get medicines body2');
    var reseponse = await http.get(uri);
    print('get medicines body3');
    if (reseponse.statusCode == 200) {
      print('get medicines body4');
      print('Good work1');
      return reseponse.body;
    }
    return null;
  }

  Future<String?> GetPrescriptions(int pid) async {
    print('get prescriptions body1');
    String url = '${ip2}/patient/getprescriptions?pid=${pid}';
    Uri uri = Uri.parse(url);
    print('get prescriptions body2');
    var reseponse = await http.get(uri);
    print('get prescriptions body3');
    if (reseponse.statusCode == 200) {
      print('get prescriptions body4');
      print('Good work1');
      return reseponse.body;
    }
    return null;
  }

  Future<String?> GetDispenser1(int pid) async {
    print('get dispenser body1');
    String url = '${ip2}/patient/getdispenser1?patient_id=${pid}';
    Uri uri = Uri.parse(url);
    print('get dispenser body2');
    var reseponse = await http.get(uri);
    print('get dispenser body3');
    if (reseponse.statusCode == 200) {
      print('get dispenser body4');
      print('Good work1');
      return reseponse.body;
    }
    return null;
  }

  Future<String?> GetDispenser2(int pid, String day, String time) async {
    print('get dispenser body1');
    String url =
        '${ip2}/patient/getdispenser2?patient_id=${pid}&day=${day}&time=${time}';
    Uri uri = Uri.parse(url);
    print('get dispenser body2');
    var reseponse = await http.get(uri);
    print('get dispenser body3');
    if (reseponse.statusCode == 200) {
      print('get dispenser body4');
      print('Good work1');
      return reseponse.body;
    }
    return null;
  }

  Future<String?> signupQuery(String c_email, String d_email) async {
    print('Good work2');
    String url = '${ip2}/patient/signup?';
    print('Good work3');
    Uri uri = Uri.parse(url);
    var reseponse = await http.post(uri);
    print(reseponse.body);
    if (reseponse.statusCode == 200) {
      print('Good work5');
      return reseponse.body;
    }
    return null;
  }

  Future<String?> uploadPic(File f) async {
    String url = '${ip2}/user/UpdateProfileImage';

    Uri uri = Uri.parse(url);
    var request = http.MultipartRequest('POST', uri);
    request.fields["Id"] = id.toString();
    http.MultipartFile newfile =
        await http.MultipartFile.fromPath('photo', f.path);
    request.files.add(newfile);
    var response = await request.send();

    print('Good Work2');
    if (response.statusCode == 200) return 'Uploaded';

    return null;
  }

  Future<dynamic> TakePill(int patient_id, String day, String time) async {
    String url =
        '${ip2}/patient/pilltaken?patient_id=${patient_id}&day=${day}&time=${time}';
    Uri uri = Uri.parse(url);
    //  var body=jsonEncode(<String,dynamic>{
    //   'email':email,
    //   'password':password,
    //   'role':role
    //  });
    print('add doctor body4');
    var reseponse = await http.post(uri);

    print('add doctor body5');
    print(reseponse.body);
    if (reseponse.statusCode == 200) {
      return reseponse.body;
    }

    return null;
  }
}
