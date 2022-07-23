import 'package:flutter/material.dart';

class TextFiledTest extends StatelessWidget {
  IconData icon;
  String hintText;
  bool hide;
  var typekeyboard;
  dynamic asmaa;
  dynamic hussein;
  TextFiledTest(
      this.icon, this.hintText, this.hide, this.typekeyboard, this.asmaa,this.hussein//this.Controller
      );
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 80,
      child: Center(
        child: TextFormField(//controller: Controller,
          onChanged: asmaa,
          validator: hussein,
          obscureText: hide,
          keyboardType: typekeyboard,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(15)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 3),
                borderRadius: BorderRadius.circular(15)),
            contentPadding: EdgeInsets.all(10),
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
