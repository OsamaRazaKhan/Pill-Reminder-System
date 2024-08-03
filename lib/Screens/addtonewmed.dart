import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
//import 'package:pill_reminder_system/utilities/customwidgets/customtextform.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:pill_reminder_system/Model/Medicine.dart';
import 'package:pill_reminder_system/Model/Schedule.dart';
//import 'package:pill_reminder_system/Screens/doctorscreen1.dart';
//import 'package:pill_reminder_system/Screens/updatemedscreen1.dart';
import 'package:pill_reminder_system/Screens/viewprescriptions.dart';
//import 'package:pill_reminder_system/utilities/customwidgets/addpres_customalert.dart';
import 'package:pill_reminder_system/utilities/customwidgets/addtonewmed_customalert.dart';
//import 'package:pill_reminder_system/utilities/customwidgets/customcheckbox.dart';
//import 'package:pill_reminder_system/utilities/customwidgets/custombutton.dart';
//import 'package:pill_reminder_system/utilities/customwidgets/customcheckbutton.dart';
import 'package:pill_reminder_system/utilities/customwidgets/customdropdownPill.dart';

//import 'package:pill_reminder_system/utilities/customwidgets/updatemed_customalert.dart';

// ignore: must_be_immutable
class AddToNewMedScreen extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  String name, type, s_date, e_date;
  int dosage, weight;
  int cid, did, pid;
  Map<String, dynamic> map = {};
  AddToNewMedScreen(this.name, this.type, this.dosage, this.weight, this.cid,
      this.did, this.pid, this.s_date, this.e_date, this.navigatorKey);
  // const UpdateMedicinePage({Key? key}) : super(key: key);
  dynamic o1;
  @override
  State<AddToNewMedScreen> createState() => o1 = AddToNewMedScreenState(
      name, type, dosage, weight, cid, did, pid, s_date, e_date, navigatorKey);

  Func1() {
    o1.Func1();
  }
}

class AddToNewMedScreenState extends State<AddToNewMedScreen> {
  final GlobalKey<NavigatorState> navigatorKey;
  String name, type1, s_date, e_date;
  int dosage, weight;
  int cid, did, pid;
  AddToNewMedScreenState(
      this.name,
      this.type1,
      this.dosage,
      this.weight,
      this.cid,
      this.did,
      this.pid,
      this.s_date,
      this.e_date,
      this.navigatorKey) {
    print(dosage);
  }
  DropDownExampleState de = DropDownExampleState();
  int response1 = 0;
  String? response2;
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
  Color selectedColor = Colors.blue;
  TextEditingController dosagecont = TextEditingController();

  Schedule s1 = Schedule(
      true, true, true, true, true, true, true, true, true, true, true, 0);
  String schd = '';
  Map<String, dynamic> map = {};

  @override
  void initState() {
    // TODO: implement initState
    print('initstate');
    print(s_date);
    print(e_date);
    Mymethod();
    super.initState();
  }

  void Mymethod() async {
    print('mymethodstart');
    print(name);
    print(type1);
    String? schd = await s1.GetPresSchedule(name, type1);
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
                  return PrescriptionsScreen.Cons1(cid, did, pid, navigatorKey);
                }));
              },
            ),
            SizedBox(
              width: 60,
            ),
            Text('Add Medicine')
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),

            /////////////////////////////////////////////////////////////////////////////////
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black),
              ),
              child: ListTile(
                leading: Text(
                  '$name',
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
                ),
                title: Text(
                  '$type1',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  '  $weight mg',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                //trailing: Icon(Icons.add),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black),
              ),
              child: TextButton(
                onPressed: () {},
                child: Container(
                  width: 450,
                  child: Text(
                    'Dosage: $dosage',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 23,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            ),

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black),
                    ),
                    child: TextButton(
                      onPressed: () {},
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
                      onPressed: () {},
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
            SizedBox(height: 10),
            Text(
              'Select Image From: ',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
            ///////////////////////////////////////////////////////////////////////////////////////
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
                    width: 140,
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
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Clear',
                      style: TextStyle(fontSize: 30),
                    )),
                SizedBox(
                  width: 95,
                ),
                ElevatedButton(
                    onPressed: () async {
                      print('add body1');
                      if (_image != null) {
                        var v = await _image!.readAsBytes();
                        String convertedpic = base64Encode(v);
                        Pill p = new Pill();
                        p.name = this.name;
                        p.type = this.type1;
                        p.start_date = this.s_date;
                        p.end_date = this.e_date;
                        p.image = convertedpic;
                        //print(convertedpic);
                        p.color = selectedColor.toString();
                        print('add body2');
                        p.no_dosage = dosage;
                        print('add body3');
                        p.cid = cid;
                        p.did = did;
                        p.pid = pid;
                        print('add body4');
                        dynamic response3 = await p.addpill();
                        print(response3);
                        print('add body8');
                        // response1 =int.parse(response3) ;

                        if (response3 != '"Exsist"' && response3 != null) {
                          print('add body9');
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
                              int.parse(response3));
                          print('add body10');
                          dynamic response2 = await sd.addmedschedule();
                          print(response2.toString());
                          if (response2 != "not found") if (response2 != null)
                            MyCustomAlertDialogBox5.showCustomAlertBox(
                              context: context,
                              willDisplayWidget: Container(
                                child: Text('$response2'),
                              ),
                              cid: cid,
                              did: did,
                              pid: pid,
                              navigatorKey: navigatorKey,
                            );
                        } else {
                          MyCustomAlertDialogBox5.showCustomAlertBox(
                            context: context,
                            willDisplayWidget: Container(
                              child: Text('Prescription already added'),
                            ),
                            cid: cid,
                            did: did,
                            pid: pid,
                            navigatorKey: navigatorKey,
                          );
                        }
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(''),
                              content:
                                  Text('Please pick image for this medicine'),
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
                      'Add',
                      style: TextStyle(fontSize: 30),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
