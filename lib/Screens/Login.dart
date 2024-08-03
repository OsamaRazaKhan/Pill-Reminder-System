import 'dart:convert';

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter/src/foundation/key.dart';
import 'package:pill_reminder_system/Model/model1.dart';
// import 'package:pill_reminder_system/Model/patient.dart';
// import 'package:pill_reminder_system/Screens/caretakerscreen1.dart';
// import 'package:pill_reminder_system/Screens/doctorscreen1.dart';
import 'package:pill_reminder_system/Screens/firstscreen.dart';
import 'package:pill_reminder_system/Screens/homescreen.dart';
import 'package:pill_reminder_system/Screens/patient_homescreen.dart';
import 'package:pill_reminder_system/Utilities/Global/global.dart';
// import 'package:pill_reminder_system/Screens/testscreen1.dart';
// import 'package:pill_reminder_system/utilities/customwidgets/custombutton.dart';
import 'package:pill_reminder_system/utilities/customwidgets/custombutton3.dart';
import 'package:pill_reminder_system/utilities/customwidgets/customdropdownuser.dart';
import 'package:pill_reminder_system/utilities/customwidgets/customtextform.dart';

class LoginPage extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  LoginPage(this.navigatorKey);
  @override
  State<LoginPage> createState() => _LoginPageState(navigatorKey);
}

class _LoginPageState extends State<LoginPage> {
  // ignore: unused_field
  final GlobalKey<NavigatorState> navigatorKey;
  _LoginPageState(this.navigatorKey);
  // ignore: unused_field
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  DropDownExampleState de = DropDownExampleState();
  String? selectedvalue;

  TextEditingController emailcont = TextEditingController();
  TextEditingController passwordcont = TextEditingController();

  Widget w1 = Text(
    'Login',
    style: TextStyle(fontSize: 25),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _scaffoldKey,
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
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return FirstScreenPage(navigatorKey);
                }));
              },
            ),
            SizedBox(
              width: 80,
            ),
            Text('Log In')
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            CustomTextForm(
              'Email id',
              'Email id',
              null,
              false,
              emailcont,
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextForm(
              'Password',
              'Password',
              null,
              false,
              passwordcont,
            ),
            SizedBox(
              height: 10,
            ),

            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black),
              ),
              child: DropdownButton(
                  hint: Text(
                    ' Select type',
                    style: TextStyle(fontSize: 27),
                  ),
                  isExpanded: true,
                  value: selectedvalue,
                  items: de.getMenuItems(),
                  onChanged: (value) {
                    setState(() {
                      selectedvalue = value.toString();
                      // selectedvalue="America";
                    });
                  }),
            ),
            SizedBox(
              height: 30,
            ),
            ////Login Button:
            CustomButton3(w1, () async {
              // print('Good work0');

              User u = new User.Cons1();
              u.email = emailcont.text;
              u.password = passwordcont.text;
              // print('Good work1');
              setState(() {
                w1 = CircularProgressIndicator();
              });
              String? response = await u.login(selectedvalue!);
              setState(() {
                w1 = Text(
                  'Login',
                  style: TextStyle(fontSize: 25),
                );
              });
              // print('Good work6');
              print(response);
              if (response == null || response == "\"false\"") {
                print('false body');
                // Show SnackBar
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Invalid email or password.'),
                  ),
                );
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return LoginPage(navigatorKey);
                }));
              } else {
                print('Good work7');
                if (selectedvalue == "Patient") {
                  dynamic obj = jsonDecode(response);

                  int pid = obj['id'];
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    //  return DispenserPage1( PatientHomePage(pid,emailcont.text,obj['fname'],obj['lname'],navigatorKey),pid,navigatorKey);
                    return PatientHomePage(pid, emailcont.text, obj['fname'],
                        obj['lname'], navigatorKey);
                  }));
                } else if (selectedvalue == "Doctor") {
                  print('hello Doctor1');
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return HomeScreenPage.Cons1(
                        int.parse(response), selectedvalue!, navigatorKey);
                  }));
                } else if (selectedvalue == "Care Taker") {
                  caret_id = int.parse(response);
                  print('hello CareTaker1');
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return HomeScreenPage.Cons1(
                        int.parse(response), selectedvalue!, navigatorKey);
                  }));
                }
              }
            }),
          ],
        ),
      ),
    );
  }
}
