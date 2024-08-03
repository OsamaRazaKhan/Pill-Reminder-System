import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:pill_reminder_system/Model/Medicine.dart';
import 'package:pill_reminder_system/Model/Schedule.dart';
import 'package:pill_reminder_system/Screens/caretakerscreen1.dart';
import 'package:pill_reminder_system/Screens/doctorscreen1.dart';
import 'package:pill_reminder_system/utilities/customwidgets/addmed_customalert.dart';
import 'package:pill_reminder_system/utilities/customwidgets/customdropdownPill.dart';
import 'package:pill_reminder_system/utilities/customwidgets/customtextform.dart';

// ignore: must_be_immutable
class AddMedicinePage extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  int cid, did, pid;
  String pname;
  // const AddMedicinePage({Key? key}) : super(key: key);
  AddMedicinePage(this.cid, this.did, this.pid, this.pname, this.navigatorKey);

  @override
  State<AddMedicinePage> createState() =>
      _AddMedicinePageState(cid, did, pid, pname, navigatorKey);
}

class _AddMedicinePageState extends State<AddMedicinePage> {
  final GlobalKey<NavigatorState> navigatorKey;
  int cid, did, pid;
  String pname;
  _AddMedicinePageState(
      this.cid, this.did, this.pid, this.pname, this.navigatorKey);
  DropDownExampleState de = DropDownExampleState();
  File? _image;
  String? selectedvalue;
  bool chk1 = false,
      chk2 = false,
      chk3 = false,
      chk4 = false,
      chk5 = false,
      chk6 = false,
      chk7 = false;
  bool chk8 = false, chk9 = false, chk10 = false, chk11 = false;
  int response1 = 0;
  Color selectedColor = Colors.blue;
  TextEditingController namecont = new TextEditingController();
  TextEditingController dosagecont = new TextEditingController();
  Schedule s1 = Schedule(
      true, true, true, true, true, true, true, true, true, true, true, 0);

  String? s_date = 'Start Date', e_date = 'End Date';
  DateTime sminDate = DateTime.now();
  DateTime smaxDate = DateTime.now().add(Duration(days: 150));
  DateTime eminDate = DateTime.now();
  DateTime emaxDate = DateTime.now().add(Duration(days: 730));

  String? Split_func(String st) {
    final st1 = st.split(' ');
    return st1[0];
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
                  return cid == 0
                      ? DoctorScreen1Page(did, pid, pname, this.navigatorKey)
                      : CareTakerScreen1Page(cid, pid, did, this.navigatorKey);
                }));
              },
            ),
            SizedBox(
              width: 60,
            ),
            Text('Patient: $pname'),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 0,
              ),
              CustomTextForm(
                'Pill Name',
                'Pill Name',
                null,
                false,
                namecont,
              ),
              SizedBox(
                height: 7,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black),
                ),
                child: Container(
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
              ),
              SizedBox(
                height: 7,
              ),
              CustomTextForm(
                'Dosage',
                'Dosage',
                null,
                false,
                dosagecont,
              ),
              SizedBox(
                height: 7,
              ),
              ////////////////////////////////////////////////////////////////////////////////////////////////////
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black),
                      ),
                      child: TextButton(
                        onPressed: () async {
                          print(
                              "........................................................");
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
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
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
                            transitionDuration:
                                const Duration(milliseconds: 200),
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
                                '$s_date',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 23,
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
                      width: 5,
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
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
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
                            transitionDuration:
                                const Duration(milliseconds: 200),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                '$e_date',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 23,
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
                  ],
                ),
              ),

              ///

              ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

              Text(
                'Select days to take',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
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

              Text(
                'Select Timing ',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),

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
                          onPressed: () async {
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
              SizedBox(height: 8),
              Text(
                'Select Image From: ',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
              /////////////////////////////////////////////////////////////////////////////////////////
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              XFile? picked_image = await ImagePicker()
                                  .pickImage(source: ImageSource.camera);
                              if (picked_image != null) {
                                setState(() {
                                  _image = File(picked_image.path);
                                });
                              }

                              setState(() {});
                            },
                            child: Text("Camera"),
                            style: ButtonStyle(),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              XFile? picked_image = await ImagePicker()
                                  .pickImage(source: ImageSource.gallery);
                              if (picked_image != null) {
                                setState(() {
                                  _image = File(picked_image.path);
                                });
                              }

                              setState(() {});
                            },
                            child: Text("Photos"),
                            style: ButtonStyle(),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 150,
                      child: _image == null
                          ? Image.asset('assets/images/imgicon.jpeg')
                          : Image.file(
                              _image!,
                              fit: BoxFit.fill,
                            ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 100,
                          height: 40,
                          color: selectedColor,
                        ),
                        const SizedBox(height: 2),
                        ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Pick a color'),
                                  content: SingleChildScrollView(
                                    child: ColorPicker(
                                      pickerColor: selectedColor,
                                      onColorChanged: (color) {
                                        setState(() {
                                          selectedColor = color;
                                          print(color);
                                          /*   String st = selectedColor.toString();
                      final splitted1 = st.split('(');
                      final splitted2 = splitted1[1].split(')');
                      print(splitted2[0]);
                      print(Color(int.parse(splitted2[0])));*/
                                        });
                                      },
                                      //enableLabel: true,
                                      pickerAreaHeightPercent: 0.8,
                                    ),
                                  ),
                                  actions: <Widget>[
                                    ElevatedButton(
                                      child: Text('OK'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: const Text('Pick a color'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
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
                      width: 110,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          print('add body1');
                          if (_image != null) {
                            print('add body2');
                            if (s_date != 'Start Date' &&
                                e_date != 'End Date') {
                              print('add body3');
                              var v = await _image!.readAsBytes();
                              String convertedpic = base64Encode(v);
                              print('add body4');
                              Pill p = new Pill();
                              p.name = namecont.text;
                              p.type = selectedvalue!;
                              p.image = convertedpic;
                              p.color = selectedColor.toString();
                              p.no_dosage = int.parse(dosagecont.text);
                              p.start_date = s_date!;
                              p.end_date = e_date!;
                              p.cid = this.cid;
                              p.pid = this.pid;
                              p.did = this.did;
                              print('add body2');
                              dynamic response3 = await p.addpill();
                              print(response3);
                              print('add body8');
                              if (response3 == '"Exsist"') {
                                print('Exist body');
                                MyCustomAlertDialogBox4.showCustomAlertBox(
                                  context: context,
                                  willDisplayWidget: Container(
                                    child: Text('Medicine Already Exsist'),
                                  ),
                                  cid: cid,
                                  did: did,
                                  pid: pid,
                                  pname: pname,
                                  navigatorKey: navigatorKey,
                                );
                              }
                              if (response3 == null) {
                                print('null body');
                                MyCustomAlertDialogBox4.showCustomAlertBox(
                                  context: context,
                                  willDisplayWidget: Container(
                                    child: Text('Sorry! There is some issue'),
                                  ),
                                  cid: cid,
                                  did: did,
                                  pid: pid,
                                  pname: pname,
                                  navigatorKey: navigatorKey,
                                );
                              } else {
                                print('else body');
                                print('add schedule body1');
                                response1 = int.parse(response3);
                                print('add schedule body1');

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
                                print('add schedule body2');
                                dynamic response2 = await sd.addmedschedule();
                                print('add schedule body6');
                                print(response2.toString());
                                if (response2 != "Exsist") if (response2 !=
                                    null)
                                  MyCustomAlertDialogBox4.showCustomAlertBox(
                                    context: context,
                                    willDisplayWidget: Container(
                                      child: Text('Added Successfuly'),
                                    ),
                                    cid: cid,
                                    did: did,
                                    pid: pid,
                                    pname: pname,
                                    navigatorKey: navigatorKey,
                                  );
                              }
                            } else {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(''),
                                    content: Text(
                                        'Please select start and end date'),
                                    actions: <Widget>[
                                      ElevatedButton(
                                        child: Text('OK'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(''),
                                  content: Text(
                                      'Please pick image for this medicine'),
                                  actions: <Widget>[
                                    ElevatedButton(
                                      child: Text('OK'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        child: Text(
                          'Save',
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
