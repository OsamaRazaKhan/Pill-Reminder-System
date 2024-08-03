
import 'package:flutter/material.dart';


class ReminderScreen2Page extends StatefulWidget {
  const ReminderScreen2Page({Key? key}) : super(key: key);

  @override
  State<ReminderScreen2Page> createState() => _ReminderScreen2PageState();
}

class _ReminderScreen2PageState extends State<ReminderScreen2Page> {


Map<int,dynamic> arrNames = { 1 : 'Eziday',
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
      appBar: AppBar(title: Center(child: const Text('Hello its time to take your medicines'))),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              
              children: [
                Text('8:00 AM',style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),),
              ],
            ),
            
          ),
          Container(
            width: 500,
            height: 450,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView.separated(itemBuilder: ((context, index) {
                return ListTile(
                  leading: Container( height: 80,width:80,child: Image.asset('assets/images/eziday.jpeg')),
                  title: Text(arrNames[index+1]!),
                  subtitle: Text('Take 2 pills'),
                
                   );
    }),
    itemCount: arrNames.length, 
    separatorBuilder: ((context, index) {
      return Divider(height: 100, thickness: 2);
    }),
    
    ),
              
            ),
          ),
            SizedBox(
               height: 40,
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 1),
             Container(child: Column(
              children: [
                Container(height: 50,width:50,child: Image.asset('assets/images/cancel.jpeg')),
                Text('Cancel'),             
              ],
             ),),
                Container(child: Column(
              children: [

                Container(height: 40,width:40,child: Image.asset('assets/images/taken.jpeg')),
                Text('Take'),             
              ],
             ),),
                Container(child: Column(
              children: [

                Container(height: 50,width:50,child: Image.asset('assets/images/snooze.jpeg')),
                Text('Snooze'),    
             
                        
              ],
             ),),

               SizedBox(width: 1),        
            ],
          ),
        ],
      ),

    );
    
  }
}