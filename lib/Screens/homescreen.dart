import 'dart:convert';

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:pill_reminder_system/Model/Alarm1.dart';
import 'package:pill_reminder_system/Model/model1.dart';
// import 'package:pill_reminder_system/Model/patient.dart';
import 'package:pill_reminder_system/Screens/Login.dart';
import 'package:pill_reminder_system/Screens/caretakerscreen1.dart';
import 'package:pill_reminder_system/Screens/doctorscreen1.dart';
// ignore: unused_import
import 'package:pill_reminder_system/Utilities/Global/global.dart';
import 'package:pill_reminder_system/utilities/Global/global2.dart';
// import 'package:pill_reminder_system/Screens/firstscreen.dart';
// import 'package:pill_reminder_system/utilities/customwidgets/custombutton.dart';

// ignore: must_be_immutable
class HomeScreenPage extends StatefulWidget {
  String type;
  int user_id;
  final GlobalKey<NavigatorState> navigatorKey;
  // const HomeScreenPage({Key? key}) : super(key: key);
  HomeScreenPage.Cons1(this.user_id, this.type, this.navigatorKey);
  @override
  State<HomeScreenPage> createState() =>
      _HomeScreenPageState.Cons1(user_id, type, navigatorKey);
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  String type;
  int user1_id;
  int? user2_id;
  final GlobalKey<NavigatorState> navigatorKey;
  _HomeScreenPageState.Cons1(this.user1_id, this.type, this.navigatorKey);
  User _user = User.Cons1();
  String arrNames = '[{"id": 1, "name": "John"}, {"id": 2, "name": "Jane"}]';
  Map<int, dynamic> map = {};
  //final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  void initState() {
    // TODO: implement initState
    print('initstate');
    Mymethod();
    super.initState();
  }

  void Mymethod() async {
    print('mymethodstart');

    String? arrNames = await _user.GetPatients(user1_id, type);
    //print(arrNames);
    List<dynamic> jsonList = jsonDecode(arrNames!);
    jsonList.forEach((jsonObj) {
      //  _user.getpriority();
      int id = jsonObj['id'];

      print(id.toString());
      dynamic value = jsonObj['fname'] + ' ' + jsonObj['lname'];
      print(value);
      map[id] = value;

      if (type == 'Doctor') {
        print('doctor body1');
        //  user2_id = jsonObj['caretaker_id'];
      } else {
        print('caretaker body1');
        print(jsonObj['doctor_id']);
        user2_id = jsonObj['doctor_id'];
      }

      print(user2_id);
    });
    setState(() {});
    print('mymethodend');
  }

  Future<void> cancelAlarm() async {
    // Cancel the scheduled alarm
    await fnplugin.cancel(0);
    fnplugin = null;
    // Clear the scheduled time from shared preferences
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.remove('scheduledTime');
    print('Alarm canceled');
  }

  Future<void> cancelAlarm2() async {
    // Cancel the scheduled alarm
    await fnplugin2.cancel(0);
    fnplugin2 = null;
    // Clear the scheduled time from shared preferences
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.remove('scheduledTime');
    print('Alarm2 canceled');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Row(
          children: [
            GestureDetector(
              child: Container(
                  height: 40,
                  width: 40,
                  child: Image.asset('assets/images/backward.jpeg')),
              onTap: () {
                caret_id = 0;
                priority_chk = 0;
                status_chk = false;
                status_chk2 = false;
                loop_chk = false;
                loop_chk2 = false;
                is_snooze = false;
                snooze_count = 0;
                if (fnplugin != null) cancelAlarm();
                if (fnplugin2 != null) cancelAlarm2();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return LoginPage(navigatorKey);
                }));
              },
            ),
            SizedBox(
              width: 60,
            ),
            Text('All Patients')
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            width: 500,
            height: 500,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: FutureBuilder(
                future: User.getVehicles(),
                builder:
                    (BuildContext cont, AsyncSnapshot<List<User>> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    List<User> ulist = snapshot.data!;
                    if (ulist.length == 0) {
                      return Center(
                        child: Text('No Data Found'),
                      );
                    } else {
                      return ListView.separated(
                        itemBuilder: (context, index) {
                          // print('good work1');
                          int id = map.keys.elementAt(index);
                          // print('good work2');
                          String name = map[id];
                          final splitted = name.split(' ');
                          String name1 = splitted[0];
                          // print('good work3');
                          return GestureDetector(
                            onTap: () async {
                              if (type == 'Care Taker') {
                                is_snooze = false;
                                snooze_count = 0;
                                if (fnplugin != null) cancelAlarm();
                                if (fnplugin2 != null) cancelAlarm2();
                                status_chk = false;
                                status_chk2 = false;
                                await Future.delayed(Duration(seconds: 5));
                                loop_chk = false;
                                await Future.delayed(Duration(seconds: 5));
                                loop_chk2 = false;
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return CareTakerScreen1Page(
                                      user1_id, id, user2_id!, navigatorKey);
                                }));
                              } else {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return DoctorScreen1Page(
                                      user1_id, id, name, navigatorKey);
                                }));
                              }
                            },
                            child: ListTile(
                              leading: Container(
                                  height: 70,
                                  width: 70,
                                  child: Image.asset(
                                      'assets/images/profileicon.jpeg')),
                              title: Text(
                                '$name',
                                style: TextStyle(
                                    fontSize: 21, fontWeight: FontWeight.w500),
                              ),
                              subtitle: Column(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('$name1 _$id'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                              //   trailing: Icon(Icons.add),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => Divider(
                          height: 50,
                          thickness: 4,
                        ),
                        itemCount: map.length,
                      );
                    }
                  }
                },
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            'Select Patient',
            style: TextStyle(
                fontSize: 21, fontWeight: FontWeight.w500, color: Colors.blue),
          ),
        ],
      ),
    );
  }
}
