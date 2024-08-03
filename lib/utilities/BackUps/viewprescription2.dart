
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pill_reminder_system/utilities/customwidgets/custombutton.dart';

class ViewPrescription2Page extends StatefulWidget {
  const ViewPrescription2Page({Key? key}) : super(key: key);

  @override
  State<ViewPrescription2Page> createState() => _ViewPrescription2PageState();
}

class _ViewPrescription2PageState extends State<ViewPrescription2Page> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: const Text(''))),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Container(
            width: 400,
            height: 400,
            child: Column(
              children: [
               
                SizedBox(height: 10,),
                CustomButton('     Add to new Medicine     ',()async{
                 

                }),         
                SizedBox(height: 10,),
                CustomButton('Remove from Prescription',()async{
                 

                }),
               
                 SizedBox(height: 10,),
                         
               
                SizedBox(height: 10,),
                CustomButton('                   Back                   ',()async{
                 

                }),
               

              ],

            ),
          ),
        ),
      ),

    );
    
  }
}