
import 'package:flutter/material.dart';
import '../const.dart';

class CustomText extends StatelessWidget {
  CustomText({
    this.overflow,this.maxLines,
    required this.txt,this.isBold=false,this.fontSize=18,this.textAlign,Key? key }) : super(key: key);
  String txt;
  bool isBold;
  double fontSize;
  TextAlign? textAlign;
  int? maxLines;
  TextOverflow? overflow;
  @override
  Widget build(BuildContext context) {
    return Text(
        txt,
        textAlign:textAlign ,
        style: TextStyle(

          color: fontColor,
          fontWeight: isBold?FontWeight.bold:FontWeight.normal,
          fontSize: fontSize,
        ),
      maxLines:maxLines ,
      overflow: overflow,
    );
  }
}