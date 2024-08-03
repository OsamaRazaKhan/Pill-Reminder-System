import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:pill_reminder_system/Model/model1.dart';
import 'package:pill_reminder_system/Model/patient.dart';
// import 'package:pill_reminder_system/Screens/Login.dart';
// import 'package:pill_reminder_system/Screens/addmedicine.dart';
import 'package:pill_reminder_system/Screens/addtonewmed.dart';
import 'package:pill_reminder_system/Screens/caretakerscreen1.dart';
import 'package:pill_reminder_system/Screens/doctorscreen1.dart';
// import 'package:pill_reminder_system/Screens/firstscreen.dart';
// import 'package:pill_reminder_system/Screens/testscreen2.dart';
// import 'package:pill_reminder_system/Screens/updatemedicine.dart';
// import 'package:pill_reminder_system/utilities/customwidgets/custombutton.dart';
import 'package:pill_reminder_system/utilities/customwidgets/custombutton2.dart';

// ignore: must_be_immutable
class PrescriptionsScreen extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  int did, pid, cid;
  // const HomeScreenPage({Key? key}) : super(key: key);
  PrescriptionsScreen.Cons1(this.cid, this.did, this.pid, this.navigatorKey);
  @override
  State<PrescriptionsScreen> createState() =>
      _PrescriptionsScreenState.Cons1(cid, did, pid, navigatorKey);
}

class _PrescriptionsScreenState extends State<PrescriptionsScreen> {
  final GlobalKey<NavigatorState> navigatorKey;
  String test = "this is a test";
  late String name, type;
  late int dosage, weight;
  int cid, did, pid;
  String? s_date, e_date;
  _PrescriptionsScreenState.Cons1(
      this.cid, this.did, this.pid, this.navigatorKey);
  Patient _user = Patient.Cons1();
  String arrNames = '';
  Map<String, dynamic> map = {};

  @override
  void initState() {
    // TODO: implement initState
    print('initstate');
    // Mymethod();
    super.initState();
  }

  Future<List<dynamic>> Mymethod() async {
    print('mymethodstart');

    String? arrNames = await _user.GetPrescriptions(pid);
    print('hello.. $arrNames');
    List<dynamic> jsonList = jsonDecode(arrNames!);
    jsonList.forEach((jsonObj) {
      name = jsonObj['med_name'];
      print(name);
      type = jsonObj['med_type'];
      print(type);
      print(jsonObj['no_dosage']);
      dosage = jsonObj['no_dosage'];
      print(dosage);
      weight = jsonObj['Weight'];
      print(weight);
      s_date = jsonObj['start_date'];
      print(s_date);
      e_date = jsonObj['end_date'];
      print(e_date);

      map[name] = '${type},${dosage},${s_date},${e_date}';
    });
    //setState(() {

    // });
    print('mymethodend');
    return jsonList;
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
                  return CareTakerScreen1Page(cid, pid, did, navigatorKey);
                }));
              },
            ),
            SizedBox(
              width: 60,
            ),
            Text("Doctor's Prescriptions")
          ],
        ),
      ),
      body: LayoutBuilder(
          builder: (BuildContext context1, BoxConstraints constraints1) {
        return Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              width: constraints1.maxWidth,
              height: constraints1.maxHeight * 0.9,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: FutureBuilder(
                  future: Mymethod(),
                  builder: (BuildContext cont,
                      AsyncSnapshot<List<dynamic>> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      List<dynamic> ulist = snapshot.data!;
                      if (ulist.length == 0) {
                        return Container(
                          height: 400,
                          width: 400,
                          child: Center(
                            child: Text(
                              'No New Prescriptions',
                              style: TextStyle(
                                fontSize: 21,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        );
                      } else {
                        return ListView.separated(
                          itemBuilder: (context, index) {
                            String name = map.keys.elementAt(index);
                            String st = map[name];
                            final splitted = st.split(',');
                            type = splitted[0];
                            dosage = int.parse(splitted[1]);
                            s_date = splitted[2];
                            e_date = splitted[3];
                            print('dosage is $dosage');
                            if (type == 'syrup') print('$dosage , $type');
                            return GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return DoctorScreen1Page(
                                        did, 0, '', navigatorKey);
                                  }));
                                },
                                child: Card(
                                  child: ListTile(
                                    leading: Container(
                                        height: 70,
                                        width: 70,
                                        child: Image.asset(type == '  Tablet'
                                            ? 'assets/images/tablet.jpeg'
                                            : type == '  Capsule'
                                                ? 'assets/images/capsule.jpeg'
                                                : type == '  Syrup'
                                                    ? 'assets/images/syrup.jpeg'
                                                    : type == '  Injection'
                                                        ? 'assets/images/injection.jpeg'
                                                        : 'assets/images/drops.jpeg')),
                                    title: Text(
                                      '$name',
                                      style: TextStyle(
                                          fontSize: 21,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    subtitle: Column(
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('$type'),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomButton2(
                                                'Add to Dispenser',
                                                name,
                                                type,
                                                dosage,
                                                AddToNewMedScreen(
                                                    name,
                                                    type,
                                                    dosage,
                                                    weight,
                                                    cid,
                                                    did,
                                                    pid,
                                                    s_date!,
                                                    e_date!,
                                                    navigatorKey)),
                                            //         CustomButton2('Remove',name,type,dosage,UpdateMedicinePage(name,type,dosage,'',1,1,'')),
                                            SizedBox(
                                              width: 2,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    //   trailing: Icon(Icons.add),
                                  ),
                                ));
                          },
                          separatorBuilder: (context, index) => Divider(
                            height: 30,
                            thickness: 0,
                          ),
                          itemCount: map.length,
                        );
                      }
                    }
                  },
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
