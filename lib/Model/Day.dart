//import 'dart:convert';
//import 'dart:io';

//import 'package:http/http.dart' as http;
//import 'package:pill_reminder_system/Utilities/Global/global.dart';

class Day
{
  late String mon,tue,wed,thu,fri,sat,sun;


  Day.fromMap(Map<String,dynamic> map)
  {   

    mon=map["mon"];
    tue=map["tue"];
  //  is_prescribed = map["is_prescribed"];
    wed = map["wed"];
    thu = map["thu"];
    fri = map["fri"];
    sat = map["sat"];
    sun = map["sun"];


  }
  Map<String,dynamic> tomap()
  {
    return <String,dynamic>{
      'mon' : mon,
      'tue':  tue,
     // 'is_prescribed':is_prescribed,
      'wed':  wed,
      'thu':  thu,
      'fri':  fri,
      'sat':  sat,
      'sun':  sun,
    };

  }
  
}

 