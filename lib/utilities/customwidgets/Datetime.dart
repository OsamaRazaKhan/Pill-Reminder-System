// import 'package:flutter/material.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

// class CustomPicker extends CommonPickerModel {
//   String digits(int value, int length) {
//     return '$value'.padLeft(length, "0");
//   }

//   CustomPicker({DateTime? currentTime, LocaleType? locale})
//       : super(locale: locale) {
//     this.currentTime = currentTime ?? DateTime.now();
//     this.setLeftIndex(this.currentTime.hour);
//     this.setMiddleIndex(this.currentTime.minute);
//     this.setRightIndex(this.currentTime.second);
//   }

//   @override
//   String? leftStringAtIndex(int index) {
//     if (index >= 0 && index < 24) {
//       return this.digits(index, 2);
//     } else {
//       return null;
//     }
//   }

//   @override
//   String? middleStringAtIndex(int index) {
//     if (index >= 0 && index < 60) {
//       return this.digits(index, 2);
//     } else {
//       return null;
//     }
//   }

//   @override
//   String? rightStringAtIndex(int index) {
//     if (index >= 0 && index < 60) {
//       return this.digits(index, 2);
//     } else {
//       return null;
//     }
//   }

//   @override
//   String leftDivider() {
//     return "|";
//   }

//   @override
//   String rightDivider() {
//     return "|";
//   }

//   @override
//   List<int> layoutProportions() {
//     return [1, 2, 1];
//   }

//   @override
//   DateTime finalTime() {
//     return currentTime.isUtc
//         ? DateTime.utc(
//             currentTime.year,
//             currentTime.month,
//             currentTime.day,
//             this.currentLeftIndex(),
//             this.currentMiddleIndex(),
//             this.currentRightIndex())
//         : DateTime(
//             currentTime.year,
//             currentTime.month,
//             currentTime.day,
//             this.currentLeftIndex(),
//             this.currentMiddleIndex(),
//             this.currentRightIndex());
//   }
// }

// class DateTimeClass extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       title: 'Flutter Demo',
//       theme: new ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: new HomePage(),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Datetime Picker'),
//       ),
//       body: Center(
//         child: Column(
//           children: <Widget>[
//             TextButton(
//                 onPressed: () {
//                   /*
//                   DatePicker.showDatePicker(context,
//                       showTitleActions: true,
//                       minTime: DateTime(2018, 3, 5),
//                       maxTime: DateTime(2025, 6, 7),
//                       theme: DatePickerTheme(
//                           headerColor: Colors.orange,
//                           backgroundColor: Colors.blue,
//                           itemStyle: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 18),
//                           doneStyle:
//                               TextStyle(color: Colors.white, fontSize: 16)),
//                       onChanged: (date) {
//                     print('change $date in time zone ' +
//                         date.timeZoneOffset.inHours.toString());
//                   }, onConfirm: (date) {
//                     print('confirm $date');
//                   }, currentTime: DateTime.now(), locale: LocaleType.en);   */
//                 },
//                 child: Text(
//                   'show date picker(custom theme &date time range)',
//                   style: TextStyle(color: Colors.blue),
//                 )),


//           ],
//         ),
//       ),
//     );
//   }
// }