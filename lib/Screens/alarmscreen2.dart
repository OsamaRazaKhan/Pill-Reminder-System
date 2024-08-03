
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pill_reminder_system/Model/Patientalarm.dart';
// import 'package:pill_reminder_system/Model/Medicine.dart';
import 'package:pill_reminder_system/Model/model1.dart';
import 'package:pill_reminder_system/Model/patient.dart';
import 'package:pill_reminder_system/Screens/dispenserscreen1.dart';
import 'package:pill_reminder_system/Screens/doctorscreen1.dart';
import 'package:pill_reminder_system/Utilities/Global/global.dart';
import 'package:pill_reminder_system/utilities/Global/global2.dart';
// import 'package:pill_reminder_system/utilities/customwidgets/custombutton2.dart';
// import 'package:pill_reminder_system/utilities/customwidgets/updatemed_customalert.dart';

// ignore: must_be_immutable
class AlarmScreen2 extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  Widget w1;
  int patient_id;
  String day,time;
 // const HomeScreenPage({Key? key}) : super(key: key); 
  AlarmScreen2.Cons1(this.patient_id,this.w1,this.day,this.time,this.navigatorKey);
  @override
  State<AlarmScreen2> createState() => _AlarmScreen2State.Cons1(patient_id,w1,day,time,navigatorKey);
}


class _AlarmScreen2State extends State<AlarmScreen2> {
  final GlobalKey<NavigatorState> navigatorKey;
    String day,time;
    Widget w1;
    String test = "this is a test";
    late String name,type,image,color;
    late int dosage;
    int patient_id;
    _AlarmScreen2State.Cons1(this.patient_id,this.w1,this.day,this.time,this.navigatorKey);
    Patient _user = Patient.Cons1();
    String arrNames = '';
    Map<String, dynamic> map = {};
    Map<String, dynamic> map2 = {}; 
    User u = User(0,'','');    
    // void forChangeStatus() async
    // {
    //   print("change status body1");
    //   print('patient id is $patient_id');
    //   print('caretaker id is $caret_id');
    // String? response = await u.ChangeStatus(caret_id, patient_id);
    // if (response == null || response == "\"false\"" || response == "\"not found\"") {
    //             print('false body $response');
    //          }
    // else {
    //   print('status changed');
    // }
       
    //  }                 
  @override
  void initState()  {
    // TODO: implement initState
    print('initstate');
    Mymethod();
    super.initState();
    
  }
  void forChangeState() async
    {
      print("change state body1");
      print('patient id is $patient_id');
      print('caretaker id is $caret_id');
    String? response = await u.ChangeState2( patient_id, "busy");
    if (response == null || response == "\"false\"" || response == "\"not found\"") {
                print('false body $response');
             }
    else {
      print('state changed');
    }
       
     }
void Mymethod() async 
  {  
    print('mymethodstart');
    print(patient_id);
    print(day);
    print(time);
    String? arrNames =await _user.GetDispenser2(patient_id,day,time);   
    print('hello.. $arrNames');
    List<dynamic> jsonList = jsonDecode(arrNames!);     
    jsonList.forEach((jsonObj) {
    name = jsonObj['name'];
    print(name);
    type = jsonObj['type'];
    print(type);
     dosage = jsonObj['no_dosage'];
    print(dosage);
     color = jsonObj['color'];
    print(color);
     image = jsonObj['image'];
   // print(image);
    map2[name] = '${image}';
    map[name] = '${type},${dosage},${color}';
   
  });
    setState(() {
       
    });
    print('mymethodend');
  }
    Future<void> cancelAlarm() async {
  // Cancel the scheduled alarm
  await fnplugin.cancel(0);

  // Clear the scheduled time from shared preferences
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // await prefs.remove('scheduledTime');
  print('Alarm canceled');
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: day=="Sunday" && time == "morn"?Text('Medicines for Sunday Morning'):
      day=="Sunday" && time == "noon"?Text('Medicines for Sunday Noon'):
      day=="Sunday" && time == "even"?Text('Medicines for Sunday Evening'):
      day=="Sunday" && time == "night"?Text('Medicines for Sunday Night'):
      day=="Monday" && time == "morn"?Text('Medicines for Monday Morning'):
      day=="Monday" && time == "noon"?Text('Medicines for Monday Noon'):
      day=="Monday" && time == "even"?Text('Medicines for Monday Evening'):
      day=="Monday" && time == "night"?Text('Medicines for Monday Night'):
      day=="Tuesday" && time == "morn"?Text('Medicines for Tuesday Morning'):
      day=="Tuesday" && time == "noon"?Text('Medicines for Tuesday Noon'):
      day=="Tuesday" && time == "even"?Text('Medicines for Tuesday Evening'):
      day=="Tuesday" && time == "night"?Text('Medicines for Tuesday Night'):
      day=="Wednesday" && time == "morn"?Text('Medicines for Wednesday Morning'):
      day=="Wednesday" && time == "noon"?Text('Medicines for Wednesday Noon'):
      day=="Wednesday" && time == "even"?Text('Medicines for Wednesday Evening'):
      day=="Wednesday" && time == "night"?Text('Medicines for Wednesday Night'):
      day=="Thursday" && time == "morn"?Text('Medicines for Thrusday Morning'):
      day=="Thursday" && time == "noon"?Text('Medicines for Thrusday Noon'):
      day=="Thursday" && time == "even"?Text('Medicines for Thrusday Evening'):
      day=="Thursday" && time == "night"?Text('Medicines for Thrusday Night'):
      day=="Friday" && time == "morn"?Text('Medicines for Friday Morning'):
      day=="Friday" && time == "noon"?Text('Medicines for Friday Noon'):
      day=="Friday" && time == "even"?Text('Medicines for Friday Evening'):
      day=="Friday" && time == "night"?Text('Medicines for Friday Night'):
      day=="Saturday" && time == "morn"?Text('Medicines for Saturday Morning'):
      day=="Saturday" && time == "noon"?Text('Medicines for Saturday Noon'):
      day=="Saturday" && time == "even"?Text('Medicines for Saturday Evening'):
      Text('Medicines for Saturday Night')),
      backgroundColor: Colors.green,
      
      ),
      body: Column(
        children: [
          ////////////////////////////////////////////////////////////////
        
            SizedBox(height: 60,),
          
          Container(
            width: 400,
            height: 400,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: FutureBuilder(
        future : User.getVehicles(),
        builder: (BuildContext cont,AsyncSnapshot<List<User>> snapshot){
          if(!snapshot.hasData){
             return Center(child: CircularProgressIndicator(),);
          }
          else{
            List<User> ulist = snapshot.data!;
            if(ulist.length==0){
              return Center(child: Text('No Data Found'),);
                       }
            else {
              return ListView.separated(
    itemBuilder: (context, index) {
      String name = map.keys.elementAt(index);
      // ignore: unused_local_variable
      String name2 = map2.keys.elementAt(index);

      String st = map[name];

      String imageString = map2[name];
      Uint8List imageBytes = base64Decode(imageString);
      Widget imageWidget = Image.memory(imageBytes);
      
      final splitted  = st.split(',');
      type = splitted[0];
      dosage = int.parse(splitted[1]);
      
      color = splitted[2];
      final splitted2 = color.split('(');
      final splitted3 = splitted2[1].split(')');
      int color_code = int.parse(splitted3[0]);

      print('dosage is $dosage');
      if(type=='syrup')
         print('$dosage , $type');
      return GestureDetector(
        onTap: () {
                            Navigator.pushReplacement(context, 
                            MaterialPageRoute(builder: (context){
                             return DoctorScreen1Page(patient_id,0,'',navigatorKey);
                               }));
        },
        child: Card(
          child: Container(
            child: Row(
              children: [
                Column(
                  children: [
                     Container(
                height: 70,
                width: 70,
                child: imageWidget),
                SizedBox(height: 10,),
              Container(
                height: 70,
                width: 70,
                color: Color(color_code),
                ),  
                  ],
                ),
                SizedBox(width: 30,),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('$name', style: TextStyle(fontSize: 21,fontWeight: FontWeight.w500),),
                      Text(type=='tablet'?'$dosage $type':type=='syrup'?'$dosage $type':type=='drops'?'$dosage $type':'$dosage $type'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          /*ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 50.0),
          leading: Column(
            children: [
              Container(
                height: 50,
                width: 50,
                child: imageWidget),
                SizedBox(height: 10,),
              Container(
                height: 50,
                width: 50,
                color: Color(color_code),
                ),  
            ],
          ),
          title: Text('$name', style: TextStyle(fontSize: 21,fontWeight: FontWeight.w500),),
          subtitle: Column(
           // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [      
                  
              Text(type=='tablet'?'$dosage tab':type=='syrup'?'$dosage spoon':type=='drops'?'$dosage drop':'$dosage ml'),
             
           
            ],
          ),
      //    trailing: Icon(Icons.add),
              ),*/
        )
       
      );
    },
    separatorBuilder: (context, index) => Divider(height: 30, thickness: 0,),
    itemCount: map.length,
  );
             
            }
          }
        },
      ),
            
              
            ),
          ),
          // CustomButton('            OK           ',()async{
                  
                //   Navigator.pushReplacement(context, 
                // MaterialPageRoute(builder: (context){
                //   return w1;

                // }));

          //       }),
          SizedBox(height: 40,),
               Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 1),
          //    GestureDetector(
          //     onTap: (){
          //           forChangeStatus();
          //           is_snooze = false;
          //           if(priority_chk==3)
          //               {
          //                 AlarmCanceled.showCustomAlertBox(
          //           context: context,
          //           willDisplayWidget: Container(
          //           child: Text('Alert! Alarm is Canceled from All CareTakers'),
                    
          //   ),
          //           w1: w1,
                  
          // );
          //               }
          //           final snackBar = SnackBar(
          //           content: Text('Alarm Canceled'),
          //          duration: Duration(seconds: 3),
          //           );
          //           ScaffoldMessenger.of(context).showSnackBar(snackBar);
          //                    Navigator.pushReplacement(context, 
          //                    MaterialPageRoute(builder: (context){
          //                    return w1;

          //       }));
          //     },
          //      child: Container(child: Column(
          //       children: [
          //         Container(height: 50,width:50,child: Image.asset('assets/images/cancel.jpeg')),
          //         Text('Cancel'),             
          //       ],
          //      ),),
          //    ),
                GestureDetector(
                  onTap: ()async{
                    is_snooze = false;
                    Patient p = new Patient();
                    String? reseponse=await p.TakePill(patient_id, day, time); 
                    if (reseponse == null) {
                final snackBar = SnackBar(
                    content: Text('not taken'),
                   duration: Duration(seconds: 2),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
             }
             else {   
                   final snackBar = SnackBar(
                    content: Text('Medicine Taken'),
                   duration: Duration(seconds: 3),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Navigator.pushReplacement(context, 
                MaterialPageRoute(builder: (context){
                  return DispenserPage1(w1, patient_id, navigatorKey);

                }));
                  }
                  },
                  child: Container(child: Column(
                              children: [
                
                  Container(height: 40,width:40,child: Image.asset('assets/images/taken.jpeg')),
                  Text('Take'),             
                              ],
                             ),),
                ),
                GestureDetector(
                  onTap: ()async{
                      if(snooze_count<3)
                      {
                        print(snooze_count);
                      snooze_count++;
                      is_snooze = true;
                      Alarm2 alarm = Alarm2(navigatorKey,patient_id,w1);
                      await alarm.scheduleAlarm();  
                      final snackBar = SnackBar(
                    content: Text('Snoozed for 10 min'),
                   duration: Duration(seconds: 3),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Navigator.pushReplacement(context, 
                MaterialPageRoute(builder: (context){
                  return DispenserPage1(w1, patient_id, navigatorKey);

                }));
                      }
                      else{

                        snooze_count=0;
                        forChangeState();
                        is_snooze = false;
                    final snackBar = SnackBar(
                    content: Text('Snooze limit exceed, alarm canceled'),
                   duration: Duration(seconds: 3),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      
                      
                             Navigator.pushReplacement(context, 
                             MaterialPageRoute(builder: (context){
                             return w1;

                }));
                        }
                        
                  },
                  child: Container(child: Column(
                              children: [
                
                  Container(height: 50,width:50,child: Image.asset('assets/images/snooze.jpeg')),
                  Text('Snooze'),    
                             
                          
                              ],
                             ),),
                ),

               SizedBox(width: 1),        
            ],
          ), 
        ],
      ),

    );
    
  }
}