import 'dart:convert';
// import 'package:pill_reminder_system/utilities/customwidgets/customtextform.dart';
// import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:pill_reminder_system/Model/Medicine.dart';
import 'package:pill_reminder_system/Model/Schedule.dart';
// import 'package:pill_reminder_system/Screens/doctorscreen1.dart';
import 'package:pill_reminder_system/Screens/updatemedscreen1.dart';
// import 'package:pill_reminder_system/utilities/customwidgets/addpres_customalert.dart';
// import 'package:pill_reminder_system/utilities/customwidgets/customcheckbox.dart';
// import 'package:pill_reminder_system/utilities/customwidgets/custombutton.dart';
// import 'package:pill_reminder_system/utilities/customwidgets/customcheckbutton.dart';
import 'package:pill_reminder_system/utilities/customwidgets/customdropdownPill.dart';
import 'package:pill_reminder_system/utilities/customwidgets/updatemed_customalert.dart';

// ignore: must_be_immutable
class UpdateMedicinePage extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  String key1, value1, image;
  int dosage;
  String pname;
  int patient_id, doctor_id;
  Map<String, dynamic> map = {};
  UpdateMedicinePage(this.key1, this.value1, this.dosage, this.image,
      this.patient_id, this.doctor_id, this.pname, this.navigatorKey);
  // const UpdateMedicinePage({Key? key}) : super(key: key);
  dynamic o1;
  @override
  State<UpdateMedicinePage> createState() => o1 = UpdateMedicinePageState(
      key1, value1, dosage, image, patient_id, doctor_id, pname, navigatorKey);

  Func1() {
    o1.Func1();
  }
}

class UpdateMedicinePageState extends State<UpdateMedicinePage> {
  final GlobalKey<NavigatorState> navigatorKey;
  String name, type1, image;
  String pname;
  int dosage;
  int patient_id, doctor_id;
  UpdateMedicinePageState(this.name, this.type1, this.dosage, this.image,
      this.patient_id, this.doctor_id, this.pname, this.navigatorKey) {
    print(dosage);
  }
  DropDownExampleState de = DropDownExampleState();
  int response1 = 0;
  String? response2;
  // ignore: unused_field
  File? _image;
  Widget? imageWidget;
  String? selectedvalue;
  String? s_date = 'Start Date', e_date = 'End Date';
  bool chk1 = false,
      chk2 = false,
      chk3 = false,
      chk4 = false,
      chk5 = false,
      chk6 = false,
      chk7 = false;
  bool chk8 = false, chk9 = false, chk10 = false, chk11 = false;
  bool _textFieldValue = false;
  TextEditingController dosagecont = TextEditingController();

  Schedule s1 = Schedule(
      true, true, true, true, true, true, true, true, true, true, true, 0);
  String schd = '';
  Map<String, dynamic> map = {};
  DateTime sminDate = DateTime.now();
  DateTime smaxDate = DateTime.now().add(Duration(days: 150));
  DateTime eminDate = DateTime.now();
  DateTime emaxDate = DateTime.now().add(Duration(days: 730));
  String? Split_func(String st) {
    final st1 = st.split(' ');
    return st1[0];
  }

  @override
  void initState() {
    // TODO: implement initState
    print('initstate');

    String imageString = image;
    Uint8List imageBytes = base64Decode(imageString);
    imageWidget = Image.memory(imageBytes);

    Mymethod();
    super.initState();
  }

  void Mymethod() async {
    print('mymethodstart');
    print(name);
    print(type1);
    String? schd = await s1.GetMedSchedule(name, type1);
    print(schd);
    dynamic jsonObj = jsonDecode(schd!);
    //  int? id;
    jsonObj.forEach((element) {
      //    print(element['med_id'].toString());
      //  id = int.parse(element['med_id']);
      String mon = element['mon'];
      mon == "true" ? chk1 = true : chk1 = false;
      String tue = element['tue'];
      tue == "true" ? chk2 = true : chk2 = false;
      String wed = element['wed'];
      wed == "true" ? chk3 = true : chk3 = false;
      String thr = element['thr'];
      thr == "true" ? chk4 = true : chk4 = false;
      String fri = element['fri'];
      fri == "true" ? chk5 = true : chk5 = false;
      String sat = element['sat'];
      sat == "true" ? chk6 = true : chk6 = false;
      String sun = element['sun'];
      sun == "true" ? chk7 = true : chk7 = false;
      String morn = element['morn'];
      morn == "true" ? chk8 = true : chk8 = false;
      String noon = element['noon'];
      noon == "true" ? chk9 = true : chk9 = false;
      String even = element['even'];
      even == "true" ? chk10 = true : chk10 = false;
      String night = element['night'];
      night == "true" ? chk11 = true : chk11 = false;
    });
    setState(() {});
    print('mymethodend');
  }

  Func1() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              GestureDetector(
                child: Container(
                    height: 40,
                    width: 40,
                    child: Image.asset('assets/images/backward.jpeg')),
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return UpdateScreen1.Cons1(
                        patient_id, doctor_id, pname, navigatorKey);
                  }));
                },
              ),
              SizedBox(
                width: 40,
              ),
              Text('Patient: $pname'),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),

              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black),
                ),
                child: ListTile(
                  leading: Container(
                    height: 90,
                    width: 90,
                    child: imageWidget,
                  ),
                  title: Text(
                    '$name',
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    '$type1',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  //trailing: Icon(Icons.add),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              TextFormField(
                controller: dosagecont,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  border: OutlineInputBorder(),
                  hintText: 'dosage',
                  labelText: 'dosage: $dosage',
                ),
                onChanged: (value) {
                  // This function will be called every time the user types something in the text field

                  _textFieldValue = true;

                  // Apply conditions based on the entered text
                  if (value.length > 10) {
                    // Do something if the length of the entered text is greater than 10
                  } else {
                    // Do something else
                  }
                },
              ),
              /////////////////////////////////////////////////////////////////////
              SizedBox(
                height: 10,
              ),

              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black),
                ),
                child: TextButton(
                  onPressed: () async {
                    DateTime? dateTime = await showOmniDateTimePicker(
                      context: context,
                      initialDate: sminDate,
                      firstDate: sminDate,
                      //DateTime(1600).subtract(const Duration(days: 3652)),
                      lastDate: smaxDate,
                      is24HourMode: false,
                      isShowSeconds: false,
                      minutesInterval: 1,
                      secondsInterval: 1,
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      constraints: const BoxConstraints(
                        maxWidth: 350,
                        maxHeight: 650,
                      ),
                      transitionBuilder: (context, anim1, anim2, child) {
                        return FadeTransition(
                          opacity: anim1.drive(
                            Tween(
                              begin: 0,
                              end: 1,
                            ),
                          ),
                          child: child,
                        );
                      },
                      transitionDuration: const Duration(milliseconds: 200),
                      barrierDismissible: true,
                      selectableDayPredicate: (dateTime) {
                        // Disable 25th Feb 2023
                        if (dateTime == DateTime(2023, 2, 25)) {
                          return false;
                        } else {
                          return true;
                        }
                      },
                    );
                    setState(() {
                      eminDate = dateTime!;
                      s_date = dateTime.toString();
                      s_date = Split_func(s_date!);
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          ' $s_date',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 28,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      Container(
                        child: Icon(Icons.schedule),
                      ),
                    ],
                  ),
                ),
              ),
              ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
              SizedBox(
                height: 10,
              ),

              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black),
                ),
                child: TextButton(
                  onPressed: () async {
                    print('hello brother..............');
                    print(eminDate);
                    DateTime? dateTime = await showOmniDateTimePicker(
                      context: context,
                      initialDate: eminDate,
                      firstDate: eminDate,
                      //DateTime(1600).subtract(const Duration(days: 3652)),
                      lastDate: DateTime.now().add(
                        const Duration(days: 730),
                      ),

                      is24HourMode: false,
                      isShowSeconds: false,
                      minutesInterval: 1,
                      secondsInterval: 1,
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      constraints: const BoxConstraints(
                        maxWidth: 350,
                        maxHeight: 650,
                      ),
                      transitionBuilder: (context, anim1, anim2, child) {
                        return FadeTransition(
                          opacity: anim1.drive(
                            Tween(
                              begin: 0,
                              end: 1,
                            ),
                          ),
                          child: child,
                        );
                      },
                      transitionDuration: const Duration(milliseconds: 200),
                      barrierDismissible: true,
                      selectableDayPredicate: (dateTime) {
                        // Disable 25th Feb 2023
                        if (dateTime == DateTime(2023, 2, 25)) {
                          return false;
                        } else {
                          return true;
                        }
                      },
                    );
                    setState(() {
                      // sminDate = dateTime!;
                      smaxDate = dateTime!;
                      e_date = dateTime.toString();
                      print('testing...... $e_date');
                      e_date = Split_func(e_date!);
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          ' $e_date',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 28,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      Container(
                        child: Icon(Icons.schedule),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 30,
              ),
              Text(
                'Select days to take',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
              /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        //         CustomCheckButton(chk1,'Mon'),

                        ElevatedButton(
                          onPressed: () {
                            chk1 == false ? chk1 = true : chk1 = false;
                            setState(() {});
                          },
                          child: Text("Mon"),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                chk1 == false ? Colors.grey : Colors.green),
                            textStyle: MaterialStateProperty.all(TextStyle(
                                fontSize: 20, decorationColor: Colors.black)),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            chk2 == false ? chk2 = true : chk2 = false;
                            setState(() {});
                          },
                          child: Text("Tue"),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                chk2 == false ? Colors.grey : Colors.green),
                            textStyle: MaterialStateProperty.all(TextStyle(
                                fontSize: 20, decorationColor: Colors.black)),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            chk3 == false ? chk3 = true : chk3 = false;
                            setState(() {});
                          },
                          child: Text("Wed"),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                chk3 == false ? Colors.grey : Colors.green),
                            textStyle: MaterialStateProperty.all(TextStyle(
                                fontSize: 20, decorationColor: Colors.black)),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            chk4 == false ? chk4 = true : chk4 = false;
                            setState(() {});
                          },
                          child: Text("Thu"),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                chk4 == false ? Colors.grey : Colors.green),
                            textStyle: MaterialStateProperty.all(TextStyle(
                                fontSize: 20, decorationColor: Colors.black)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              /////////////////////////////////////////////////////////////////////////////////////////////////////////
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          chk5 == false ? chk5 = true : chk5 = false;
                          setState(() {});
                        },
                        child: Text("Fri"),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              chk5 == false ? Colors.grey : Colors.green),
                          textStyle: MaterialStateProperty.all(TextStyle(
                              fontSize: 20, decorationColor: Colors.black)),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          chk6 == false ? chk6 = true : chk6 = false;
                          setState(() {});
                        },
                        child: Text("Sat"),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              chk6 == false ? Colors.grey : Colors.green),
                          textStyle: MaterialStateProperty.all(TextStyle(
                              fontSize: 20, decorationColor: Colors.black)),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          chk7 == false ? chk7 = true : chk7 = false;
                          setState(() {});
                        },
                        child: Text("Sun"),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              chk7 == false ? Colors.grey : Colors.green),
                          textStyle: MaterialStateProperty.all(TextStyle(
                              fontSize: 20, decorationColor: Colors.black)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(
                height: 15,
              ),
              Text(
                'Select Timing ',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            chk8 == false ? chk8 = true : chk8 = false;
                            setState(() {});
                          },
                          child: Text("Morning"),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                chk8 == false ? Colors.grey : Colors.green),
                            textStyle: MaterialStateProperty.all(TextStyle(
                                fontSize: 15, decorationColor: Colors.black)),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            chk9 == false ? chk9 = true : chk9 = false;
                            setState(() {});
                          },
                          child: Text("Noon"),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                chk9 == false ? Colors.grey : Colors.green),
                            textStyle: MaterialStateProperty.all(TextStyle(
                                fontSize: 15, decorationColor: Colors.black)),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            chk10 == false ? chk10 = true : chk10 = false;
                            setState(() {});
                          },
                          child: Text("Evening"),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                chk10 == false ? Colors.grey : Colors.green),
                            textStyle: MaterialStateProperty.all(TextStyle(
                                fontSize: 15, decorationColor: Colors.black)),
                          ),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            chk11 == false ? chk11 = true : chk11 = false;
                            setState(() {});
                          },
                          child: Text("Night"),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                chk11 == false ? Colors.grey : Colors.green),
                            textStyle: MaterialStateProperty.all(TextStyle(
                                fontSize: 15, decorationColor: Colors.black)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Clear',
                          style: TextStyle(fontSize: 30),
                        )),
                    SizedBox(
                      width: 90,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          print('update body1');
                          print(dosagecont.text);

                          if (_textFieldValue == true)
                            dosage = int.parse(dosagecont.text);

                          Pill p = new Pill();
                          p.name = this.name;
                          p.type = this.type1;
                          p.image = '';
                          p.color = '';
                          p.no_dosage = dosage;
                          if (s_date != 'Start Date' && e_date != 'End Date') {
                            print("checking for dates.............");
                            print(s_date);
                            print(e_date);
                            p.start_date = s_date!;
                            p.end_date = e_date!;
                          } else {
                            p.start_date = '';
                            p.end_date = '';
                          }

                          p.cid = 0;
                          p.did = 0;
                          p.pid = patient_id;
                          print('update body2');
                          dynamic response3 = await p.updatepill();
                          response1 = int.parse(response3);

                          if (response3 != "not found") {
                            Schedule sd = Schedule(
                                chk1,
                                chk2,
                                chk3,
                                chk4,
                                chk5,
                                chk6,
                                chk7,
                                chk8,
                                chk9,
                                chk10,
                                chk11,
                                response1);
                            dynamic response2 = await sd.updateschedule();
                            print(response2.toString());
                            if (response2 != "not found") if (response2 != null)
                              MyCustomAlertDialogBox3.showCustomAlertBox(
                                context: context,
                                willDisplayWidget: Container(
                                  child: Text('Modified'),
                                ),
                                name: name,
                                type: type1,
                                dosage: dosage,
                                image: image,
                                patient_id: patient_id,
                                doctor_id: doctor_id,
                                pname: pname,
                                navigatorKey: navigatorKey,
                              );
                          }
                        },
                        child: Text(
                          'Update',
                          style: TextStyle(fontSize: 30),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
