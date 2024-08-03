// ignore: unused_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// ignore: unused_import
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
// ignore: unused_import
//import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:pill_reminder_system/Model/Schedule.dart';
import 'package:pill_reminder_system/Model/prescription.dart';
import 'package:pill_reminder_system/Screens/doctorscreen1.dart';
import 'package:pill_reminder_system/utilities/customwidgets/addpres_customalert.dart';
import 'package:pill_reminder_system/utilities/customwidgets/custombutton.dart';
import 'package:pill_reminder_system/utilities/customwidgets/customdropdownPill.dart';
import 'package:pill_reminder_system/utilities/customwidgets/customtextform.dart';

// ignore: must_be_immutable
class AddPrescriptionPage extends StatefulWidget {
  //const AddPrescriptionPage({Key? key}) : super(key: key);
  final GlobalKey<NavigatorState> navigatorKey;
  int doctor_id, patient_id;
  String pname;
  AddPrescriptionPage(
      this.doctor_id, this.patient_id, this.pname, this.navigatorKey);
  @override
  State<AddPrescriptionPage> createState() =>
      _AddPrescriptionPageState(doctor_id, patient_id, pname, navigatorKey);
}

class _AddPrescriptionPageState extends State<AddPrescriptionPage> {
  final GlobalKey<NavigatorState> navigatorKey;
  int doctor_id, patient_id;
  String pname;
  bool chk1 = false,
      chk2 = false,
      chk3 = false,
      chk4 = false,
      chk5 = false,
      chk6 = false,
      chk7 = false;
  bool chk8 = false, chk9 = false, chk10 = false, chk11 = false;
  _AddPrescriptionPageState(
      this.doctor_id, this.patient_id, this.pname, this.navigatorKey);
  DropDownExampleState de = DropDownExampleState();
  String? selectedvalue;
  String? s_date = 'Start Date', e_date = 'End Date';
  dynamic response;
  TextEditingController namecont = new TextEditingController();
  TextEditingController dosagecont = new TextEditingController();
  TextEditingController weightcont = new TextEditingController();
  // TextEditingController datecont=new TextEditingController();

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
          title: Center(child: Text('Patient: $pname'))),
      body: LayoutBuilder(
          builder: (BuildContext context1, BoxConstraints constraints1) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                CustomTextForm(
                  'Medicine Name',
                  'Medicine Name',
                  null,
                  false,
                  namecont,
                ),
                SizedBox(
                  height: constraints1.maxHeight * 0.02,
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
                //////////////////////////////////////////////////////////////////////////////////////////////////////////

                SizedBox(
                  height: constraints1.maxHeight * 0.02,
                ),
                CustomTextForm(
                  'Strength',
                  'Strength',
                  null,
                  false,
                  weightcont,
                ),
                SizedBox(
                  height: constraints1.maxHeight * 0.02,
                ),
                CustomTextForm(
                  'Dosage',
                  'Dosage',
                  null,
                  false,
                  dosagecont,
                ),
                SizedBox(
                  height: constraints1.maxHeight * 0.02,
                ),
                /////////////////////////////////////////////////////////////////////////////////////////////////
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
                              transitionBuilder:
                                  (context, anim1, anim2, child) {
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
                              transitionBuilder:
                                  (context, anim1, anim2, child) {
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
                SizedBox(
                  height: constraints1.maxHeight * 0.04,
                ),
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
                  height: 8,
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
                SizedBox(
                  height: constraints1.maxHeight * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton('ADD', () async {
                      if (s_date != 'Start Date' && e_date != 'End Date') {
                        Prescription p = Prescription();
                        print(patient_id);
                        print(doctor_id);
                        p.med_name = namecont.text;
                        p.no_dosage = int.parse(dosagecont.text);
                        p.weight = int.parse(weightcont.text);
                        p.start_date = s_date!;
                        p.end_date = e_date!;
                        p.med_type = selectedvalue!;
                        p.patient_id = patient_id;
                        p.doctor_id = doctor_id;

                        print('good work1');
                        response = await p.addprescription();
                        print(response.toString());

                        if (response == null) {
                          MyCustomAlertDialogBox2.showCustomAlertBox(
                            context: context,
                            willDisplayWidget: Container(
                              child: Text('Error'),
                            ),
                            did: doctor_id,
                            pid: patient_id,
                            pname: pname,
                            navigatorKey: navigatorKey,
                          );
                        } else if (response == '"already prescribed"') {
                          MyCustomAlertDialogBox2.showCustomAlertBox(
                            context: context,
                            willDisplayWidget: Container(
                              child: Text('Already Prescribed'),
                            ),
                            did: doctor_id,
                            pid: patient_id,
                            pname: pname,
                            navigatorKey: navigatorKey,
                          );
                        } else if (response == '"already exist"') {
                          MyCustomAlertDialogBox2.showCustomAlertBox(
                            context: context,
                            willDisplayWidget: Container(
                              child: Text('Already Exist'),
                            ),
                            did: doctor_id,
                            pid: patient_id,
                            pname: pname,
                            navigatorKey: navigatorKey,
                          );
                        } else {
                          print('else body');
                          response = int.parse(response!);

                          Schedule sd = Schedule(chk1, chk2, chk3, chk4, chk5,
                              chk6, chk7, chk8, chk9, chk10, chk11, response);
                          dynamic response2 = await sd.addpresschedule();
                          print(response2.toString());
                          if (response2 != "Exsist") if (response2 != null)
                            MyCustomAlertDialogBox2.showCustomAlertBox(
                              context: context,
                              willDisplayWidget: Container(
                                child: Text('Prescription Added'),
                              ),
                              did: doctor_id,
                              pid: patient_id,
                              pname: pname,
                              navigatorKey: navigatorKey,
                            );
                        }
                        response = response.toString();
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Dear User"),
                              content: Text("Please select Start and End Date"),
                              actions: <Widget>[],
                            );
                          },
                        );
                      }
                    }),
                    CustomButton('Back', () async {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return DoctorScreen1Page(
                            doctor_id, patient_id, pname, navigatorKey);
                      }));
                    }),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
