
// import 'package:alert_dialog/alert_dialog.dart';
// import 'package:flutter/material.dart';
// // import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:pill_reminder_system/Model/patient.dart';
// import 'package:pill_reminder_system/Screens/signup.dart';
// import 'package:pill_reminder_system/utilities/customwidgets/custombutton.dart';
// import 'package:pill_reminder_system/utilities/customwidgets/customtextform.dart';


// // ignore: must_be_immutable
// class SignupPage2 extends StatefulWidget {
//   Patient p;
//   SignupPage2(this.p);
//   //const SignupPage2( {Key? key}) : super(key: key);
    
//   @override
//   State<SignupPage2> createState() => _SignupPageState(p);

  
// }

// class _SignupPageState extends State<SignupPage2> {
//   String? response;
//   Patient p;
//   _SignupPageState(this.p);
//   TextEditingController demailcont=new TextEditingController();
//   TextEditingController cemailcont=new TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Center(child: const Text('Sign Up'))),
//       body: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                  GestureDetector(
//                   child: Container(height: 40,width:40,child: Image.asset('assets/images/backward.jpeg')),
//                   onTap: (){
//                      Navigator.pushReplacement(context, 
//                 MaterialPageRoute(builder: (context){
//                   return SignupPage();

//                 }));
//                   },
//                   ),
//                  SizedBox(width: 10,),
//                  Container(height: 40,width:40,child: Image.asset('assets/images/forward.jpeg')),
//               ],
//             ),
//             SizedBox(height: 10,),
//             SizedBox(height: 10,),
//             CustomTextForm('Doctor Email Id', 'Doctor Email Id',null,false,demailcont,
//             ),          
//             SizedBox(height: 10,),
//             CustomTextForm('CareTaker Email Id', 'CareTaker Email Id',null,false,cemailcont,
//             ),
//              SizedBox(height: 10,),
           
//              SizedBox(height: 10,),
              
//             SizedBox(height: 10,),
//             SizedBox(height: 30,),
//             CustomButton('OK',()async{
//              String c_email = cemailcont.text;
//              String d_email = demailcont.text;
//              print('good work1');
//              response =await p.signupQuery(c_email, d_email); 
//               if(response==null)
//              response='Error..';
//              else if(response=="Exsist")
//              {
//                response='Already exsist';
//                demailcont.clear();
//                cemailcont.clear();
//               return alert(context, title: const Text('Account Already exist'));              
//              }
            
//              else{
//               demailcont.clear();
//               cemailcont.clear();
//               response='Account created';
//                  return alert(context, title: const Text('Sign Up Successfully'));              
//              }
//             }),
           

//           ],

//         ),
//       ),

//     );
    
//   }
// }