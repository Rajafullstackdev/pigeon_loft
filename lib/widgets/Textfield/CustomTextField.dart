import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pigeon_loft/ConstFiles/ConstFiles.dart';

class CustomTextField extends StatefulWidget {
  TextEditingController controller;
  String hintText;
  TextStyle ?hintStyle;
  Function(String) ?onSubmit;
  List <TextInputFormatter> ? inputFormat;
  TextAlign ?alignText;
  Widget?suffixWidget;
  Widget?prefixWidget;
  EdgeInsets?conPadding;

  CustomTextField(
      {
        required this.controller,
        this.hintStyle,
        required this.hintText,
        this.onSubmit,
        this.inputFormat,
        this.alignText,
        this.suffixWidget,
        this.prefixWidget,
        this.conPadding,
      });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.hintText,
          suffixIcon: widget.suffixWidget,
          prefixIcon:widget.prefixWidget ,
          contentPadding: widget.conPadding??EdgeInsets.only(left: 10,bottom: 5),
          hintStyle: widget.hintStyle ?? fontsValue.fontstyleAboreto(
            fontWeight: FontWeight.w600,
            fontSize: small
          )
      ),
      style: widget.hintStyle ?? fontsValue.fontstyleAboreto(
          fontWeight: FontWeight.w600,
          fontSize: small
      ),
     // onSubmitted: widget.onSubmit,
      onChanged: widget.onSubmit,
      inputFormatters: widget.inputFormat ?? [],
      textAlign: widget.alignText??TextAlign.start,
    );
  }
}
