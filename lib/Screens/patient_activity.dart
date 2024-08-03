
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
// import 'package:pill_reminder_system/utilities/customwidgets/custombutton.dart';

class PatientActivityScreenPage extends StatefulWidget {
  const PatientActivityScreenPage({Key? key}) : super(key: key);

  @override
  State<PatientActivityScreenPage> createState() => _PatientActivityScreenPageState();
}

class _PatientActivityScreenPageState extends State<PatientActivityScreenPage> {


Map<int,dynamic> arrNames = { 1 : 'Taken',
                             2 : 'Snoozed',
                             3 : 'Skipped',
                             };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: const Text('Patient Activity'))),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
           
          ),
          Container(
            width: 400,
            height: 400,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child:  ListView.separated(itemBuilder: ((context, index) {
                           
                             return GestureDetector(
                              onTap: (){
                            
                              },
                               child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text((1).toString(), style: TextStyle(fontSize: 21,fontWeight: FontWeight.w500),),
                                  SizedBox(width: 30,),
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
            ElevatedButton(onPressed: (){}, child: Text('Back', style: TextStyle(fontSize:30 ),))
        ],
      ),

    );
    
  }
}