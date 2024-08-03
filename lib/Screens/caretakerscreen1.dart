import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_isolate/flutter_isolate.dart';
import 'package:pill_reminder_system/Model/Alarm1.dart';
import 'package:pill_reminder_system/Model/Alarmtest.dart';
import 'package:pill_reminder_system/Model/model1.dart';
//import 'package:pill_reminder_system/Model/patient.dart';
//import 'package:pill_reminder_system/Model/prescription.dart';
import 'package:pill_reminder_system/Screens/addmedicine.dart';
import 'package:pill_reminder_system/Screens/dispenserscreen1.dart';
import 'package:pill_reminder_system/Screens/homescreen.dart';
//import 'package:pill_reminder_system/Screens/testscreen1.dart';
import 'package:pill_reminder_system/Screens/viewprescriptions.dart';
import 'package:pill_reminder_system/Utilities/Global/global.dart';
import 'package:pill_reminder_system/utilities/Global/global2.dart';
//import 'package:pill_reminder_system/Utilities/customwidgets/custombutton2.dart';
import 'package:pill_reminder_system/utilities/customwidgets/custombutton.dart';

// ignore: must_be_immutable
class CareTakerScreen1Page extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  int cid, did, pid;
  CareTakerScreen1Page(this.cid, this.pid, this.did, this.navigatorKey);

  @override
  State<CareTakerScreen1Page> createState() =>
      _CareTakerScreen1PageState(cid, pid, did, navigatorKey);
}

class _CareTakerScreen1PageState extends State<CareTakerScreen1Page> {
  int cid, pid, did;
  final GlobalKey<NavigatorState> navigatorKey;
  _CareTakerScreen1PageState(this.cid, this.pid, this.did, this.navigatorKey);
  User u = User(0, '', '');
  @override
  void initState() {
    // TODO: implement initState
    print('initstate');
    //status_chk = true;
    print('priority_chk $priority_chk');
    if (priority_chk == 0)
      forPriorityChk();
    else
      forAlarm();
    forAlarm2();
    print("good work ongoing....");
    super.initState();
  }

  void forAlarm() async {
    //     print('bacgroundtask body1');

    status_chk = true;
    if (loop_chk == false) {
      while (status_chk) {
        loop_chk = true;
        await Future.delayed(Duration(seconds: 5));
        String? response = await u.CheckStatus(cid, pid);
        if (response == "\"busy\"") {
          status_chk = false;
          print('response is $response');
          print("alarm body1");
          //  is_snooze= true;
          //    print("alarm body2");
          Alarm alarm = Alarm(navigatorKey, pid, cid,
              CareTakerScreen1Page(cid, pid, did, navigatorKey));
          await alarm.scheduleAlarm();
        } else if (response == "\"available\"") {
          print('response is $response');
        }
        //--for background task
        // ApiManager amanager = ApiManager(cid, pid,navigatorKey,CareTakerScreen1Page(cid,pid,did,navigatorKey));
        // amanager.startBackgroundTask();
      }
      loop_chk = false;
    }
  }

  void forAlarm2() async {
    //     print('bacgroundtask body1');

    status_chk2 = true;
    if (loop_chk2 == false) {
      while (status_chk2) {
        loop_chk2 = true;
        await Future.delayed(Duration(seconds: 5));
        String? response = await u.CheckStatus2(cid, pid);
        if (response == "\"busy\"") {
          status_chk2 = false;
          print('response is $response');
          print("alarm body1");
          //  is_snooze= true;
          //    print("alarm body2");
          Alarm3 alarm = Alarm3(navigatorKey, pid, cid,
              CareTakerScreen1Page(cid, pid, did, navigatorKey));
          await alarm.scheduleAlarm();
        } else if (response == "\"available\"") {
          print('response is $response');
        }
        //--for background task
        // ApiManager amanager = ApiManager(cid, pid,navigatorKey,CareTakerScreen1Page(cid,pid,did,navigatorKey));
        // amanager.startBackgroundTask();
      }
      loop_chk2 = false;
    }
  }

  void forPriorityChk() async {
    //  print('forPriorityChk body1');
    String? response = await u.CheckPriority(cid, pid);
    if (response == null || response == "\"false\"") {
      print('false body');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Something went wrong'),
        ),
      );
    } else {
      int priority = int.parse(response);
      print('else1 priority $priority');
      if (priority == 1) {
        priority_chk = 1;
        forAlarm();
      } else if (priority == 2) {
        print('else2 priority $priority');
        priority_chk = 2;
        forAlarm();
      } else {
        print('else3 priority $priority');
        priority_chk = 3;
        forAlarm();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green,
          title: Center(child: const Text('Caretaker Home Screen'))),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Container(
            width: 400,
            height: 400,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                CustomButton('View Prescription', () async {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return PrescriptionsScreen.Cons1(
                        cid, did, pid, navigatorKey);
                  }));
                }),
                SizedBox(
                  height: 10,
                ),
                CustomButton('  Add Medication  ', () async {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return AddMedicinePage(
                        cid, 0, pid, 'Muhammed', this.navigatorKey);
                  }));
                }),
                SizedBox(
                  height: 10,
                ),
                CustomButton('        Dispenser       ', () async {
                  is_patient = false;
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return DispenserPage1(
                        CareTakerScreen1Page(cid, pid, did, navigatorKey),
                        pid,
                        navigatorKey);
                  }));
                }),
                SizedBox(
                  height: 10,
                ),
                CustomButton('            Back           ', () async {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return HomeScreenPage.Cons1(
                        cid, 'Care Taker', navigatorKey);
                  }));
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
