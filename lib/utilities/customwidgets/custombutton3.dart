import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

// ignore: must_be_immutable
class CustomButton3 extends StatelessWidget {
 Widget w;
  dynamic method;
  CustomButton3(this.w,this.method);

  

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: method, 
      
      child: w,
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




