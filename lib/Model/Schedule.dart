import 'dart:convert';
//import 'dart:io';

import 'package:http/http.dart' as http;
//import 'package:pill_reminder_system/Model/Day.dart';
//import 'package:pill_reminder_system/Model/Time.dart';
import 'package:pill_reminder_system/Utilities/Global/global.dart';

class Schedule
{
   bool mon,tue,wed,thr,fri,sat,sun,morn,noon,even,night;
   int id;
  
  Schedule(this.mon,this.tue,this.wed,this.thr,this.fri,this.sat,this.sun,this.morn,this.noon,
  this.even,this.night,this.id);
  
   fromMap(Map<String,dynamic> map)
  {   
    mon = map["mon"];
    tue = map["tue"];
    wed = map["wed"];
    thr = map["thr"];
    fri = map["fri"];
    sat = map["sat"];
    sun = map["sun"];
    morn = map["morn"];
    noon = map["noon"];
    even = map["even"];
    night = map["night"];

  }

    Map<String,dynamic> tomap1()
  {
    return <String,dynamic>{
      'mon' : mon.toString(),
      'tue' : tue.toString(),
      'wed' : wed.toString(),
      'thr' : thr.toString(),
      'fri' : fri.toString(),
      'sat' : sat.toString(),
      'sun' : sun.toString(),
      'morn' : morn.toString(),
      'noon' : noon.toString(),
      'even' : even.toString(),
      'night' : night.toString(),
      'med_id' : id
    };

  }

    Map<String,dynamic> tomap2()
  {
    return <String,dynamic>{
      'mon' : mon.toString(),
      'tue' : tue.toString(),
      'wed' : wed.toString(),
      'thr' : thr.toString(),
      'fri' : fri.toString(),
      'sat' : sat.toString(),
      'sun' : sun.toString(),
      'morn' : morn.toString(),
      'noon' : noon.toString(),
      'even' : even.toString(),
      'night' : night.toString(),
      'pres_id' : id
    };

  }
    
    Future<String?> GetMedSchedule(String name,String type)async{
    print('get schedule body1');
    String url='${ip2}/patient/getmedschedule?name=${name}&type=${type}';
    Uri uri=Uri.parse(url);
    print('get schedule body2');
    var reseponse =await  http.get(uri);  
    print('get schedule body3');
       if(reseponse.statusCode==200)
       {
        print('get schedule body4');
        print('Good work1');  
        return reseponse.body; 
       }
       return null;  
  }

    Future<String?> GetPresSchedule(String name,String type)async{
    print('get schedule body1');
    String url='${ip2}/patient/getpresschedule?name=${name}&type=${type}';
    Uri uri=Uri.parse(url);
    print('get schedule body2');
    var reseponse =await  http.get(uri);  
    print('get schedule body3');
       if(reseponse.statusCode==200)
       {
        print('get schedule body4');
        print('Good work1');  
        return reseponse.body; 
       }
       return null;  
  }
    
     Future<String?> addmedschedule()async{
    print('add schedule body3');
    String url='${ip2}/caretaker/addschedule';
    Uri uri=Uri.parse(url);
    print('add schedule body4');
       var reseponse =await   http.post(uri,
                                        body:jsonEncode(tomap1()),
                                        headers: <String,String>{
                                          'Content-Type':'application/json'   
                                        }
                                 );
       print('add schedule body5');                       
       if(reseponse.statusCode==200) {
         return reseponse.body;
       }
       return null;
  }

  Future<String?> addpresschedule()async{
    print('add body3');
    String url='${ip2}/doctor/addschedule';
    Uri uri=Uri.parse(url);
    print('add body4');
       var reseponse =await   http.post(uri,
                                        body:jsonEncode(tomap2()),
                                        headers: <String,String>{
                                          'Content-Type':'application/json'   
                                        }
                                 );
       print('add body5');                       
       if(reseponse.statusCode==200) {
         return reseponse.body;
       }
       return null;
  }

    Future<String?> updateschedule()async{
    print('update body3');
    String url='${ip2}/doctor/updateschedule';
    Uri uri=Uri.parse(url);
    print('update body4');
       var reseponse =await   http.post(uri,
                                        body:jsonEncode(tomap1()),
                                        headers: <String,String>{
                                          'Content-Type':'application/json'   
                                        }
                                 );
       print('update body5');                       
       if(reseponse.statusCode==200) {
         return reseponse.body;
       }
       return null;
  }
}

 