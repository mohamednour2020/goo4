import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:goo4/app/app_fonts.dart';

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
        height: 54.h,
        width: 1.sw,
        decoration: BoxDecoration(
          color:buttonColor?? Colors.teal,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 20.sp, color: Colors.white,fontFamily: AppFonts.lightFont),
          ),
        ),
      ),
    );
  }
}
