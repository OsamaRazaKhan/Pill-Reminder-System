
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
// import 'package:pill_reminder_system/Model/Medicine.dart';
import 'package:pill_reminder_system/Model/model1.dart';
import 'package:pill_reminder_system/Model/patient.dart';
import 'package:pill_reminder_system/Screens/doctorscreen1.dart';
import 'package:pill_reminder_system/utilities/Global/global2.dart';
// import 'package:pill_reminder_system/Screens/firstscreen.dart';
// import 'package:pill_reminder_system/Screens/testscreen1.dart';
// import 'package:pill_reminder_system/Screens/updatemedicine.dart';
import 'package:pill_reminder_system/utilities/customwidgets/custombutton.dart';
// import 'package:pill_reminder_system/utilities/customwidgets/custombutton2.dart';
// import 'package:pill_reminder_system/utilities/customwidgets/updatemed_customalert.dart';

// ignore: must_be_immutable
class DispenserPage2 extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  Widget w1;
  int patient_id;
  String day,time;
  bool med_chk;
 // const HomeScreenPage({Key? key}) : super(key: key); 
  DispenserPage2.Cons1(this.patient_id,this.w1,this.day,this.time,this.navigatorKey,this.med_chk);
  @override
  State<DispenserPage2> createState() => _DispenserPage2State.Cons1(patient_id,w1,day,time,navigatorKey,med_chk);
}


class _DispenserPage2State extends State<DispenserPage2> {
  final GlobalKey<NavigatorState> navigatorKey;
    String day,time;
    bool med_chk;
    Widget w1;
    String test = "this is a test";
    late String name,type,image,color;
    late int dosage;
    int patient_id;
    _DispenserPage2State.Cons1(this.patient_id,this.w1,this.day,this.time,this.navigatorKey,this.med_chk);
    Patient _user = Patient.Cons1();
    String arrNames = '';
    Map<String, dynamic> map = {};
    Map<String, dynamic> map2 = {};     
                     
  @override
  
  void initState()  {
    // TODO: implement initState
    print('initstate');
    Mymethod();
    super.initState();
    
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: 
      day=="sun" && time == "morn"?Text('Medicines for Sunday Morning'):
      day=="sun" && time == "noon"?Text('Medicines for Sunday Noon'):
      day=="sun" && time == "even"?Text('Medicines for Sunday Evening'):
      day=="sun" && time == "night"?Text('Medicines for Sunday Night'):
      day=="mon" && time == "morn"?Text('Medicines for Monday Morning'):
      day=="mon" && time == "noon"?Text('Medicines for Monday Noon'):
      day=="mon" && time == "even"?Text('Medicines for Monday Evening'):
      day=="mon" && time == "night"?Text('Medicines for Monday Night'):
      day=="tue" && time == "morn"?Text('Medicines for Tuesday Morning'):
      day=="tue" && time == "noon"?Text('Medicines for Tuesday Noon'):
      day=="tue" && time == "even"?Text('Medicines for Tuesday Evening'):
      day=="tue" && time == "night"?Text('Medicines for Tuesday Night'):
      day=="wed" && time == "morn"?Text('Medicines for Wednesday Morning'):
      day=="wed" && time == "noon"?Text('Medicines for Wednesday Noon'):
      day=="wed" && time == "even"?Text('Medicines for Wednesday Evening'):
      day=="wed" && time == "night"?Text('Medicines for Wednesday Night'):
      day=="thr" && time == "morn"?Text('Medicines for Thrusday Morning'):
      day=="thr" && time == "noon"?Text('Medicines for Thrusday Noon'):
      day=="thr" && time == "even"?Text('Medicines for Thrusday Evening'):
      day=="thr" && time == "night"?Text('Medicines for Thrusday Night'):
      day=="fri" && time == "morn"?Text('Medicines for Friday Morning'):
      day=="fri" && time == "noon"?Text('Medicines for Friday Noon'):
      day=="fri" && time == "even"?Text('Medicines for Friday Evening'):
      day=="fri" && time == "night"?Text('Medicines for Friday Night'):
      day=="sat" && time == "morn"?Text('Medicines for Saturday Morning'):
      day=="sat" && time == "noon"?Text('Medicines for Saturday Noon'):
      day=="sat" && time == "even"?Text('Medicines for Saturday Evening'):
      Text('Medicines for Saturday Night')
      ),
      backgroundColor: Colors.green,
      
      ),
      body: Column(
        children: [
          ////////////////////////////////////////////////////////////////
        
            SizedBox(height: 30,),
          
          med_chk==true?Container(
            width: 500,
            height: 500,
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
                      Text(type=='  Tablet'?'$dosage tablet':type=='  Injection'?'$dosage injection':type=='  Syrup'?'$dosage spoon':type=='  Drops'?'$dosage drop':type=='  Spray'?'$dosage spray':type=='  Capsule'?'$dosage capsule':'$dosage $type'),
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
          ):Column(
            children: [
              Center(
                child: Container(
                  height: 400,
                  width: 400,
                  child: Center(
                    child: Text('No Medicine here', style: TextStyle(fontSize: 21,
                       color: Colors.blue,
                       ),),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
      
          med_chk==true&&is_patient==true?CustomButton('            Take           ',()async{
                  
               Patient p = new Patient();
               String? reseponse=await p.TakePill(patient_id, day, time); 
               if (reseponse == null) {
                final snackBar = SnackBar(
                    content: Text('something went wrong'),
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
                  return w1;

                }));
                  }
                }):Container(),
          CustomButton('            Back           ',()async{
                  
                  Navigator.pushReplacement(context, 
                MaterialPageRoute(builder: (context){
                  return w1;

                }));

                }),
        ],
      ),

    );
    
  }
}