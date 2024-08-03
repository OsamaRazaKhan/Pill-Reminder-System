library custom_alert_dialog_box;

import 'package:flutter/material.dart';
// import 'package:pill_reminder_system/Screens/add_prescription.dart';
// import 'package:pill_reminder_system/Screens/firstscreen.dart';
// import 'package:pill_reminder_system/Screens/updatemedicine.dart';

class AlarmCanceled {
  /// Bu şekilde döküman yorumları oluşturabilirsiniz kullanan kişiler için faydalı olur.
  static Future showCustomAlertBox({
    required BuildContext context,
    required Widget willDisplayWidget,
    required w1,
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
                  return w1;

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
