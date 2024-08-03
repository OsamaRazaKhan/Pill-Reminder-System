import 'dart:convert';
//import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:pill_reminder_system/Utilities/Global/global.dart';

class Pill {
  late String name, type, image, color, start_date, end_date;
  late int id, no_dosage;
  late int pid, did, cid;
  Pill();
  Pill.fromMap(Map<String, dynamic> map) {
    name = map["name"];
    type = map["type"];
    no_dosage = map["no_dosage"];
    image = map["image"];
    start_date = map["start_date"];
    end_date = map["end_date"];
    color = map["color"];
    //  is_prescribed = map["is_prescribed"];
    did = map["did"];
    cid = map["cid"];
    pid = map["pid"];
  }
  Map<String, dynamic> tomap() {
    return <String, dynamic>{
      'name': name,
      'type': type,
      'no_dosage': no_dosage,
      'start_date': start_date,
      'end_date': end_date,
      'image': image,
      'color': color,
      // 'is_prescribed':is_prescribed,
      'caretaker_id': cid,
      'doctor_id': did,
      'patient_id': pid,
    };
  }

  Future<String?> addprescription() async {
    print('good work2');
    String url = '${ip2}/doctor/addprescription';
    Uri uri = Uri.parse(url);
    //  var body=jsonEncode(<String,dynamic>{
    //   'email':email,
    //   'password':password,
    //   'role':role
    //  });
    var reseponse = await http.post(uri,
        body: jsonEncode(tomap()),
        headers: <String, String>{'Content-Type': 'application/json'});
    print('good work3');
    if (reseponse.statusCode == 200) {
      return reseponse.body;
    }

    return null;
  }

  Future<dynamic> updatepill() async {
    print('update body3');
    String url = '${ip2}/doctor/updatepill';
    Uri uri = Uri.parse(url);
    //  var body=jsonEncode(<String,dynamic>{
    //   'email':email,
    //   'password':password,
    //   'role':role
    //  });
    print('update body4');
    var reseponse = await http.post(uri,
        body: jsonEncode(tomap()),
        headers: <String, String>{'Content-Type': 'application/json'});
    print('update body5');
    if (reseponse.statusCode == 200) {
      return reseponse.body;
    }

    return null;
  }

  Future<dynamic> addpill() async {
    print('add body5');
    String url = '${ip2}/caretaker/addpill';
    Uri uri = Uri.parse(url);
    //  var body=jsonEncode(<String,dynamic>{
    //   'email':email,
    //   'password':password,
    //   'role':role
    //  });
    print('add body6');
    var reseponse = await http.post(uri,
        body: jsonEncode(tomap()),
        headers: <String, String>{'Content-Type': 'application/json'});
    print('add body7');
    print(reseponse.body);
    if (reseponse.statusCode == 200) {
      print(reseponse.body);
      return reseponse.body;
    }

    return null;
  }

  Future<dynamic> deletepill() async {
    print('delete body3');
    String url = '${ip2}/doctor/deletepill';
    Uri uri = Uri.parse(url);
    //  var body=jsonEncode(<String,dynamic>{
    //   'email':email,
    //   'password':password,
    //   'role':role
    //  });
    print('delete body4');
    var reseponse = await http.post(uri,
        body: jsonEncode(tomap()),
        headers: <String, String>{'Content-Type': 'application/json'});
    print('delete body5');
    if (reseponse.statusCode == 200) {
      return reseponse.body;
    }

    return null;
  }
}
