
// import 'dart:convert';
import 'package:flutter/material.dart';

class DropDownExample extends StatefulWidget {
  const DropDownExample({Key? key}) : super(key: key);

  @override
  State<DropDownExample> createState() => DropDownExampleState();
}

class DropDownExampleState extends State<DropDownExample> {
  String ? selectedvalue;
  List<String> countries=['  Injection', '  Tablet', '  Drops','  Spray','  Capsule','  Syrup'];
  List<DropdownMenuItem<String>> getMenuItems()
  {
    List<DropdownMenuItem<String>> menulist=[];
    countries.forEach((element) {
      DropdownMenuItem<String> item =DropdownMenuItem<String>(
        child: Text(element,style: TextStyle(fontSize: 25,),),
        value: element,
      );
      menulist.add(item);
    });
    return menulist;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Drop Down Example')),
      body: Column(
        children: [
          DropdownButton(
            isExpanded: true,
          value: selectedvalue,
            items: getMenuItems(),
          onChanged: (value){
            setState(() {
            selectedvalue=value.toString();
            // selectedvalue="America";
        
            
            });

          }),
          Text(selectedvalue==null?"":selectedvalue!,
               style:TextStyle(fontSize: 20),)

        ],
      ),

    );
    
  }
}