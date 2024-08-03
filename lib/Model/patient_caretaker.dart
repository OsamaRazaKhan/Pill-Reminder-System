import 'dart:convert';

//import 'dart:io';


import 'package:http/http.dart' as http;
import 'package:pill_reminder_system/Utilities/Global/global.dart';

class Patient_CareTaker
{
  late int id,priority;
  late int patient_id,caretaker_id;
  late String status,status2;
  Patient_CareTaker();
  Patient_CareTaker.fromMap(Map<String,dynamic> map)
  {   
    patient_id=map["patient_id"];
    caretaker_id=map["caretaker_id"];
    priority=map["priority"];
    status=map["status"];
    status2=map["status2"];
  }
  Map<String,dynamic> tomap()
  {
    return <String,dynamic>{
      'patient_id' : patient_id,
      'caretaker_id':caretaker_id,
      'priority': priority,
      'status': status,
      'status2': status2,
    };


  }

    Future<dynamic> addobject()async{
    print('add body5');
    String url='${ip2}/caretaker/addobject';
    Uri uri=Uri.parse(url);
  //  var body=jsonEncode(<String,dynamic>{
  //   'email':email,
  //   'password':password,
  //   'role':role
  //  });
      print('add body6');
       var reseponse =await   http.post(uri,
                                        body:jsonEncode(tomap()),
                                        headers: <String,String>{
                                          'Content-Type':'application/json'   
                                        }
       
                                 );
       print('add body7');
       print(reseponse.body);                       
       if(reseponse.statusCode==200) {
         print('good work'+reseponse.body);
         return reseponse.body;
       }

       return null;
  
  }
}