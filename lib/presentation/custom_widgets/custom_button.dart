import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
 final Color? buttonColor;
 final String buttonText;
 final Function()? onTap;
  const CustomButton({super.key, this.buttonColor,this.onTap,required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap:onTap,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color:buttonColor?? Colors.teal,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
