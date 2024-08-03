// // import 'dart:async';
// // import 'dart:isolate';

// // import 'package:flutter/material.dart';
// // import 'package:flutter_isolate/flutter_isolate.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:pill_reminder_system/Model/Alarm.dart';
// // import 'package:pill_reminder_system/Utilities/Global/global.dart';
// // class ApiManager {
// //   int cid,pid;
// //   Widget w1;
// //   final GlobalKey<NavigatorState> navigatorKey;
// //   ApiManager(this.cid,this.pid,this.navigatorKey,this.w1);

// //   static FlutterIsolate? _backgroundIsolate;
// //   static StreamController<String> _messageStreamController =
// //       StreamController<String>();

// //    void backgroundTask(SendPort sendPort) async {
// //     print('bacgroundtask body7');
// //     while (true) {
// //       await Future.delayed(Duration(seconds: 5));
// //       String? response = await CheckStatus(cid,pid);
// //       print(response);
// //       if(response=="busy")
// //       {
// //         is_snooze = true;
// //         Alarm alarm = Alarm(navigatorKey,pid,w1);
// //         await alarm.scheduleAlarm();
// //         stopBackgroundTask();
// //       }
// //       print('API call performed');
// //       sendPort.send('API call performed');
// //     }
// //   }

// //    void startBackgroundTask() async{
// //     print('bacgroundtask body2');
// //     final ReceivePort receivePort = ReceivePort();
// //     print('bacgroundtask body2.1');
// //     _backgroundIsolate =await FlutterIsolate.spawn(backgroundTask,receivePort.sendPort,);
// //     print(_backgroundIsolate);
// //     print('bacgroundtask body3');
// //     receivePort.listen((message) {
// //       print('bacgroundtask body4');
// //       // Handle messages received from the isolate
// //       print('Received message: $message');
// //       _messageStreamController.add(message);
// //       print('bacgroundtask body5');
// //     });
// //     print('bacgroundtask body6');
// //   }

// //    void stopBackgroundTask() {
// //     if (_backgroundIsolate != null) {
// //       _backgroundIsolate!.kill();
// //       _backgroundIsolate = null;
// //       _messageStreamController.close();
// //     }
// //   }
// //      Future<String?> CheckStatus(int cid, int pid) async
// //   {
// //     print('Good work2');
// //     String? url;

// //          print('Good work3 for Care Taker');
// //          url='${ip2}/caretaker/CheckStatus?cid=${cid}&pid=${pid}';
  

// //     Uri uri=Uri.parse(url); 
// //     print('Good work4'); 
// //     var response  =  await http.get(uri);  
// //     print(response);
// //      //print('Good work2');
// //     if(response.statusCode==200)
// //     {
// //      //   print('Good work3');
// //         return response.body;
        
// //     }

// //          return null;
// //   }
// //   static Stream<String> get messageStream => _messageStreamController.stream;
// // }


// import 'dart:async';
// import 'dart:isolate';

// import 'package:flutter/material.dart';
// import 'package:flutter_isolate/flutter_isolate.dart';
// import 'package:http/http.dart' as http;
// import 'package:pill_reminder_system/Model/Alarm.dart';
// import 'package:pill_reminder_system/Utilities/Global/global.dart';

// class ApiManager {
//   int cid, pid;
//   Widget w1;
//   final GlobalKey<NavigatorState> navigatorKey;
//   ApiManager(this.cid, this.pid, this.navigatorKey, this.w1);

//   static FlutterIsolate? _backgroundIsolate;
//   static StreamController<String> _messageStreamController =
//       StreamController<String>();

//   void backgroundTask(SendPort sendPort) async {
//     print('backgroundtask body7');
//     while (true) {
//       await Future.delayed(Duration(seconds: 5));
//       String? response = await CheckStatus(cid, pid);
//       print(response);
//       if (response == "busy") {
//         Alarm alarm = Alarm(navigatorKey, pid, w1);
//         await alarm.scheduleAlarm();
//         stopBackgroundTask();
//       }
//       print('API call performed');
//       sendPort.send('API call performed');
//     }
//   }

// void startBackgroundTask() async {
//   print('backgroundtask body2');
//   final ReceivePort receivePort = ReceivePort();
//   print('backgroundtask body2.1');
//   _backgroundIsolate = await FlutterIsolate.spawn(
//     backgroundTask,
//     receivePort.sendPort,
//   );
//   print(_backgroundIsolate);
//   print('backgroundtask body3');
//   receivePort.listen((message) {
//     print('backgroundtask body4');
//     // Handle messages received from the isolate
//     print('Received message: $message');
//     _messageStreamController.add(message);
//     print('backgroundtask body5');
//   });
//   print('backgroundtask body6');
// }


// void stopBackgroundTask() {
//   if (_backgroundIsolate != null) {
//     _backgroundIsolate!.kill(priority: Isolate.immediate);
//     _backgroundIsolate = null;
//     _messageStreamController.close();
//   }
// }


//   Future<String?> CheckStatus(int cid, int pid) async {
//     print('Good work2');
//     String? url;

//     print('Good work3 for Care Taker');
//     url = '${ip2}/caretaker/CheckStatus?cid=${cid}&pid=${pid}';

//     Uri uri = Uri.parse(url);
//     print('Good work4');
//     var response = await http.get(uri);
//     print(response);
//     if (response.statusCode == 200) {
//       return response.body;
//     }

//     return null;
//   }

//   Stream<String> get messageStream => _messageStreamController.stream;
// }
