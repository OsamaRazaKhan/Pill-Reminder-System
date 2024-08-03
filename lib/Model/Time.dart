// import 'dart:convert';
// import 'dart:io';

// import 'package:http/http.dart' as http;
// import 'package:pill_reminder_system/Utilities/Global/global.dart';

class Time
{
  late String morn,even,noon,night;


  Time.fromMap(Map<String,dynamic> map)
  {   

    morn=map["morn"];
    even=map["even"];
  //  is_prescribed = map["is_prescribed"];
    noon = map["noon"];
    night = map["night"];
  }
  Map<String,dynamic> tomap()
  {
    return <String,dynamic>{
      'morn' : morn,
      'even':  even,
     // 'is_prescribed':is_prescribed,
      'noon':  noon,
      'night': night,

    };

  }
  
}

 