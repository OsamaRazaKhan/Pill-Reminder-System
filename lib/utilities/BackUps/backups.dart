/* yes/no_dialogbox_function
import 'package:smart_alert_dialog/models/alert_dialog_text.dart';
import 'package:smart_alert_dialog/smart_alert_dialog.dart';
void _yesNoSmartAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => SmartAlertDialog(
        title: "Are you liking it?",
        text: AlertDialogText(),
        message: "abc",
      //  onConfirmPressed: () => print("do something on confirm"),
        onCancelPressed: () => print("do something on cancel"),
      ),
    );
  }
  */
/*DateTime_formates
   TextButton(
                onPressed: () {
                  DatePicker.showTimePicker(context, showTitleActions: true,
                      onChanged: (date) {
                    print('change $date in time zone ' +
                        date.timeZoneOffset.inHours.toString());
                  }, onConfirm: (date) {
                    print('confirm $date');
                  }, currentTime: DateTime.now());
                },
                child: Text(
                  'show time picker',
                  style: TextStyle(color: Colors.blue),
                )),
                TextButton(
                onPressed: () {
                  DatePicker.showTime12hPicker(context, showTitleActions: true,
                      onChanged: (date) {
                    print('change $date in time zone ' +
                        date.timeZoneOffset.inHours.toString());
                  }, onConfirm: (date) {
                    print('confirm $date');
                  }, currentTime: DateTime.now());
                },
                child: Text(
                  'show 12H time picker with AM/PM',
                  style: TextStyle(color: Colors.blue),
                )),
                TextButton(
                onPressed: () {
                  DatePicker.showDateTimePicker(context, showTitleActions: true,
                      onChanged: (date) {
                    print('change $date in time zone ' +
                        date.timeZoneOffset.inHours.toString());
                  }, onConfirm: (date) {
                    print('confirm $date');
                  }, currentTime: DateTime(2008, 12, 31, 23, 12, 34));
                },
                child: Text(
                  'show date time picker (English-America)',
                  style: TextStyle(color: Colors.blue),
                )),
                TextButton(
                onPressed: () {
                  DatePicker.showDateTimePicker(context, showTitleActions: true,
                      onChanged: (date) {
                    print('change $date in time zone ' +
                        date.timeZoneOffset.inHours.toString());
                  }, onConfirm: (date) {
                    print('confirm $date');
                  },
                      currentTime: DateTime(2008, 12, 31, 23, 12, 34),
                      locale: LocaleType.nl);
                },
                child: Text(
                  'show date time picker (Dutch)',
                  style: TextStyle(color: Colors.blue),
                )),
                TextButton(
                onPressed: () {
                  DatePicker.showDateTimePicker(context, showTitleActions: true,
                      onChanged: (date) {
                    print('change $date in time zone ' +
                        date.timeZoneOffset.inHours.toString());
                  }, onConfirm: (date) {
                    print('confirm $date');
                  },
                      currentTime: DateTime(2008, 12, 31, 23, 12, 34),
                      locale: LocaleType.ru);
                },
                child: Text(
                  'show date time picker (Russian)',
                  style: TextStyle(color: Colors.blue),
                )),
                TextButton(
                onPressed: () {
                  DatePicker.showDateTimePicker(context, showTitleActions: true,
                      onChanged: (date) {
                    print('change $date in time zone ' +
                        date.timeZoneOffset.inHours.toString());
                  }, onConfirm: (date) {
                    print('confirm $date');
                  },
                      currentTime: DateTime.utc(2019, 12, 31, 23, 12, 34),
                      locale: LocaleType.de);
                },
                child: Text(
                  'show date time picker in UTC (German)',
                  style: TextStyle(color: Colors.blue),
                )),
                TextButton(
                onPressed: () {
                  DatePicker.showPicker(context, showTitleActions: true,
                      onChanged: (date) {
                    print('change $date in time zone ' +
                        date.timeZoneOffset.inHours.toString());
                  }, onConfirm: (date) {
                    print('confirm $date');
                  },
                      pickerModel: CustomPicker(currentTime: DateTime.now()),
                      locale: LocaleType.en);
                },
                child: Text(
                  'show custom time picker,\nyou can custom picker model like this',
                  style: TextStyle(color: Colors.blue),
                )), 
                */
   /* getting json string and try to converting to Map
                void Mymethod() async 
  {  
     _user.email = 'osman1123@gmail.com';
     _user.password = 'osman1123' ;

     String? st =await _user.GetPatients();
     st = st!.replaceAll("},{","|");
     print(st);
     List<String> list1 = st.split("|"); 
     
     list1.forEach((element1) {
     Patient p1 = Patient();
     element1 = element1.replaceAll("[{","");
     element1 = element1.replaceAll("}]","");
     List<String> list2= element1.split(",");
     int j=0;
     list2.forEach((element2) { 
     element2 = element2.replaceAll("\"","");
     List<String> list3= element2.split(":"); 
     print("Mymethod1");    
     list3.forEach((element3) { 
      print("Mymethod2");  
      int i=0;
      if(i==1)
      {    
        print("Mymethod3");      
        if(j==0)
        p1.id!= int.parse(element3);
        else if(j==1)
        p1.name= element3;             
      }
      i++;
      print(element3);
     });
      j++;
     //print(element2);
     });
     arrNames.addAll({
    p1.id : p1.name
  });
     });
  
    // print(splited);
  }*/
   /*
              ListView.separated(itemBuilder: ((context, index) {
                           
                             return GestureDetector(
                              onTap: (){
                            Navigator.pushReplacement(context, 
                            MaterialPageRoute(builder: (context){
                             return DoctorScreen1Page();
                               }));
                              },
                               child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                             //     Text((index+1).toString(), style: TextStyle(fontSize: 21,fontWeight: FontWeight.w500),),
                                  Text(map['id'], style: TextStyle(fontSize: 21,fontWeight: FontWeight.w500),),
                
                                ],
                               ),
                             );
                             //Text('Good Work', style: TextStyle(fontSize: 21,fontWeight: FontWeight.w500),);                 
                              
                              }),
                              itemCount: map.length,
                              separatorBuilder: ((context, index) {
                                String name = map[index]['name'];
                              return Divider(height: 50, thickness: 4,);
                             }),
            
                             );
                             */
                              /* ListView.builder(
                 itemCount: ulist.length,
                 itemBuilder: (cont,index){
                  User u = ulist[index];
                  return Card(
                    elevation: 15,
                    child: ListTile(
                      title: Text(u.fname,style: TextStyle(fontSize: 20),),
                      subtitle: Text(u.lname,style: TextStyle(fontSize: 20),),
                    )
                  );
                 }
              );*/
              /*Map<int,dynamic> arrNames = { 1 : 'Muhammed Osama',
                             2 : 'Ali Raza',
                             3 : 'Saad Rehman',
                             4 : 'Nazeer Khan',

                          };
                          */

  /**
   dispenserscreen2
   
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pill_reminder_system/Screens/testscreen1.dart';
import 'package:pill_reminder_system/utilities/customwidgets/custombutton.dart';

class DispenserScreen2Page extends StatefulWidget {
  const DispenserScreen2Page({Key? key}) : super(key: key);

  @override
  State<DispenserScreen2Page> createState() => _DispenserScreen2PageState();
}

class _DispenserScreen2PageState extends State<DispenserScreen2Page> {


Map<int,dynamic> arrNames = { 1 : 'Panadol',
                             2 : 'EziDay',
                             3 : 'Eplipsa',
                             4 : 'Caffeiene',
                             5 : 'Doxycyciline',
                             6 : 'Clobederm',
                             7 : 'Augmentin',
                             8 : 'Sol-Vit',
                             9 : 'Iberet Folic',
                             10 : 'WiWind'};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: const Text('Medicines'))),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              
              children: [
                Text('Med Image',style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),),
                Text('Med Name',style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),),
              ],
            ),
            
          ),
          Container(
            width: 500,
            height: 500,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child:  ListView.separated(itemBuilder: ((context, index) {
                           
                             return GestureDetector(
                              onTap: (){
                            
                              },
                               child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(Icons.image),
                                  Text(arrNames[index+1]!, style: TextStyle(fontSize: 21,fontWeight: FontWeight.w500),),
                                ],
                               ),
                             );
                             //Text('Good Work', style: TextStyle(fontSize: 21,fontWeight: FontWeight.w500),);                 
                              
                              }),
                              itemCount: arrNames.length,
                              separatorBuilder: ((context, index) {
                              return Divider(height: 50, thickness: 4);
                             }),
            
                             ),
              
            ),
          ),
            SizedBox(
               height: 40,
            ),
 CustomButton('            Back           ',()async{
                  Navigator.pushReplacement(context, 
                MaterialPageRoute(builder: (context){
                  return TestScreen();

                }));

                }),
        ],
      ),

    );
    
  }
}
    */         



    /**
     Old Dispenser:
      import 'package:flutter/material.dart';


class DispenserScreen extends StatefulWidget{
  @override
  State<DispenserScreen> createState() => _DispenserScreenState();
}

class _DispenserScreenState extends State<DispenserScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> { 

  @override
  Widget build(BuildContext context) { 
    return  DefaultTabController( 
      initialIndex: 1,  //optional, starts from 0, select the tab by default
      length:2,
      child:Scaffold(
          appBar: AppBar(
            title: Center(child: Text("Wellcome Muhammed")),
            backgroundColor: Colors.lightGreen,
            bottom: TabBar(
                      tabs: [
                          Tab(text: "Daily",),
                          Tab(text: "Weekly",)
                      ]
                    ),
          ),
          
          body: TabBarView(
              children: [
                  Container( //for first tab
                      height: 400,
                      color: Colors.white,
                      child:  Column(
                       children: [
                        SizedBox(height: 30),
                       Container(
                        width: 110,
                        height: 110,
                        color: Colors.lightGreen,
                        child: Center(child: Text("Morning", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))),
                       ),
                       SizedBox(height: 10),
                        Container(
                        width: 110,
                        height: 110,
                        color: Colors.greenAccent,
                        child: Center(child: Text("Noon", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))),
                       ),
                       SizedBox(height: 10),
                        Container(
                        width: 110,
                        height: 110,
                        color: Colors.lightGreenAccent,
                        child: Center(child: Text("Evening", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))),
                       ),
                       SizedBox(height: 10),
                        Container(
                        width: 110,
                        height: 110,
                        color: Colors.green,
                        child: Center(child: Text("Night", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))),
                       ),
                       ],
                      )
                     
                  ),
                  Container( 
                    //for second tab
                      height: 400,
                      color: Colors.white,
                       child: Column(

                         children: [
                          SizedBox(height: 70,),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Morning", style: TextStyle(fontWeight: FontWeight.bold),),
                               Text("Noon", style: TextStyle(fontWeight: FontWeight.bold),),
                                Text("Evening", style: TextStyle(fontWeight: FontWeight.bold),),
                                 Text("Night", style: TextStyle(fontWeight: FontWeight.bold),),
                            ],
                      ),
                       SizedBox(height: 30,),
                      Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                             Container(
                              height: 60,
                              width: 60,
                              color: Colors.lightGreen,
                              child: Center(child: Text("Mon", style: TextStyle(color: Colors.white),)),
                             ),
                              Container(
                              height: 60,
                              width: 60,
                              color: Colors.greenAccent,
                              child: Center(child: Text("Mon", style: TextStyle(color: Colors.white),)),

                             ),
                              Container(
                              height: 60,
                              width: 60,
                              color: Colors.lightGreenAccent,
                              child: Center(child: Text("Mon", style: TextStyle(color: Colors.white),)),

                             ),
                              Container(
                              height: 60,
                              width: 60,
                              color: Colors.green,
                            child: Center(child: Text("Mon", style: TextStyle(color: Colors.white),)),

                             ),
                            ],
                      ),

                        SizedBox(height: 10,),
                      Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                             Container(
                              height: 60,
                              width: 60,
                              color: Colors.lightGreen,
                              child: Center(child: Text("Tue", style: TextStyle(color: Colors.white),)),
                             ),
                              Container(
                              height: 60,
                              width: 60,
                              color: Colors.greenAccent,
                              child: Center(child: Text("Tue", style: TextStyle(color: Colors.white),)),

                             ),
                              Container(
                              height: 60,
                              width: 60,
                              color: Colors.lightGreenAccent,
                              child: Center(child: Text("Tue", style: TextStyle(color: Colors.white),)),

                             ),
                              Container(
                              height: 60,
                              width: 60,
                              color: Colors.green,
                            child: Center(child: Text("Tue", style: TextStyle(color: Colors.white),)),

                             ),
                            ],
                      ),

                        SizedBox(height: 10,),
                      Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                             Container(
                              height: 60,
                              width: 60,
                              color: Colors.lightGreen,
                              child: Center(child: Text("Wed", style: TextStyle(color: Colors.white),)),
                             ),
                              Container(
                              height: 60,
                              width: 60,
                              color: Colors.greenAccent,
                              child: Center(child: Text("Wed", style: TextStyle(color: Colors.white),)),

                             ),
                              Container(
                              height: 60,
                              width: 60,
                              color: Colors.lightGreenAccent,
                              child: Center(child: Text("Wed", style: TextStyle(color: Colors.white),)),

                             ),
                              Container(
                              height: 60,
                              width: 60,
                              color: Colors.green,
                            child: Center(child: Text("Wed", style: TextStyle(color: Colors.white),)),

                             ),
                            ],
                      ),

                        SizedBox(height: 10,),
                      Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                             Container(
                              height: 60,
                              width: 60,
                              color: Colors.lightGreen,
                              child: Center(child: Text("Thu", style: TextStyle(color: Colors.white),)),
                             ),
                              Container(
                              height: 60,
                              width: 60,
                              color: Colors.greenAccent,
                              child: Center(child: Text("Thu", style: TextStyle(color: Colors.white),)),

                             ),
                              Container(
                              height: 60,
                              width: 60,
                              color: Colors.lightGreenAccent,
                              child: Center(child: Text("Thu", style: TextStyle(color: Colors.white),)),

                             ),
                              Container(
                              height: 60,
                              width: 60,
                              color: Colors.green,
                            child: Center(child: Text("Thu", style: TextStyle(color: Colors.white),)),

                             ),
                            ],
                      ),

                        SizedBox(height: 10,),
                      Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                             Container(
                              height: 60,
                              width: 60,
                              color: Colors.lightGreen,
                              child: Center(child: Text("Fri", style: TextStyle(color: Colors.white),)),
                             ),
                              Container(
                              height: 60,
                              width: 60,
                              color: Colors.greenAccent,
                              child: Center(child: Text("Fri", style: TextStyle(color: Colors.white),)),

                             ),
                              Container(
                              height: 60,
                              width: 60,
                              color: Colors.lightGreenAccent,
                              child: Center(child: Text("Fri", style: TextStyle(color: Colors.white),)),

                             ),
                              Container(
                              height: 60,
                              width: 60,
                              color: Colors.green,
                            child: Center(child: Text("Fri", style: TextStyle(color: Colors.white),)),

                             ),
                            ],
                      ),

                        SizedBox(height: 10,),
                      Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                             Container(
                              height: 60,
                              width: 60,
                              color: Colors.lightGreen,
                              child: Center(child: Text("Sat", style: TextStyle(color: Colors.white),)),
                             ),
                              Container(
                              height: 60,
                              width: 60,
                              color: Colors.greenAccent,
                              child: Center(child: Text("Sat", style: TextStyle(color: Colors.white),)),

                             ),
                              Container(
                              height: 60,
                              width: 60,
                              color: Colors.lightGreenAccent,
                              child: Center(child: Text("Sat", style: TextStyle(color: Colors.white),)),

                             ),
                              Container(
                              height: 60,
                              width: 60,
                              color: Colors.green,
                            child: Center(child: Text("Sat", style: TextStyle(color: Colors.white),)),

                             ),
                            ],
                      ),

                        SizedBox(height: 10,),
                      Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                             Container(
                              height: 60,
                              width: 60,
                              color: Colors.lightGreen,
                              child: Center(child: Text("Sun", style: TextStyle(color: Colors.white),)),
                             ),
                              Container(
                              height: 60,
                              width: 60,
                              color: Colors.greenAccent,
                              child: Center(child: Text("Sun", style: TextStyle(color: Colors.white),)),

                             ),
                              Container(
                              height: 60,
                              width: 60,
                              color: Colors.lightGreenAccent,
                              child: Center(child: Text("Sun", style: TextStyle(color: Colors.white),)),

                             ),
                              Container(
                              height: 60,
                              width: 60,
                              color: Colors.green,
                            child: Center(child: Text("Sun", style: TextStyle(color: Colors.white),)),

                             ),
                            ],
                      ),
                     
                     
                         ],
                       ),
                  ),
                  
              ]
          )
       )
    );
  }
}
      */            

      /**Add Prescription page by CHATGPT
       import 'package:flutter/material.dart';

class AddPrescriptionPage2 extends StatefulWidget {
  @override
  _AddPrescriptionPage2State createState() => _AddPrescriptionPage2State();
}

class _AddPrescriptionPage2State extends State<AddPrescriptionPage2> {
  late TextEditingController _medicineController;
  late TextEditingController _doseController;
  late TextEditingController _startDateController;
  late TextEditingController _endDateController;
  bool _isReminderEnabled = false;

  @override
  void initState() {
    super.initState();
    _medicineController = TextEditingController();
    _doseController = TextEditingController();
    _startDateController = TextEditingController();
    _endDateController = TextEditingController();
  }

  @override
  void dispose() {
    _medicineController.dispose();
    _doseController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Prescription'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _medicineController,
                decoration: InputDecoration(labelText: 'Medicine'),
              ),
              SizedBox(height: 8.0),
              TextFormField(
                controller: _doseController,
                decoration: InputDecoration(labelText: 'Dose'),
              ),
              SizedBox(height: 8.0),
              TextFormField(
                controller: _startDateController,
                decoration: InputDecoration(labelText: 'Start Date'),
              ),
              SizedBox(height: 8.0),
              TextFormField(
                controller: _endDateController,
                decoration: InputDecoration(labelText: 'End Date'),
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Checkbox(
                    value: _isReminderEnabled,
                    onChanged: (value) {
                      setState(() {
                        _isReminderEnabled = value!;
                      });
                    },
                  ),
                  Text('Enable Reminder'),
                ],
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // TODO: Implement saving prescription details
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
 */   