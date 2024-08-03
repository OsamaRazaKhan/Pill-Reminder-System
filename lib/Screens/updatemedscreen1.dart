import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pill_reminder_system/Model/model1.dart';
import 'package:pill_reminder_system/Model/patient.dart';
// import 'package:pill_reminder_system/Screens/Login.dart';
import 'package:pill_reminder_system/Screens/addmedicine.dart';
import 'package:pill_reminder_system/Screens/doctorscreen1.dart';
// import 'package:pill_reminder_system/Screens/firstscreen.dart';
import 'package:pill_reminder_system/Screens/updatemedicine.dart';
// import 'package:pill_reminder_system/utilities/customwidgets/custombutton.dart';
import 'package:pill_reminder_system/utilities/customwidgets/custombutton2.dart';

import '../Model/Medicine.dart';
import '../utilities/customwidgets/updatemed_customalert.dart';

// ignore: must_be_immutable
class UpdateScreen1 extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  int patient_id, doctor_id;
  String pname;
  // const HomeScreenPage({Key? key}) : super(key: key);
  UpdateScreen1.Cons1(
      this.patient_id, this.doctor_id, this.pname, this.navigatorKey);
  @override
  State<UpdateScreen1> createState() =>
      _UpdateScreen1State.Cons1(patient_id, doctor_id, pname, navigatorKey);
}

class _UpdateScreen1State extends State<UpdateScreen1> {
  final GlobalKey<NavigatorState> navigatorKey;
  String test = "this is a test";
  late String name = '', type = '', image = '', s_date, e_date;
  String pname;
  late int dosage = 0;
  int patient_id, doctor_id;
  _UpdateScreen1State.Cons1(
      this.patient_id, this.doctor_id, this.pname, this.navigatorKey);
  Patient _user = Patient.Cons1();
  String arrNames = '';
  Map<String, dynamic> map = {};
  Map<String, dynamic> map2 = {};
  bool isempty = false;

  @override
  void initState() {
    // TODO: implement initState
    print('initstate');

    Mymethod();
    super.initState();
  }

  void Mymethod() async {
    print('mymethodstart');

    dynamic arrNames = await _user.GetMedicines(patient_id);
    print('hello.. $arrNames');
    if (arrNames == '[]') {
      isempty = true;
    }
    List<dynamic> jsonList = jsonDecode(arrNames!);
    jsonList.forEach((jsonObj) {
      name = jsonObj['name'];
      print(name);
      type = jsonObj['type'];
      print(type);
      dosage = jsonObj['no_dosage'];
      print(dosage);
      image = jsonObj['image'];
      image = jsonObj['image'];
      // print(image);
      map2[name] = '${image}';
      map[name] = '${type},${dosage}';
    });
    setState(() {});
    print('mymethodend');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              GestureDetector(
                child: Container(
                    height: 40,
                    width: 40,
                    child: Image.asset('assets/images/backward.jpeg')),
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return DoctorScreen1Page(
                        doctor_id, patient_id, pname, navigatorKey);
                  }));
                },
              ),
              SizedBox(
                width: 40,
              ),
              Text('Patient: $pname')
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            width: 500,
            height: 500,
            child: isempty == false
                ? Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: FutureBuilder(
                      future: User.getVehicles(),
                      builder: (BuildContext cont,
                          AsyncSnapshot<List<User>> snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          List<User> ulist = snapshot.data!;
                          if (ulist.length == 0) {
                            return Center(
                              child: Text('No Data Found'),
                            );
                          } else {
                            return ListView.separated(
                              itemBuilder: (context, index) {
                                String name = map.keys.elementAt(index);
                                // ignore: unused_local_variable
                                String name2 = map2.keys.elementAt(index);

                                String st = map[name];

                                String imageString = map2[name];
                                Uint8List imageBytes =
                                    base64Decode(imageString);
                                Widget imageWidget = Image.memory(imageBytes);

                                final splitted = st.split(',');
                                String type1 = splitted[0];
                                // print(name);print(type);
                                dosage = int.parse(splitted[1]);
                                print('$name is $type1');

                                return GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(builder: (context) {
                                        return DoctorScreen1Page(
                                            0, 0, '', navigatorKey);
                                      }));
                                    },
                                    child: Card(
                                      child: ListTile(
                                        leading: Container(
                                            height: 70,
                                            width: 70,
                                            child: imageWidget),
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
                                            Text('$type1'),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                CustomButton2(
                                                    'Update',
                                                    name,
                                                    type1,
                                                    dosage,
                                                    UpdateMedicinePage(
                                                        name,
                                                        type1,
                                                        dosage,
                                                        image,
                                                        patient_id,
                                                        doctor_id,
                                                        pname,
                                                        navigatorKey)),
                                                SizedBox(
                                                  width: 2,
                                                ),
                                                ElevatedButton(
                                                  onPressed: () async {
                                                    Pill p = Pill();
                                                    p.name = name;
                                                    p.type = type1;
                                                    print(
                                                        'type of $name is $type');
                                                    p.no_dosage = dosage;
                                                    p.start_date = '';
                                                    p.end_date = '';
                                                    p.image = '';
                                                    p.color = '';
                                                    p.pid = patient_id;
                                                    p.cid = 0;
                                                    p.did = doctor_id;
                                                    dynamic response =
                                                        await p.deletepill();
                                                    MyCustomAlertDialogBox3
                                                        .showCustomAlertBox(
                                                      context: context,
                                                      willDisplayWidget:
                                                          Container(
                                                        child:
                                                            Text('$response'),
                                                      ),
                                                      name: name,
                                                      type: type,
                                                      dosage: dosage,
                                                      image: image,
                                                      patient_id: patient_id,
                                                      doctor_id: doctor_id,
                                                      pname: pname,
                                                      navigatorKey:
                                                          navigatorKey,
                                                    );
                                                  },
                                                  child: Text(
                                                    "Delete",
                                                    style:
                                                        TextStyle(fontSize: 15),
                                                  ),
                                                  style: ButtonStyle(
                                                    //  backgroundColor: MaterialStateProperty.all(Colors.green),
                                                    overlayColor:
                                                        MaterialStateProperty
                                                            .all(Colors.red),
                                                    shadowColor:
                                                        MaterialStateProperty
                                                            .all(Colors.green),
                                                    // visualDensity: VisualDensity.adaptivePlatformDensity,
                                                    /* side: MaterialStateProperty.all(
      const BorderSide(
        color: Colors.red,
        width: 2,
      ),
    ),*/
                                                    // minimumSize: MaterialStateProperty.all(const Size(200, 40)),
                                                    //  maximumSize: MaterialStateProperty.all(const Size(64, 36)),
                                                    shape: MaterialStateProperty
                                                        .all(
                                                      RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                      ),
                                                    ),
                                                    elevation:
                                                        MaterialStateProperty
                                                            .all(17),
                                                  ),
                                                )
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
                  )
                : Center(
                    child: Text(
                      'No Medicine to Update',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
          ),
          SizedBox(
            height: 40,
          ),
          CustomButton2('Add New', name, type, dosage,
              AddMedicinePage(0, doctor_id, patient_id, pname, navigatorKey)),
        ],
      ),
    );
  }
}
