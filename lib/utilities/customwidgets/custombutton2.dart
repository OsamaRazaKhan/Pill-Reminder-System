import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
// import 'package:pill_reminder_system/Screens/updatemedicine.dart';

// ignore: must_be_immutable
class CustomButton2 extends StatelessWidget {
  String text;
  String name;
  String type;
  int dosage;
  Widget w1;
  CustomButton2(this.text,this.name,this.type,this.dosage,this.w1);

  

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){
                  Navigator.pushReplacement(context, 
                  MaterialPageRoute(builder: (context){
                  return w1;

                }));
      }, 
      child: Text(text,style: TextStyle(fontSize: 15),),
      style: ButtonStyle(
  //  backgroundColor: MaterialStateProperty.all(Colors.green),
    overlayColor: MaterialStateProperty.all(Colors.red),
    shadowColor: MaterialStateProperty.all(Colors.green),
  // visualDensity: VisualDensity.adaptivePlatformDensity,
   /* side: MaterialStateProperty.all(
      const BorderSide(
        color: Colors.red,
        width: 2,
      ),
    ),*/
   // minimumSize: MaterialStateProperty.all(const Size(200, 40)),
  //  maximumSize: MaterialStateProperty.all(const Size(64, 36)),
  shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
     elevation: MaterialStateProperty.all(17),

  ),
      );
    
  }
}




