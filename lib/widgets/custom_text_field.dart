import 'package:flutter/material.dart';
import 'package:stor/models/product_model.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {
       this.hintText,
       this.inputType,
       this.onChanged,
       this.obscureText=false
      });
  String? hintText;
  TextInputType? inputType;
  Function(String)? onChanged;

  bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText!,
      onChanged: onChanged,
      keyboardType: inputType,
      decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.grey),
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.black)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.black,
              ))),
    );
  }
}
