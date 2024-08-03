library custom_alert_dialog_box;

import 'package:flutter/material.dart';
// import 'package:pill_reminder_system/Model/prescription.dart';
// import 'package:pill_reminder_system/Screens/add_prescription.dart';
// import 'package:pill_reminder_system/Screens/firstscreen.dart';
// import 'package:pill_reminder_system/Screens/testscreen1.dart';
import 'package:pill_reminder_system/Screens/viewprescriptions.dart';

class MyCustomAlertDialogBox5 {
  /// Bu şekilde döküman yorumları oluşturabilirsiniz kullanan kişiler için faydalı olur.
  static Future showCustomAlertBox({
    required BuildContext context,
    required Widget willDisplayWidget,
    required int cid,
    required int did,
    required int pid,
    required final GlobalKey<NavigatorState> navigatorKey,
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
                  return PrescriptionsScreen.Cons1(cid, did, pid,navigatorKey);

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
