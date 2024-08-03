
import 'package:flutter/material.dart';
import 'package:smart_alert_dialog/models/alert_dialog_text.dart';
import 'package:smart_alert_dialog/smart_alert_dialog.dart';


class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  void _yesNoSmartAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => SmartAlertDialog(
        title: "Are you liking it?",
        text: AlertDialogText(),
        message:
            "Do you think my library is awesome and want have a try?\n\nNote: Fell free to open PR to improve it :)",
        onConfirmPressed: () => print("do something on confirm"),
        onCancelPressed: () => print("do something on cancel"),
      ),
    );
  }

  void _okSmartAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => SmartAlertDialog(
        title: "This is an dismissable alert!",
        text: AlertDialogText(),
        message:
            "Hey, you can only dismiss this alert dialog. And also, don't tap again in that button. You have been alerted!",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              MaterialButton(
                child: Text(
                  "Send a Dismissable Alert",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                onPressed: () => _okSmartAlert(context),
                color: Colors.blue,
              ),
              MaterialButton(
                child: Text(
                  "Send a Accept/Cancel Alert",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                onPressed: () => _yesNoSmartAlert(context),
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}