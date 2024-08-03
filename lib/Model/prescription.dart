import 'dart:convert';
//import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:pill_reminder_system/Utilities/Global/global.dart';

class Prescription
{
  late String id,med_name,start_date,end_date,med_type;
  late int patient_id,doctor_id,no_dosage,weight;
  Prescription();
  Prescription.fromMap(Map<String,dynamic> map)
  {   
    
   
    med_name=map["med_name"];
    med_type=map["med_type"];
    no_dosage=map["no_dosage"];
    weight=map["Weight"];
    start_date=map["start_date"];
    end_date=map["end_date"];
  //  is_prescribed = map["is_prescribed"];
    doctor_id = map["doctor_id"];
    patient_id = map["patient_id"];

  }
  Map<String,dynamic> tomap()
  {
    return <String,dynamic>{
      'med_name' : med_name,
      'med_type':med_type,
      'no_dosage':no_dosage,
      'Weight':weight,
     // 'is_prescribed':is_prescribed,
      'doctor_id':doctor_id,
      'patient_id':patient_id,
      'start_date':start_date,
      'end_date':end_date
    };

  }
 
Future<String?> addprescription()async{
    print('good work2');
    String url='${ip2}/doctor/addprescription';
    Uri uri=Uri.parse(url);
  //  var body=jsonEncode(<String,dynamic>{
  //   'email':email,
  //   'password':password,
  //   'role':role
  //  });
       var reseponse =await   http.post(uri,
                                        body:jsonEncode(tomap()),
                                        headers: <String,String>{
                                          'Content-Type':'application/json'   
                                        }
       
                                 );
       print('good work3');                         
       if(reseponse.statusCode==200) {
        print('good work4'); 
         return reseponse.body;
       }
       print(reseponse.body.toString());
       return null;
  
  }



   
}










