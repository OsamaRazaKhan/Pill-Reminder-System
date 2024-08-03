import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pill_reminder_system/Model/model1.dart';
import 'package:pill_reminder_system/Model/patient.dart';
import 'package:pill_reminder_system/Model/patient_caretaker.dart';
import 'package:pill_reminder_system/Screens/patient_homescreen.dart';
// import 'package:pill_reminder_system/Screens/Login.dart';
// import 'package:pill_reminder_system/Screens/caretakerscreen1.dart';
// import 'package:pill_reminder_system/Screens/doctorscreen1.dart';
// import 'package:pill_reminder_system/Screens/firstscreen.dart';
import 'package:pill_reminder_system/utilities/customwidgets/adddoctor_customalert.dart';
// import 'package:pill_reminder_system/utilities/customwidgets/custombutton.dart';

// ignore: must_be_immutable
class DoctorListPage extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  String email, fname, lname, type;
  int user_id;
  // const HomeScreenPage({Key? key}) : super(key: key);
  DoctorListPage.Cons1(this.user_id, this.email, this.fname, this.lname,
      this.type, this.navigatorKey);
  @override
  State<DoctorListPage> createState() => _DoctorListPageState.Cons1(
      user_id, email, fname, lname, type, navigatorKey);
}

class _DoctorListPageState extends State<DoctorListPage> {
  final GlobalKey<NavigatorState> navigatorKey;
  String email, fname, lname, type;
  int user1_id;
  int? user2_id;
  _DoctorListPageState.Cons1(this.user1_id, this.email, this.fname, this.lname,
      this.type, this.navigatorKey);
  User _user = User.Cons1();
  String arrNames = '[{"id": 1, "name": "John"}, {"id": 2, "name": "Jane"}]';
  Map<int, dynamic> map = {};

  @override
  void initState() {
    // TODO: implement initState
    print('initstate');
    Mymethod();
    super.initState();
  }

  void Mymethod() async {
    print('mymethodstart');

    String? arrNames = await _user.GetDoctors(type);
    //print(arrNames);
    List<dynamic> jsonList = jsonDecode(arrNames!);
    jsonList.forEach((jsonObj) {
      int id = jsonObj['id'];
      print(id.toString());
      dynamic value = jsonObj['fname'] + ' ' + jsonObj['lname'];
      print(value);
      map[id] = value;

      print('doctor body1');
      user2_id = jsonObj['id'];

      print(user2_id);
    });

    setState(() {});
    print('mymethodend');
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
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return PatientHomePage(
                        pid, email, fname, lname, navigatorKey);
                  }));
                },
              ),
              SizedBox(
                width: 50,
              ),
              Text(type == 'doctor' ? 'All Doctors' : 'All Care Takers'),
            ],
          )),
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
                          int id = map.keys.elementAt(index);
                          String name = map[id];
                          final splitted = name.split(' ');
                          String name1 = splitted[0];
                          return GestureDetector(
                            onTap: () async {
                              if (type == 'doctor') {
                                print('add doctor body1');
                                Patient p = Patient();
                                p.id = user1_id;
                                p.name = '';
                                print('add doctor body2');
                                dynamic response =
                                    await p.adddoctor(user1_id, id);

                                if (response == null) {
                                  MyCustomAlertDialogBox7.showCustomAlertBox(
                                    context: context,
                                    willDisplayWidget: Container(
                                      child: Text('Error'),
                                    ),
                                    email: email,
                                    fname: fname,
                                    lname: lname,
                                    patient_id: user1_id,
                                    navigatorKey: navigatorKey,
                                  );
                                } else if (response == '"not found"') {
                                  MyCustomAlertDialogBox7.showCustomAlertBox(
                                    context: context,
                                    willDisplayWidget: Container(
                                      child: Text('$response'),
                                    ),
                                    email: email,
                                    fname: fname,
                                    lname: lname,
                                    patient_id: user1_id,
                                    navigatorKey: navigatorKey,
                                  );
                                } else {
                                  print('hi man good work');
                                  MyCustomAlertDialogBox7.showCustomAlertBox(
                                    context: context,
                                    willDisplayWidget: Container(
                                      child: Text('Doctor selected sucessfuly'),
                                    ),
                                    email: email,
                                    fname: fname,
                                    lname: lname,
                                    patient_id: user1_id,
                                    navigatorKey: navigatorKey,
                                  );
                                }
                              } else {
                                Patient_CareTaker p_c = Patient_CareTaker();
                                p_c.patient_id = user1_id;
                                p_c.caretaker_id = id;
                                p_c.status = "available";
                                p_c.status2 = "available";
                                p_c.priority = 0;
                                dynamic response3 = await p_c.addobject();

                                if (response3 != '"Exsist"' &&
                                    response3 != null) {
                                  MyCustomAlertDialogBox7.showCustomAlertBox(
                                    context: context,
                                    willDisplayWidget: Container(
                                      child: Text(
                                          'Care Taker selected sucessfuly'),
                                    ),
                                    email: email,
                                    fname: fname,
                                    lname: lname,
                                    patient_id: user1_id,
                                    navigatorKey: navigatorKey,
                                  );
                                } else if (response3 == '"Exsist"') {
                                  MyCustomAlertDialogBox7.showCustomAlertBox(
                                    context: context,
                                    willDisplayWidget: Container(
                                      child: Text(
                                          'You have already this Care Taker'),
                                    ),
                                    email: email,
                                    fname: fname,
                                    lname: lname,
                                    patient_id: user1_id,
                                    navigatorKey: navigatorKey,
                                  );
                                } else {
                                  MyCustomAlertDialogBox7.showCustomAlertBox(
                                    context: context,
                                    willDisplayWidget: Container(
                                      child: Text('Sorry! There is some issue'),
                                    ),
                                    email: email,
                                    fname: fname,
                                    lname: lname,
                                    patient_id: user1_id,
                                    navigatorKey: navigatorKey,
                                  );
                                }
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
            type == 'doctor' ? 'Select your Doctor' : 'Select your Care Taker',
            style: TextStyle(
                fontSize: 21, fontWeight: FontWeight.w500, color: Colors.blue),
          ),
        ],
      ),
    );
  }
}
