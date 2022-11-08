import 'package:flutter/material.dart';
import '../const.dart';

class CusomTextFormField extends StatelessWidget {
  CusomTextFormField({
    required this.hintText,
    this.onChange,
    this.validator,
    Key? key,
  }) : super(key: key);
  String hintText;
  String? Function(String?)? validator;
  void Function(String)? onChange;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        validator: validator,
        onChanged: onChange,
        style: TextStyle(color: fontColor,fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: fontColor,fontWeight: FontWeight.bold),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
              borderRadius:BorderRadius.circular(10) ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
              borderRadius:BorderRadius.circular(10) ),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
              borderRadius:BorderRadius.circular(10) ),
        ),
      ),
    );
  }
}