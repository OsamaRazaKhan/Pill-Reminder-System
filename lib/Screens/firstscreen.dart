import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter/src/foundation/key.dart';
// ignore: unnecessary_import
import 'package:flutter/src/widgets/framework.dart';
import 'package:pill_reminder_system/Screens/Login.dart';
import 'package:pill_reminder_system/Screens/signup.dart';
import 'package:pill_reminder_system/utilities/customwidgets/custombutton.dart';

class FirstScreenPage extends StatefulWidget {
  //const FirstScreenPage({Key? key}) : super(key: key);
  final GlobalKey<NavigatorState> navigatorKey;
  FirstScreenPage(this.navigatorKey);
  @override
  State<FirstScreenPage> createState() => _FirstScreenPageState(navigatorKey);
}

class _FirstScreenPageState extends State<FirstScreenPage> {
  final GlobalKey<NavigatorState> navigatorKey;
  _FirstScreenPageState(this.navigatorKey);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('')),
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: Center(
          child: Container(
            width: 200,
            height: 200,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                CustomButton('Sign Up', () async {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return SignupPage(navigatorKey);
                  }));
                }),
                SizedBox(
                  height: 10,
                ),
                CustomButton('  Login  ', () async {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return LoginPage(navigatorKey);
                  }));
                }),
              ],
            ),
          ),
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backimg3.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
