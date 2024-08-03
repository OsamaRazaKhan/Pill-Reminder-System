import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextForm extends StatefulWidget {
  String hinttext;
  String labeltext;
  bool obsecuretext;
  String? obsecurechar;
  TextEditingController controller;
  
  CustomTextForm(this.hinttext,this.labeltext,
        this.obsecurechar,this.obsecuretext,this.controller,     
        );

  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(fontSize: 30,
      color: Colors.black,
      
      ),
      controller:widget.controller,
      obscureText: widget.obsecuretext,
      obscuringCharacter: widget.obsecurechar!=null?widget.obsecurechar!:"*",
      decoration: InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      border: OutlineInputBorder(),
      
        hintText: widget.hinttext,
        labelText: widget.labeltext,
     
      ),


    );
    
  }
}