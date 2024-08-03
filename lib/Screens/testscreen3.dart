/*
import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TestFireBase extends StatefulWidget {
  TestFireBase({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _TestFireBaseState createState() => _TestFireBaseState();
}

class _TestFireBaseState extends State<TestFireBase> {
  int counter = 0;
  
  Future<void> sendFCMMessage(String title, String body) async {
  final String serverKey = '<545457901565>'; // Replace with your Firebase server key
  final String url = 'https://fcm.googleapis.com/fcm/send';

  final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'key=$serverKey',
  };

  final bodyData = {
    'to': '/topics/all',
    'notification': {
      'title': title,
      'body': body,
    },
  };

  final response = await http.post(
    Uri.parse(url),
    headers: headers,
    body: json.encode(bodyData),
  );

  if (response.statusCode == 200) {
    print('Message sent successfully');
  } else {
    print('Failed to send message. Error: ${response.reasonPhrase}');
  }
}

  void _incrementCounter() {
    setState(() {
      counter++;
    });
    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  _firebaseMessaging.requestPermission();
  _firebaseMessaging.getToken().then((String? token) {
    assert(token != null);
    print("Push Messaging token: $token");
    // Send the token to your server here
  });

  _firebaseMessaging.subscribeToTopic('all');
  sendFCMMessage('Button Pressed', 'The button has been pressed $counter times');

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pressed the button this many times:',
            ),
            Text(
              '$counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
*/
