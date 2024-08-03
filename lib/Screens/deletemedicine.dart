
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
//import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pill_reminder_system/Model/Medicine.dart';
import 'package:pill_reminder_system/Model/model1.dart';
import 'package:pill_reminder_system/Model/patient.dart';
//import 'package:pill_reminder_system/Screens/Login.dart';
//import 'package:pill_reminder_system/Screens/addmedicine.dart';
import 'package:pill_reminder_system/Screens/doctorscreen1.dart';
//import 'package:pill_reminder_system/Screens/firstscreen.dart';
//import 'package:pill_reminder_system/Screens/updatemedicine.dart';
//import 'package:pill_reminder_system/Screens/updatemedscreen1.dart';
//import 'package:pill_reminder_system/utilities/customwidgets/custombutton.dart';
//import 'package:pill_reminder_system/utilities/customwidgets/custombutton2.dart';
import 'package:pill_reminder_system/utilities/customwidgets/updatemed_customalert.dart';

// ignore: must_be_immutable
class DeleteScreen1 extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  String pname;
  int patient_id,doctor_id;
 // const HomeScreenPage({Key? key}) : super(key: key); 
  DeleteScreen1.Cons1(this.patient_id,this.doctor_id,this.pname,this.navigatorKey);
  @override
  State<DeleteScreen1> createState() => _DeleteScreen1State.Cons1(patient_id,doctor_id,pname,navigatorKey);
}

class _DeleteScreen1State extends State<DeleteScreen1> {
  final GlobalKey<NavigatorState> navigatorKey;
    String test = "this is a test";
    late String name,type,image,pname;
    late int dosage;
    int patient_id,doctor_id;
    _DeleteScreen1State.Cons1(this.patient_id,this.doctor_id,this.pname,this.navigatorKey);
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
    String? arrNames =await _user.GetMedicines(patient_id);   
   // print('hello.. $arrNames');
    List<dynamic> jsonList = jsonDecode(arrNames!);     
    jsonList.forEach((jsonObj) {
    name = jsonObj['name'];
    print(name);
    type = jsonObj['type'] ;
    print(type);
     dosage = jsonObj['no_dosage'];
    print(dosage);
     image = jsonObj['image'];
   //  print(image);

    map2[name] = '${image}'; 
    map[name] = '${type},${dosage}';
   
  });
    setState(() {
       
    });
    print('mymethodend');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: 
      Row(
              children: [
                 GestureDetector(
                  child: Container(height: 40,width:40,child: Image.asset('assets/images/backward.jpeg')),
                  onTap: (){
                     Navigator.pushReplacement(context, 
                MaterialPageRoute(builder: (context){
                  return DoctorScreen1Page(doctor_id,patient_id,pname,navigatorKey);

                }));
                  },
                  ),
                  SizedBox(width: 60,),
                Text('Patient: $pname')
              ],
            ),),
      body: Column(
        children: [
         
            SizedBox(height: 30,),
          
          Container(
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
      print('dosage is $dosage');
      if(type=='syrup')
         print('$dosage , $type');
      return GestureDetector(
        onTap: () {
                            Navigator.pushReplacement(context, 
                            MaterialPageRoute(builder: (context){
                             return DoctorScreen1Page(patient_id,0,pname,navigatorKey);
                               }));
        },
        child: Card(
          child: ListTile(
          leading: Container(
            height: 70,
            width: 70,
            child: imageWidget),
          title: Text('$name', style: TextStyle(fontSize: 21,fontWeight: FontWeight.w500),),
          subtitle: Column(
           // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [          
              Text('$type'),
              SizedBox(height: 10,),
              Row(
                children: [
                  ElevatedButton(onPressed: ()async{
                    Pill p = Pill();
                    p.name = name;
                    p.type= type;
                    p.no_dosage= dosage;
                    p.image ='';
                    p.color ='';
                    p.pid = patient_id;
                    p.cid = 0;
                    p.did = doctor_id;
                    dynamic response =await p.deletepill();
                    MyCustomAlertDialogBox3.showCustomAlertBox(
                    context: context,
                    willDisplayWidget: Container(
                    child: Text('$response'),
            ),
                    name: name,
                    type: type,
                    dosage: dosage,
                    image: image,
                    patient_id: patient_id,
                    doctor_id: doctor_id,
                    pname: pname,
                    navigatorKey: navigatorKey,
          ); 
                 
                  }, child: Text("Delete"))           
                ],
              ),
            ],
          ),
       //   trailing: Icon(Icons.add),
              ),
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
          
        ],
      ),

    );
    
  }
}