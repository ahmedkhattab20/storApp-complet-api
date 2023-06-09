import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget
{
  String text;
  Color color;
  VoidCallback onTap;
   CustomButton(

   {required this.text,required this.color,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
    
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color),
        child:
        Center(child: Text(text,style: TextStyle( fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white))),
      ),
    );
  }
}
