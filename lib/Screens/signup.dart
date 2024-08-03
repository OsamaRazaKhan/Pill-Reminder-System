import 'package:flutter/material.dart';
import 'package:pill_reminder_system/Model/model1.dart';
// import 'package:pill_reminder_system/Model/patient.dart';
import 'package:pill_reminder_system/Screens/firstscreen.dart';
// import 'package:pill_reminder_system/Screens/homescreen.dart';
// import 'package:pill_reminder_system/Screens/signup2.dart';
// import 'package:pill_reminder_system/Screens/testscreen1.dart';
import 'package:pill_reminder_system/utilities/customwidgets/custombutton.dart';
import 'package:pill_reminder_system/utilities/customwidgets/customdropdownuser.dart';
import 'package:pill_reminder_system/utilities/customwidgets/customtextform.dart';
// import 'package:alert_dialog/alert_dialog.dart';
// import 'package:custom_alert_dialog_box/custom_alert_dialog_box.dart';
import 'package:pill_reminder_system/utilities/customwidgets/mycustomalert.dart';

class SignupPage extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  // const SignupPage({Key? key}) : super(key: key);
  SignupPage(this.navigatorKey);
  @override
  State<SignupPage> createState() => _SignupPageState(navigatorKey);
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<NavigatorState> navigatorKey;
  _SignupPageState(this.navigatorKey);
  DropDownExampleState de = DropDownExampleState();
  String? selectedvalue;
  String? response;
  TextEditingController fnamecont = new TextEditingController();
  TextEditingController lnamecont = new TextEditingController();
  TextEditingController emailcont = new TextEditingController();
  TextEditingController passwordcont = new TextEditingController();
  TextEditingController typecont = new TextEditingController();
  TextEditingController confirmpasswordcont = new TextEditingController();

  /*  String? validateFirstName(String value) {
  if (value.isEmpty) {
    return 'First name is required.';
  }
  if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
    return 'Only alphabets are allowed.';
  }
  return null;
}

// validate last name
String? validateLastName(String value) {
  if (value.isEmpty) {
    return 'Last name is required.';
  }
  if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
    return 'Only alphabets are allowed.';
  }
  return null;
}

// validate email
String? validateEmail(String value) {
  if (value.isEmpty) {
    return 'Email is required.';
  }
  if (!RegExp(r'^\w+([.-]?\w+)*@\w+([.-]?\w+)*(\.\w{2,3})+$')
      .hasMatch(value)) {
    return 'Invalid email format.';
  }
  return null;
}

// validate password
String? validatePassword(String value) {
  if (value.isEmpty) {
    return 'Password is required.';
  }
  if (value.length < 6) {
    return 'Password must be at least 6 characters long.';
  }
  if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
    return 'Only alphabets and numerics are allowed.';
  }
  return null;
}

// validate confirm password
String? validateConfirmPassword(String value, String password) {
  if (value.isEmpty) {
    return 'Confirm password is required.';
  }
  if (value != password) {
    return 'Passwords do not match.';
  }
  return null;
}*/
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
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return FirstScreenPage(navigatorKey);
                }));
              },
            ),
            SizedBox(
              width: 80,
            ),
            Text('Sign Up')
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              CustomTextForm(
                'First Name',
                'First Name',
                null,
                false,
                fnamecont,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextForm(
                'Last Name',
                'Last Name',
                null,
                false,
                lnamecont,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextForm(
                'Email',
                'Email',
                null,
                false,
                emailcont,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextForm(
                'Create Password',
                'Password',
                null,
                false,
                passwordcont,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextForm(
                'Password',
                'Confirm Password',
                null,
                false,
                confirmpasswordcont,
              ),
              SizedBox(
                height: 10,
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
              CustomButton('Sign up', () async {
                if (passwordcont.text != confirmpasswordcont.text) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please Confirm your password'),
                    ),
                  );
                  passwordcont.clear();
                  confirmpasswordcont.clear();
                } else {
                  User u = User.Cons1();
                  u.fname = fnamecont.text;
                  u.lname = lnamecont.text;
                  //    u.type=typecont.text;
                  u.email = emailcont.text;
                  u.password = passwordcont.text;

                  print('good work1');
                  response = await u.signupObject(selectedvalue!);
                  fnamecont.clear();
                  lnamecont.clear();
                  emailcont.clear();
                  passwordcont.clear();
                  confirmpasswordcont.clear();
                  if (response == null) {
                    MyCustomAlertDialogBox.showCustomAlertBox(
                      context: context,
                      willDisplayWidget: Container(
                        child: Text('An error occured while registration'),
                      ),
                      navigatorKey: navigatorKey,
                    );
                  } else if (response == 'Exsist') {
                    MyCustomAlertDialogBox.showCustomAlertBox(
                      context: context,
                      willDisplayWidget: Container(
                        child: Text('Account already exsist'),
                      ),
                      navigatorKey: navigatorKey,
                    );
                  } else if (response == 'Created') {
                    MyCustomAlertDialogBox.showCustomAlertBox(
                      context: context,
                      willDisplayWidget: Container(
                        child: Text('Sign Up Successfully'),
                      ),
                      navigatorKey: navigatorKey,
                    );
                    // return alert(context, title: const Text('Sign Up Successfully'));
                  }

                  setState(() {});
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
