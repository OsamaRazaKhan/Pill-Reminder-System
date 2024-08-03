// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:pill_reminder_system/Screens/updatemedicine.dart';

// ignore: must_be_immutable
class CustomCheckButton extends UpdateMedicinePage {
  bool chk; 
  String txt;
  final GlobalKey<NavigatorState> navigatorKey;
  CustomCheckButton(this.chk,this.txt, this.navigatorKey) : super('', '',0,'',0,0,'',navigatorKey);
  

  Func1() {
   super.Func1();
  }
  @override
  State<CustomCheckButton> createState() => _CustomCheckButtonState(chk,txt);
}

class _CustomCheckButtonState extends State<CustomCheckButton> {
  bool chk;
  String txt;
  late CustomCheckButton ccb;
  _CustomCheckButtonState(this.chk,this.txt);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){                        
                       chk ==false?chk=true:chk=false;
                       ccb.Func1();
            }, 
            child: Text("$txt"),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(chk==false?Colors.grey:Colors.green),
              textStyle: MaterialStateProperty.all(TextStyle(fontSize: 20,decorationColor: Colors.black)),
              
            ),
            
            );
  }
}





