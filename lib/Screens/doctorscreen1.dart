import 'package:flutter/material.dart';
import 'package:pill_reminder_system/Screens/add_prescription.dart';
import 'package:pill_reminder_system/Screens/dispenserscreen1.dart';
// import 'package:pill_reminder_system/Screens/deletemedicine.dart';
import 'package:pill_reminder_system/Screens/homescreen.dart';
// import 'package:pill_reminder_system/Screens/testscreen1.dart';
// import 'package:pill_reminder_system/Screens/updatemedicine.dart';
import 'package:pill_reminder_system/Screens/updatemedscreen1.dart';
import 'package:pill_reminder_system/utilities/Global/global2.dart';
import 'package:pill_reminder_system/utilities/customwidgets/custombutton.dart';

// ignore: must_be_immutable
class DoctorScreen1Page extends StatefulWidget {
  // const DoctorScreen1Page({Key? key}) : super(key: key);
  final GlobalKey<NavigatorState> navigatorKey;
  int doctor_id, patient_id;
  String pname;
  DoctorScreen1Page(
      this.doctor_id, this.patient_id, this.pname, this.navigatorKey);
  @override
  State<DoctorScreen1Page> createState() =>
      _DoctorScreen1PageState(doctor_id, patient_id, pname, navigatorKey);
}

class _DoctorScreen1PageState extends State<DoctorScreen1Page> {
  int doctor_id, patient_id;
  String pname;
  final GlobalKey<NavigatorState> navigatorKey;
  _DoctorScreen1PageState(
      this.doctor_id, this.patient_id, this.pname, this.navigatorKey);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green,
          title: Center(child: const Text('Doctor Home Page'))),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Container(
            width: 300,
            height: 400,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                CustomButton('Prescribe Medicine', () async {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return AddPrescriptionPage(
                        doctor_id, patient_id, pname, navigatorKey);
                  }));
                }),
                SizedBox(
                  height: 10,
                ),
                CustomButton('  Update Medicine  ', () async {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return UpdateScreen1.Cons1(
                        patient_id, doctor_id, pname, navigatorKey);
                  }));
                }),
                SizedBox(
                  height: 10,
                ),
                /*  CustomButton('  Delete Medicine  ',()async{
                  Navigator.pushReplacement(context, 
                MaterialPageRoute(builder: (context){
                  return DeleteScreen1.Cons1(patient_id,doctor_id,pname);
                }));
                  
                }),*/
                SizedBox(
                  height: 10,
                ),
                CustomButton('       Dispenser        ', () async {
                  is_patient = false;
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return DispenserPage1(
                        DoctorScreen1Page(
                            doctor_id, patient_id, pname, navigatorKey),
                        patient_id,
                        navigatorKey);
                  }));
                }),
                SizedBox(
                  height: 30,
                ),
                CustomButton('             Back            ', () async {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return HomeScreenPage.Cons1(
                        doctor_id, 'Doctor', navigatorKey);
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
