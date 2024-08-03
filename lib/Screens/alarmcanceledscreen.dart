
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter/src/foundation/key.dart';
import 'package:pill_reminder_system/Model/model1.dart';
import 'package:pill_reminder_system/utilities/Global/global.dart';
import 'package:pill_reminder_system/utilities/customwidgets/alarmcanceld_alert.dart';
import 'package:pill_reminder_system/utilities/customwidgets/custombutton.dart';

class CanceledAlertPage extends StatefulWidget {
  int patient_id,caretaker_id;
  Widget w1;
  CanceledAlertPage(this.patient_id,this.caretaker_id,this.w1);

  @override
  State<CanceledAlertPage> createState() => _CanceledAlertPageState(patient_id,caretaker_id,w1);
}

class _CanceledAlertPageState extends State<CanceledAlertPage> {
    
    int patient_id,caretaker_id;
    Widget w1;
    _CanceledAlertPageState(this.patient_id,this.caretaker_id,this.w1);

    User u = User(0,'',''); 
   void forChangeStatus2() async
    {
      print("change status2 body1");
      print('patient id is $patient_id');
      print('caretaker id is $caretaker_id');
    String? response = await u.ChangeStatus(caretaker_id, patient_id);
    if (response == null || response == "\"false\"" || response == "\"not found\"") {
                print('false body $response');
             }
    else {
      print('status2 changed');
    }
       
     } 
     
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: const Text(''))),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Container(
            width: 300,
            height: 300,
            child: Column(
              children: [
               
                SizedBox(height: 10,),
               Text('Alert ! Patient canceled alarm', style: TextStyle(fontSize: 21,
               color: Colors.red,
               ),),         
               
                 SizedBox(height: 40,),
                         
                CustomButton('    OK    ',()async{
                   
                          final snackBar = SnackBar(
                    content: Text('Thank you for responding'),
                   duration: Duration(seconds: 3),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                             Navigator.pushReplacement(context, 
                             MaterialPageRoute(builder: (context){
                             return w1;

                }));
                }),
                SizedBox(height: 30,),
                CustomButton('         Busy        ',()async{
                 forChangeStatus2();
                 if(priority_chk==3)
                        {
                    AlarmCanceled.showCustomAlertBox(
                    context: context,
                    willDisplayWidget: Container(
                    child: Text('Alert! all caretakers are busy'),
                    
            ),
                    w1: w1,
                  
          );
                        }
                 final snackBar = SnackBar(
                  content: Text('Ok. An other caretaker will be notified'),
                  duration: Duration(seconds: 3),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                             Navigator.pushReplacement(context, 
                             MaterialPageRoute(builder: (context){
                             return w1;

                }));

                }),
               

              ],

            ),
          ),
        ),
      ),

    );
    
  }
}