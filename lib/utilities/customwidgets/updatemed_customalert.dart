library custom_alert_dialog_box;

import 'package:flutter/material.dart';
// import 'package:pill_reminder_system/Screens/add_prescription.dart';
// import 'package:pill_reminder_system/Screens/deletemedicine.dart';
import 'package:pill_reminder_system/Screens/doctorscreen1.dart';
// import 'package:pill_reminder_system/Screens/firstscreen.dart';
// import 'package:pill_reminder_system/Screens/updatemedicine.dart';
// import 'package:pill_reminder_system/Screens/updatemedscreen1.dart';

class MyCustomAlertDialogBox3 {
  /// Bu şekilde döküman yorumları oluşturabilirsiniz kullanan kişiler için faydalı olur.
  static Future showCustomAlertBox({
    required final GlobalKey<NavigatorState> navigatorKey,
    required BuildContext context,
    required Widget willDisplayWidget,
    required String name,
    required String type,
    required int dosage,
    required String image,
    required int patient_id,
    required int doctor_id,
    required String pname,
    
  }) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.blue[400]!),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              willDisplayWidget,
              SizedBox(
                height: 15,
              ),
              MaterialButton(
                elevation: 0,
                color: Colors.white,
                child: Text(
                  'Ok',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pushReplacement(context, 
                  MaterialPageRoute(builder: (context){
                  return DoctorScreen1Page(doctor_id,patient_id,pname,navigatorKey);

                }));
                },
              )
            ],
          ),
          elevation: 0,
        );
      },
    );
  }
}
