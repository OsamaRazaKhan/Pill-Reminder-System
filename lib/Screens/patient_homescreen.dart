// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pill_reminder_system/Model/Patientalarm.dart';
import 'package:pill_reminder_system/Model/model1.dart';
import 'package:pill_reminder_system/Model/patient.dart';
import 'package:pill_reminder_system/Screens/Login.dart';
import 'package:pill_reminder_system/Screens/dispenserscreen1.dart';
import 'package:pill_reminder_system/Screens/doctorslist.dart';
import 'package:pill_reminder_system/Utilities/Global/global.dart';
import 'package:pill_reminder_system/utilities/Global/global2.dart';
// import 'package:pill_reminder_system/Screens/testscreen2.dart';
// import 'package:pill_reminder_system/Screens/testscreen3.dart';
import 'package:pill_reminder_system/utilities/customwidgets/custombutton.dart';
import 'package:pill_reminder_system/utilities/customwidgets/patient_emergencyalert.dart';

// ignore: must_be_immutable
class PatientHomePage extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  int patient_id;
  String fname, lname, email;
  PatientHomePage(
      this.patient_id, this.email, this.fname, this.lname, this.navigatorKey);
  @override
  State<PatientHomePage> createState() =>
      _PatientHomePageState(patient_id, email, fname, lname, navigatorKey);
}

class _PatientHomePageState extends State<PatientHomePage> {
  final GlobalKey<NavigatorState> navigatorKey;
  int patient_id;
  String fname, lname, email;
  _PatientHomePageState(
      this.patient_id, this.email, this.fname, this.lname, this.navigatorKey);
  User u = User(0, '', '');
  @override
  void initState() {
    forAlarm();
    // TODO: implement initState
    print('initstate');
    //status_chk = true;

    super.initState();
  }

  void forAlarm() async {
    if (is_snooze == false) {
      Alarm2 alarm = Alarm2(navigatorKey, patient_id,
          PatientHomePage(patient_id, email, fname, lname, navigatorKey));
      await alarm.scheduleAlarm();
      // Alarm2 alarm2 = Alarm2(navigatorKey,pid,CareTakerScreen1Page(cid,pid,did,navigatorKey));
      // await alarm2.scheduleAlarm();
    }
  }

  Future<String> checkavailability(int pid) async {
    Patient p = Patient();
    p.name = fname;
    p.id = pid;
    String chk = await p.Isavailable(pid);
    return chk;
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Return the AlertDialog
        return AlertDialog(
          title: Text('Do you want to change Doctor?'),
          content: Text('You already have a doctor'),
          actions: [
            TextButton(
              child: Text('No'),
              onPressed: () {
                // Close the dialog
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DoctorListPage.Cons1(patient_id,
                          email, fname, lname, 'doctor', navigatorKey)),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
    
          backgroundColor: Colors.green, title: Text('Patient Home Screen')),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Container(
            width: 400,
            height: 400,
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                CustomButton('View Dispenser', () async {
                  is_patient = true;
                  Widget w1 = PatientHomePage(
                      patient_id, email, fname, lname, navigatorKey);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return DispenserPage1(w1, patient_id, navigatorKey);
                  }));
                }),
                SizedBox(
                  height: 10,
                ),
                CustomButton('   Emergency   ', () async {
                  String? response =
                      await u.ChangeState(patient_id, "emergency");
                  print(response);
                  Patinet_EmergencyAlert.showCustomAlertBox(
                    context: context,
                    willDisplayWidget: Container(
                      child: Text('Emergency alarm generated'),
                    ),
                    patient_id: patient_id,
                    email: email,
                    fname: fname,
                    lname: lname,
                    navigatorKey: navigatorKey,
                  );
                }),
                SizedBox(
                  height: 10,
                ),
                CustomButton('        Back        ', () async {
                  is_snooze = false;
                  if (fnplugin != null) fnplugin = null;
                  snooze_count = 0;
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return LoginPage(navigatorKey);
                  }));
                }),
              ],
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        child: Container(
                          child: Icon(Icons.person),
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('$fname $lname ',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          Text('$fname _' + '$patient_id'),
                          Text('$email'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Add Doctor'),
              onTap: () async {
                String chk = await checkavailability(patient_id);
                if (chk == '"true"') {
                  _showDialog();
                } else if (chk == '"false"') {
                  // Navigator.pop(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DoctorListPage.Cons1(patient_id,
                            email, fname, lname, 'doctor', navigatorKey)),
                  );
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Add Caretaker'),
              onTap: () {
                //   Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DoctorListPage.Cons1(patient_id,
                          email, fname, lname, 'caretaker', navigatorKey)),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // _scaffoldKey.currentState.openDrawer();
        },
        child: Icon(Icons.person),
      ),
    );
  }
}
