
import 'package:flutter/material.dart';

import '../../constant/colors.dart';

class CustomButton1 extends StatelessWidget {
   final Size size;
   final String text;
   final VoidCallback? onPressed;
  const CustomButton1({
    super.key,
    required this.text,
    required this.size,
    this.onPressed
  });

 

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap:onPressed ,
        child: Container(
          height: size.height*0.06,
          width: size.width*0.8,
          decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.circular(28)
          ),
          child:  Center(child: Text(text,style: const TextStyle(color: AppColor.backgrounColor,fontSize: 18),)),
        ),
      );
  }
}