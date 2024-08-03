 import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pill_reminder_system/Model/patient.dart';
import 'package:pill_reminder_system/Screens/dispenserscreen2.dart';

// ignore: must_be_immutable
class DispenserPage1 extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  Widget w1;
  int patient_id;
  DispenserPage1(this.w1,this.patient_id,this.navigatorKey);
  @override
  State<DispenserPage1> createState() => _DispenserPage1State(w1,patient_id,navigatorKey);
}


class _DispenserPage1State extends State<DispenserPage1> {
  final GlobalKey<NavigatorState> navigatorKey;
  String? dayName;
  int patient_id;
  Widget w1;
  _DispenserPage1State(this.w1,this.patient_id,this.navigatorKey);
  bool sun_morn = false, sun_noon = false, sun_even = false, sun_night = false;
  bool mon_morn = false, mon_noon = false, mon_even = false, mon_night = false;
  bool tue_morn = false, tue_noon = false, tue_even = false, tue_night = false;
  bool wed_morn = false, wed_noon = false, wed_even = false, wed_night = false;
  bool thr_morn = false, thr_noon = false, thr_even = false, thr_night = false;
  bool fri_morn = false, fri_noon = false, fri_even = false, fri_night = false;
  bool sat_morn = false, sat_noon = false, sat_even = false, sat_night = false;
  
  bool morn = false, noon = false, even = false, night = false;
  Patient _user = Patient.Cons1();

   void initState()  {
    // TODO: implement initState
    print('initstate');
    var now = DateTime.now();
    var formatter = DateFormat('EEEE');
    dayName = formatter.format(now);
    print(dayName);
    Mymethod();
    super.initState();
    
  }
  
  void Mymethod() async 
  {  
    print('mymethodstart');
     
    String? dispenser =await _user.GetDispenser1(patient_id);   
    print('hello.. $dispenser');
    dynamic jsonObj = jsonDecode(dispenser!);   

    if(jsonObj['sun_morn']>0)
    sun_morn = true; 
    if(jsonObj['sun_noon']>0)
    sun_noon = true; 
    if(jsonObj['sun_even']>0)
    sun_even = true; 
    if(jsonObj['sun_night']>0)
    sun_night = true; 
    if(jsonObj['mon_morn']>0)
    mon_morn = true; 
    if(jsonObj['mon_noon']>0)
    mon_noon = true; 
    if(jsonObj['mon_even']>0)
    mon_even = true; 
    if(jsonObj['mon_night']>0)
    mon_night = true; 
    if(jsonObj['tue_morn']>0)
    tue_morn = true; 
    if(jsonObj['tue_noon']>0)
    tue_noon = true; 
    if(jsonObj['tue_even']>0)
    tue_even = true; 
    if(jsonObj['tue_night']>0)
    tue_night = true; 
    if(jsonObj['wed_morn']>0)
    wed_morn = true; 
    if(jsonObj['wed_noon']>0)
    wed_noon = true; 
    if(jsonObj['wed_even']>0)
    wed_even = true; 
    if(jsonObj['wed_night']>0)
    wed_night = true; 
    if(jsonObj['thr_morn']>0)
    thr_morn = true; 
    if(jsonObj['thr_noon']>0)
    thr_noon = true; 
    if(jsonObj['thr_even']>0)
    thr_even = true; 
    if(jsonObj['thr_night']>0)
    thr_night = true; 
    if(jsonObj['fri_morn']>0)
    fri_morn = true; 
    if(jsonObj['fri_noon']>0)
    fri_noon = true; 
    if(jsonObj['fri_even']>0)
    fri_even = true; 
    if(jsonObj['fri_night']>0)
    fri_night = true; 
    if(jsonObj['sat_morn']>0)
    sat_morn = true; 
    if(jsonObj['sat_noon']>0)
    sat_noon = true; 
    if(jsonObj['sat_even']>0)
    sat_even = true; 
    if(jsonObj['sat_night']>0)
    sat_night = true; 
    
    if(dayName=="Sunday")
    {
      morn = sun_morn;
      noon = sun_noon;
      even= sun_even;
      night = sun_night;
    }
    else if(dayName=="Monday")
    {
      morn = mon_morn;
      noon = mon_noon;
      even= mon_even;
      night = mon_night;
    }
    else if(dayName=="Tuesday")
    {
      morn = tue_morn;
      noon = tue_noon;
      even= tue_even;
      night = tue_night;
    }
    else if(dayName=="Wednesday")
    {
      morn = wed_morn;
      noon = wed_noon;
      even= wed_even;
      night = wed_night;
    }
    else if(dayName=="Thursday")
    {
      morn = thr_morn;
      noon = thr_noon;
      even= thr_even;
      night = thr_night;
    }
    else if(dayName=="Friday")
    {
      morn = fri_morn;
      noon = fri_noon;
      even=  fri_even;
      night = fri_night;
    }
    else if(dayName=="Saturday")
    {
      morn = sat_morn;
      noon = sat_noon;
      even= sat_even;
      night = sat_night;
    }
    setState(() {
       
    });
    print('mymethodend');
  }
 Widget ebox =  Container(
                      height: 100,width:100, 
                      decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/images/emptybox.jpg'),
                      fit: BoxFit.fill),
                      ),
                    );
 
   Widget fbox =  Container(
                    height: 100,width:100, 
                    decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/pillsbox.jpeg'),
                    fit: BoxFit.fill),
                    ),
                  );
  @override
  Widget build(BuildContext context) { 
    return  DefaultTabController( 
      initialIndex: 1,  //optional, starts from 0, select the tab by default
      length:2,
      child:Scaffold(
          appBar: AppBar(
            title:   Row(
              children: [
                 GestureDetector(
                  child: Container(height: 40,width:40,child: Image.asset('assets/images/backward.jpeg')),
                  onTap: (){
                     Navigator.pushReplacement(context, 
                MaterialPageRoute(builder: (context){
                  return w1;

                }));
                  },
                  ),
                  SizedBox(width: 50,),
                Text('    Dispenser')
              ],
            ),
            backgroundColor: Colors.green,
            bottom: TabBar(
                      tabs: [
                          Tab(text: "Daily",),
                          Tab(text: "Weekly",)
                      ]
                    ),
          ),
          
          body: TabBarView(
              children: [
                  Container(
                   child: Center(child: LayoutBuilder(builder: (BuildContext context1, BoxConstraints constraints1){
                    return Container(
                      width: constraints1.maxWidth * 0.9,
                      height: constraints1.maxHeight * 0.9,
        
                     decoration: BoxDecoration(
                     color: Colors.greenAccent,
                     borderRadius: BorderRadius.circular(71),

            ),
                 child: Column(
                  children: [
                    SizedBox(height: 20,),
                    GestureDetector(
                      onTap: (){
                         Navigator.pushReplacement(context, 
                  MaterialPageRoute(builder: (context){
                    return DispenserPage2.Cons1(patient_id,DispenserPage1(w1,patient_id,navigatorKey),dayName!,"morn",navigatorKey,dayName=="Sunday"?sun_morn:dayName=="Monday"?mon_morn:dayName=="Tuesday"?tue_morn:dayName=="Wednesday"?wed_morn:dayName=="Thursday"?thr_morn:dayName=="Friday"?fri_morn:sat_morn);
        
                  }));
                      },
                      child: Container(
                      height: constraints1.maxHeight * 0.2,
                      width:  constraints1.maxWidth * 0.5, 
                      color: morn==true?Colors.red:Color(0xffeaebe7),
                                    /*    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/images/emptybox.jpg'),
                      fit: BoxFit.fill),
                      ),*/
                      child: Center(child: Text("MORN", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
                                      ),
                    ),
                  SizedBox(height: 10,),
                  GestureDetector(
                    onTap: (){
                         Navigator.pushReplacement(context, 
                  MaterialPageRoute(builder: (context){
                    return DispenserPage2.Cons1(patient_id,DispenserPage1(w1,patient_id,navigatorKey),dayName!,"noon",navigatorKey,dayName=="Sunday"?sun_noon:dayName=="Monday"?mon_noon:dayName=="Tuesday"?tue_noon:dayName=="Wednesday"?wed_noon:dayName=="Thursday"?thr_noon:dayName=="Friday"?fri_morn:sat_noon);
        
                  }));
                      },
                    child: Container(
                      height: constraints1.maxHeight * 0.2,
                      width:  constraints1.maxWidth * 0.5,  
                      color: noon==true?Colors.green:Color(0xffeaebe7),
                                  /*    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/images/emptybox.jpg'),
                      fit: BoxFit.fill),
                      ),*/
                      child: Center(child: Text("NOON", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),)),
                    ),
                  ),
                  SizedBox(height: 10,),
                  GestureDetector(
                    onTap: (){
                         Navigator.pushReplacement(context, 
                  MaterialPageRoute(builder: (context){
                    return DispenserPage2.Cons1(patient_id,DispenserPage1(w1,patient_id,navigatorKey),dayName!,"even",navigatorKey,dayName=="Sunday"?sun_even:dayName=="Monday"?mon_even:dayName=="Tuesday"?tue_even:dayName=="Wednesday"?wed_even:dayName=="Thursday"?thr_even:dayName=="Friday"?fri_morn:sat_even);
        
                  }));
                      },
                    child: Container(
                     height: constraints1.maxHeight * 0.2,
                      width:  constraints1.maxWidth * 0.5, 
                      color: even==true?Colors.orange:Color(0xffeaebe7),
                                  /*    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/images/emptybox.jpg'),
                      fit: BoxFit.fill),
                      ),*/
                      child: Center(child: Text("EVE", style: TextStyle(color: Colors.black),)),
                    ),
                  ),
                  SizedBox(height: 10,),
                  GestureDetector(
                    onTap: (){
                         Navigator.pushReplacement(context, 
                  MaterialPageRoute(builder: (context){
                    return DispenserPage2.Cons1(patient_id,DispenserPage1(w1,patient_id,navigatorKey),dayName!,"night",navigatorKey,dayName=="Sunday"?sun_night:dayName=="Monday"?mon_night:dayName=="Tuesday"?tue_night:dayName=="Wednesday"?wed_night:dayName=="Thursday"?thr_night:dayName=="Friday"?fri_night:sat_night);
        
                  }));
                      },
                    child: Container(
                      height: constraints1.maxHeight * 0.2,
                      width:  constraints1.maxWidth * 0.5,
                      color: night==true?Colors.blue:Color(0xffeaebe7),
                                  /*    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/images/emptybox.jpg'),
                      fit: BoxFit.fill),
                      ),*/
                      child: Center(child: Text("NIGHT", style: TextStyle(color: Colors.black),)),
                    ),
                  ),
                  ],
                 ),
                    );
                   },)),
                  ),
                 Container(
     
      child: Center(
        child: LayoutBuilder(
          builder: (BuildContext context1, BoxConstraints constraints1){
            return Container(
            width: constraints1.maxWidth * 0.9,
            height: constraints1.maxHeight * 0.9,
        
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(71),
        
            ),
            child: Column(
              children: [
               // SizedBox(height: 30,),
                Container(

                  width: constraints1.maxWidth * 0.7,
                   height: constraints1.maxHeight * 0.07,
                 
                ),
                SizedBox(height: 1,),
               Row(
                children: [
                  SizedBox(width: 15,),
                  Container(
                        height: constraints1.maxHeight * 0.7,
                        decoration: BoxDecoration(
                //   color: Colors.blue,                 
                  // borderRadius: BorderRadius.circular(31),
        
            ),
                    child: Column(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         crossAxisAlignment: CrossAxisAlignment.end,
                         children: [
                       Container(child: Center(child: Text('Sun',style: TextStyle(fontWeight: FontWeight.bold),))),
                        Container(child: Center(child: Text('Mon',style: TextStyle(fontWeight: FontWeight.bold),))),
                        Container(child: Center(child: Text('Tue',style: TextStyle(fontWeight: FontWeight.bold),))),
                        Container(child: Center(child: Text('Wed',style: TextStyle(fontWeight: FontWeight.bold),))),
                        Container(child: Center(child: Text('Thr',style: TextStyle(fontWeight: FontWeight.bold),))),
                        Container(child: Center(child: Text('Fri',style: TextStyle(fontWeight: FontWeight.bold),))),
                        Container(child: Center(child: Text('Sat',style: TextStyle(fontWeight: FontWeight.bold),))),


                         ],
                    ),
                  ),
                  SizedBox(width: 5,),
                  Container(
                   width: constraints1.maxWidth * 0.7,
                   height: constraints1.maxHeight * 0.75,
                decoration: BoxDecoration(
              color: Colors.black45,
              borderRadius: BorderRadius.circular(31),
        
            ),
            child: Column(
              children: [
                SizedBox(height: constraints1.maxHeight * 0.05,),
                ///////////////////////////////////////////////////////////////////////////////////////////
                Row(
                  children: [
                    SizedBox(width: constraints1.maxWidth * 0.04),
                    GestureDetector(onTap: (){
                  Navigator.pushReplacement(context, 
                  MaterialPageRoute(builder: (context){
                    return DispenserPage2.Cons1(patient_id,DispenserPage1(w1,patient_id,navigatorKey),"sun","morn",navigatorKey,sun_morn);
        
                  }));
                    },child: Container(
                    height: constraints1.maxHeight * 0.08,
                    width:  constraints1.maxWidth * 0.15, 
                    color: sun_morn==true?Colors.red:Color(0xffeaebe7),
                /*    decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/emptybox.jpg'),
                    fit: BoxFit.fill),
                    ),*/
                    child: Center(child: Text("MORN", style: TextStyle(color: Colors.black),)),
                  ),
                  ),
                  SizedBox(width: 3,),
                    GestureDetector(onTap: (() {
                       Navigator.pushReplacement(context, 
                  MaterialPageRoute(builder: (context){
                    return DispenserPage2.Cons1(patient_id,DispenserPage1(w1,patient_id,navigatorKey),"sun","noon",navigatorKey,sun_noon);
        
                  }));
                    }), child: Container(
                    height: constraints1.maxHeight * 0.08,
                    width:  constraints1.maxWidth * 0.15, 
                    color: sun_noon==true?Colors.green:Color(0xffeaebe7),
                /*    decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/emptybox.jpg'),
                    fit: BoxFit.fill),
                    ),*/
                    child: Center(child: Text("NOON", style: TextStyle(color: Colors.black),)),
                  ),
                    ),
                    SizedBox(width: 3,),
                    GestureDetector(onTap: (() {
                       Navigator.pushReplacement(context, 
                  MaterialPageRoute(builder: (context){
                    return DispenserPage2.Cons1(patient_id,DispenserPage1(w1,patient_id,navigatorKey),"sun","even",navigatorKey,sun_even);
        
                  }));
                    }), child: Container(
                    height: constraints1.maxHeight * 0.08,
                    width:  constraints1.maxWidth * 0.15, 
                    color: sun_even==true?Colors.orange:Color(0xffeaebe7),
                /*    decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/emptybox.jpg'),
                    fit: BoxFit.fill),
                    ),*/
                    child: Center(child: Text("EVE", style: TextStyle(color: Colors.black),)),
                  ),
                  ),
                  SizedBox(width: 3,),
                    GestureDetector(onTap: (() {
                       Navigator.pushReplacement(context, 
                  MaterialPageRoute(builder: (context){
                    return DispenserPage2.Cons1(patient_id,DispenserPage1(w1,patient_id,navigatorKey),"sun","night",navigatorKey,sun_night);
        
                  }));
                    }), child: Container(
                    height: constraints1.maxHeight * 0.08,
                    width:  constraints1.maxWidth * 0.15, 
                    color: sun_night==true?Colors.blue:Color(0xffeaebe7),
                /*    decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/emptybox.jpg'),
                    fit: BoxFit.fill),
                    ),*/
                    child: Center(child: Text("NIGHT", style: TextStyle(color: Colors.black),)),
                  ),),
                  
                  
                   
                  ],
                ),
                /////////////////////////////////////////////////////////////////////////////////////////
                 SizedBox(height: 7,),
                Row(
                  children: [
                    SizedBox(width: constraints1.maxWidth * 0.04),
                    GestureDetector(onTap: (){
                  Navigator.pushReplacement(context, 
                  MaterialPageRoute(builder: (context){
                    return DispenserPage2.Cons1(patient_id,DispenserPage1(w1,patient_id,navigatorKey),"mon","morn",navigatorKey,mon_morn);
        
                  }));
                    },child: Container(
                    height: constraints1.maxHeight * 0.08,
                    width:  constraints1.maxWidth * 0.15, 
                    color: mon_morn==true?Colors.red:Color(0xffeaebe7),
                /*    decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/emptybox.jpg'),
                    fit: BoxFit.fill),
                    ),*/
                    child: Center(child: Text("MORN", style: TextStyle(color: Colors.black),)),
                  ),
                  ),
                  SizedBox(width: 3,),
                    GestureDetector(onTap: (() {
                       Navigator.pushReplacement(context, 
                  MaterialPageRoute(builder: (context){
                    return DispenserPage2.Cons1(patient_id,DispenserPage1(w1,patient_id,navigatorKey),"mon","noon",navigatorKey,mon_noon);
        
                  }));
                    }), child: Container(
                    height: constraints1.maxHeight * 0.08,
                    width:  constraints1.maxWidth * 0.15, 
                    color: mon_noon==true?Colors.green:Color(0xffeaebe7),
                /*    decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/emptybox.jpg'),
                    fit: BoxFit.fill),
                    ),*/
                    child: Center(child: Text("NOON", style: TextStyle(color: Colors.black),)),
                  ),
                    ),
                    SizedBox(width: 3,),
                    GestureDetector(onTap: (() {
                       Navigator.pushReplacement(context, 
                  MaterialPageRoute(builder: (context){
                    return DispenserPage2.Cons1(patient_id,DispenserPage1(w1,patient_id,navigatorKey),"mon","even",navigatorKey,mon_even);
        
                  }));
                    }), child: Container(
                    height: constraints1.maxHeight * 0.08,
                    width:  constraints1.maxWidth * 0.15, 
                    color: mon_even==true?Colors.orange:Color(0xffeaebe7),
                /*    decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/emptybox.jpg'),
                    fit: BoxFit.fill),
                    ),*/
                    child: Center(child: Text("EVE", style: TextStyle(color: Colors.black),)),
                  ),
                  ),
                  SizedBox(width: 3,),
                    GestureDetector(onTap: (() {
                       Navigator.pushReplacement(context, 
                  MaterialPageRoute(builder: (context){
                    return DispenserPage2.Cons1(patient_id,DispenserPage1(w1,patient_id,navigatorKey),"mon","night",navigatorKey,mon_night);
        
                  }));
                    }), child: Container(
                    height: constraints1.maxHeight * 0.08,
                    width:  constraints1.maxWidth * 0.15, 
                    color: mon_night==true?Colors.blue:Color(0xffeaebe7),
                /*    decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/emptybox.jpg'),
                    fit: BoxFit.fill),
                    ),*/
                    child: Center(child: Text("NIGHT", style: TextStyle(color: Colors.black),)),
                  ),),
                  
                  
                   
                  ],
                ),
                ////////////////////////////////////////////////////////////////////////////////////
                  SizedBox(height: 7,),
               Row(
                  children: [
                    SizedBox(width: constraints1.maxWidth * 0.04),
                    GestureDetector(onTap: (){
                  Navigator.pushReplacement(context, 
                  MaterialPageRoute(builder: (context){
                    return DispenserPage2.Cons1(patient_id,DispenserPage1(w1,patient_id,navigatorKey),"tue","morn",navigatorKey,tue_morn);
        
                  }));
                    },child: Container(
                    height: constraints1.maxHeight * 0.08,
                    width:  constraints1.maxWidth * 0.15, 
                    color: tue_morn==true?Colors.red:Color(0xffeaebe7),
                /*    decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/emptybox.jpg'),
                    fit: BoxFit.fill),
                    ),*/
                    child: Center(child: Text("MORN", style: TextStyle(color: Colors.black),)),
                  ),
                  ),
                  SizedBox(width: 3,),
                    GestureDetector(onTap: (() {
                       Navigator.pushReplacement(context, 
                  MaterialPageRoute(builder: (context){
                    return DispenserPage2.Cons1(patient_id,DispenserPage1(w1,patient_id,navigatorKey),"tue","noon",navigatorKey,tue_noon);
        
                  }));
                    }), child: Container(
                    height: constraints1.maxHeight * 0.08,
                    width:  constraints1.maxWidth * 0.15, 
                    color: tue_noon==true?Colors.green:Color(0xffeaebe7),
                /*    decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/emptybox.jpg'),
                    fit: BoxFit.fill),
                    ),*/
                    child: Center(child: Text("NOON", style: TextStyle(color: Colors.black),)),
                  ),
                    ),
                    SizedBox(width: 3,),
                    GestureDetector(onTap: (() {
                       Navigator.pushReplacement(context, 
                  MaterialPageRoute(builder: (context){
                    return DispenserPage2.Cons1(patient_id,DispenserPage1(w1,patient_id,navigatorKey),"tue","even",navigatorKey,tue_even);
        
                  }));
                    }), child: Container(
                    height: constraints1.maxHeight * 0.08,
                    width:  constraints1.maxWidth * 0.15, 
                    color: tue_even==true?Colors.orange:Color(0xffeaebe7),
                /*    decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/emptybox.jpg'),
                    fit: BoxFit.fill),
                    ),*/
                    child: Center(child: Text("EVE", style: TextStyle(color: Colors.black),)),
                  ),
                  ),
                  SizedBox(width: 3,),
                    GestureDetector(onTap: (() {
                       Navigator.pushReplacement(context, 
                  MaterialPageRoute(builder: (context){
                    return DispenserPage2.Cons1(patient_id,DispenserPage1(w1,patient_id,navigatorKey),"tue","night",navigatorKey,tue_night);
        
                  }));
                    }), child: Container(
                    height: constraints1.maxHeight * 0.08,
                    width:  constraints1.maxWidth * 0.15, 
                    color: tue_night==true?Colors.blue:Color(0xffeaebe7),
                /*    decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/emptybox.jpg'),
                    fit: BoxFit.fill),
                    ),*/
                    child: Center(child: Text("NIGHT", style: TextStyle(color: Colors.black),)),
                  ),),
                  
                  
                   
                  ],
                ),
                //////////////////////////////////////////////////////////////////////////
                  SizedBox(height: 7,),
                Row(
                  children: [
                    SizedBox(width: constraints1.maxWidth * 0.04),
                    GestureDetector(onTap: (){
                  Navigator.pushReplacement(context, 
                  MaterialPageRoute(builder: (context){
                    return DispenserPage2.Cons1(patient_id,DispenserPage1(w1,patient_id,navigatorKey),"wed","morn",navigatorKey,wed_morn);
        
                  }));
                    },child: Container(
                    height: constraints1.maxHeight * 0.08,
                    width:  constraints1.maxWidth * 0.15, 
                    color: wed_morn==true?Colors.red:Color(0xffeaebe7),
                /*    decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/emptybox.jpg'),
                    fit: BoxFit.fill),
                    ),*/
                    child: Center(child: Text("MORN", style: TextStyle(color: Colors.black),)),
                  ),
                  ),
                  SizedBox(width: 3,),
                    GestureDetector(onTap: (() {
                       Navigator.pushReplacement(context, 
                  MaterialPageRoute(builder: (context){
                    return DispenserPage2.Cons1(patient_id,DispenserPage1(w1,patient_id,navigatorKey),"wed","noon",navigatorKey,wed_noon);
        
                  }));
                    }), child: Container(
                    height: constraints1.maxHeight * 0.08,
                    width:  constraints1.maxWidth * 0.15, 
                    color: wed_noon==true?Colors.green:Color(0xffeaebe7),
                /*    decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/emptybox.jpg'),
                    fit: BoxFit.fill),
                    ),*/
                    child: Center(child: Text("NOON", style: TextStyle(color: Colors.black),)),
                  ),
                    ),
                    SizedBox(width: 3,),
                    GestureDetector(onTap: (() {
                       Navigator.pushReplacement(context, 
                  MaterialPageRoute(builder: (context){
                    return DispenserPage2.Cons1(patient_id,DispenserPage1(w1,patient_id,navigatorKey),"wed","even",navigatorKey,wed_even);
        
                  }));
                    }), child: Container(
                    height: constraints1.maxHeight * 0.08,
                    width:  constraints1.maxWidth * 0.15, 
                    color: wed_even==true?Colors.orange:Color(0xffeaebe7),
                /*    decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/emptybox.jpg'),
                    fit: BoxFit.fill),
                    ),*/
                    child: Center(child: Text("EVE", style: TextStyle(color: Colors.black),)),
                  ),
                  ),
                  SizedBox(width: 3,),
                    GestureDetector(onTap: (() {
                       Navigator.pushReplacement(context, 
                  MaterialPageRoute(builder: (context){
                    return DispenserPage2.Cons1(patient_id,DispenserPage1(w1,patient_id,navigatorKey),"wed","night",navigatorKey,wed_night);
        
                  }));
                    }), child: Container(
                    height: constraints1.maxHeight * 0.08,
                    width:  constraints1.maxWidth * 0.15, 
                    color: wed_night==true?Colors.blue:Color(0xffeaebe7),
                /*    decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/emptybox.jpg'),
                    fit: BoxFit.fill),
                    ),*/
                    child: Center(child: Text("NIGHT", style: TextStyle(color: Colors.black),)),
                  ),),
                  
                  
                   
                  ],
                ),
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////
                 SizedBox(height: 7,),
                Row(
                  children: [
                    SizedBox(width: constraints1.maxWidth * 0.04),
                    GestureDetector(onTap: (){
                  Navigator.pushReplacement(context, 
                  MaterialPageRoute(builder: (context){
                    return DispenserPage2.Cons1(patient_id,DispenserPage1(w1,patient_id,navigatorKey),"thr","morn",navigatorKey,thr_morn);
        
                  }));
                    },child: Container(
                    height: constraints1.maxHeight * 0.08,
                    width:  constraints1.maxWidth * 0.15, 
                    color: thr_morn==true?Colors.red:Color(0xffeaebe7),
                /*    decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/emptybox.jpg'),
                    fit: BoxFit.fill),
                    ),*/
                    child: Center(child: Text("MORN", style: TextStyle(color: Colors.black),)),
                  ),
                  ),
                  SizedBox(width: 3,),
                    GestureDetector(onTap: (() {
                       Navigator.pushReplacement(context, 
                  MaterialPageRoute(builder: (context){
                    return DispenserPage2.Cons1(patient_id,DispenserPage1(w1,patient_id,navigatorKey),"thr","noon",navigatorKey,thr_noon);
        
                  }));
                    }), child: Container(
                    height: constraints1.maxHeight * 0.08,
                    width:  constraints1.maxWidth * 0.15, 
                    color: thr_noon==true?Colors.green:Color(0xffeaebe7),
                /*    decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/emptybox.jpg'),
                    fit: BoxFit.fill),
                    ),*/
                    child: Center(child: Text("NOON", style: TextStyle(color: Colors.black),)),
                  ),
                    ),
                    SizedBox(width: 3,),
                    GestureDetector(onTap: (() {
                       Navigator.pushReplacement(context, 
                  MaterialPageRoute(builder: (context){
                    return DispenserPage2.Cons1(patient_id,DispenserPage1(w1,patient_id,navigatorKey),"thr","even",navigatorKey,thr_even);
        
                  }));
                    }), child: Container(
                    height: constraints1.maxHeight * 0.08,
                    width:  constraints1.maxWidth * 0.15, 
                    color: thr_even==true?Colors.orange:Color(0xffeaebe7),
                /*    decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/emptybox.jpg'),
                    fit: BoxFit.fill),
                    ),*/
                    child: Center(child: Text("EVE", style: TextStyle(color: Colors.black),)),
                  ),
                  ),
                  SizedBox(width: 3,),
                    GestureDetector(onTap: (() {
                       Navigator.pushReplacement(context, 
                  MaterialPageRoute(builder: (context){
                    return DispenserPage2.Cons1(patient_id,DispenserPage1(w1,patient_id,navigatorKey),"thr","night",navigatorKey,thr_night);
        
                  }));
                    }), child: Container(
                    height: constraints1.maxHeight * 0.08,
                    width:  constraints1.maxWidth * 0.15, 
                    color:  thr_night==true?Colors.blue:Color(0xffeaebe7),
                /*    decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/emptybox.jpg'),
                    fit: BoxFit.fill),
                    ),*/
                    child: Center(child: Text("NIGHT", style: TextStyle(color: Colors.black),)),
                  ),),
                  
                  
                   
                  ],
                ),
                //////////////////////////////////////////////////////////////////////////////////////////////////
                SizedBox(height: 7,),
               Row(
                  children: [
                    SizedBox(width: constraints1.maxWidth * 0.04),
                    GestureDetector(onTap: (){
                  Navigator.pushReplacement(context, 
                  MaterialPageRoute(builder: (context){
                    return DispenserPage2.Cons1(patient_id,DispenserPage1(w1,patient_id,navigatorKey),"fri","morn",navigatorKey,fri_morn);
        
                  }));
                    },child: Container(
                    height: constraints1.maxHeight * 0.08,
                    width:  constraints1.maxWidth * 0.15, 
                    color: fri_morn==true?Colors.red:Color(0xffeaebe7),
                /*    decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/emptybox.jpg'),
                    fit: BoxFit.fill),
                    ),*/
                    child: Center(child: Text("MORN", style: TextStyle(color: Colors.black),)),
                  ),
                  ),
                  SizedBox(width: 3,),
                    GestureDetector(onTap: (() {
                       Navigator.pushReplacement(context, 
                  MaterialPageRoute(builder: (context){
                    return DispenserPage2.Cons1(patient_id,DispenserPage1(w1,patient_id,navigatorKey),"fri","noon",navigatorKey,fri_noon);
        
                  }));
                    }), child: Container(
                    height: constraints1.maxHeight * 0.08,
                    width:  constraints1.maxWidth * 0.15, 
                    color: fri_noon==true?Colors.green:Color(0xffeaebe7),
                /*    decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/emptybox.jpg'),
                    fit: BoxFit.fill),
                    ),*/
                    child: Center(child: Text("NOON", style: TextStyle(color: Colors.black),)),
                  ),
                    ),
                    SizedBox(width: 3,),
                    GestureDetector(onTap: (() {
                       Navigator.pushReplacement(context, 
                  MaterialPageRoute(builder: (context){
                    return DispenserPage2.Cons1(patient_id,DispenserPage1(w1,patient_id,navigatorKey),"fri","even",navigatorKey,fri_even);
        
                  }));
                    }), child: Container(
                    height: constraints1.maxHeight * 0.08,
                    width:  constraints1.maxWidth * 0.15, 
                    color: fri_even==true?Colors.orange:Color(0xffeaebe7),
                /*    decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/emptybox.jpg'),
                    fit: BoxFit.fill),
                    ),*/
                    child: Center(child: Text("EVE", style: TextStyle(color: Colors.black),)),
                  ),
                  ),
                  SizedBox(width: 3,),
                    GestureDetector(onTap: (() {
                       Navigator.pushReplacement(context, 
                  MaterialPageRoute(builder: (context){
                    return DispenserPage2.Cons1(patient_id,DispenserPage1(w1,patient_id,navigatorKey),"fri","night",navigatorKey,fri_night);
        
                  }));
                    }), child: Container(
                    height: constraints1.maxHeight * 0.08,
                    width:  constraints1.maxWidth * 0.15, 
                    color: fri_night==true?Colors.blue:Color(0xffeaebe7),
                /*    decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/emptybox.jpg'),
                    fit: BoxFit.fill),
                    ),*/
                    child: Center(child: Text("NIGHT", style: TextStyle(color: Colors.black),)),
                  ),),
                  
                  
                   
                  ],
                ),
                /////////////////////////////////////////////////////////////////////////////////////////////////
                SizedBox(height: 7,),
                Row(
                  children: [
                    SizedBox(width: constraints1.maxWidth * 0.04),
                    GestureDetector(onTap: (){
                  Navigator.pushReplacement(context, 
                  MaterialPageRoute(builder: (context){
                    return DispenserPage2.Cons1(patient_id,DispenserPage1(w1,patient_id,navigatorKey),"sat","morn",navigatorKey,sat_morn);
        
                  }));
                    },child: Container(
                    height: constraints1.maxHeight * 0.08,
                    width:  constraints1.maxWidth * 0.15, 
                    color: sat_morn==true?Colors.red:Color(0xffeaebe7),
                /*    decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/emptybox.jpg'),
                    fit: BoxFit.fill),
                    ),*/
                    child: Center(child: Text("MORN", style: TextStyle(color: Colors.black),)),
                  ),
                  ),
                  SizedBox(width: 3,),
                    GestureDetector(onTap: (() {
                       Navigator.pushReplacement(context, 
                  MaterialPageRoute(builder: (context){
                    return DispenserPage2.Cons1(patient_id,DispenserPage1(w1,patient_id,navigatorKey),"sat","noon",navigatorKey,sat_noon);
        
                  }));
                    }), child: Container(
                    height: constraints1.maxHeight * 0.08,
                    width:  constraints1.maxWidth * 0.15, 
                    color: sat_noon==true?Colors.green:Color(0xffeaebe7),
                /*    decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/emptybox.jpg'),
                    fit: BoxFit.fill),
                    ),*/
                    child: Center(child: Text("NOON", style: TextStyle(color: Colors.black),)),
                  ),
                    ),
                    SizedBox(width: 3,),
                    GestureDetector(onTap: (() {
                       Navigator.pushReplacement(context, 
                  MaterialPageRoute(builder: (context){
                    return DispenserPage2.Cons1(patient_id,DispenserPage1(w1,patient_id,navigatorKey),"sat","even",navigatorKey,sat_even);
        
                  }));
                    }), child: Container(
                    height: constraints1.maxHeight * 0.08,
                    width:  constraints1.maxWidth * 0.15, 
                    color: sat_even==true?Colors.orange:Color(0xffeaebe7),
                /*    decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/emptybox.jpg'),
                    fit: BoxFit.fill),
                    ),*/
                    child: Center(child: Text("EVE", style: TextStyle(color: Colors.black),)),
                  ),
                  ),
                  SizedBox(width: 3,),
                    GestureDetector(onTap: (() {
                      
                       Navigator.pushReplacement(context, 
                  MaterialPageRoute(builder: (context){
                    return DispenserPage2.Cons1(patient_id,DispenserPage1(w1,patient_id,navigatorKey),"sat","night",navigatorKey,sat_night);
        
                  }));
                    }), child: Container(
                    height: constraints1.maxHeight * 0.08,
                    width:  constraints1.maxWidth * 0.15, 
                    color: sat_night==true?Colors.blue:Color(0xffeaebe7),
                /*    decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/emptybox.jpg'),
                    fit: BoxFit.fill),
                    ),*/
                    child: Center(child: Text("NIGHT", style: TextStyle(color: Colors.black),)),
                  ),),
                  
                  
                   
                  ],
                ),
              ],
            ),
              ),
                   
        //  },
      //  ),
                     
            
                ],
               ),
              ],
            ),
          );
          }
          
        ),
      ),
    ),
              ]
          )
       )
    );
  }
}