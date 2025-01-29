import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Custometext extends StatefulWidget {
  String textName;
  TextStyle ?textStyle;
  Color ?fontColor;


  Custometext({super.key, required this.textName,this.textStyle,this.fontColor});

  @override
  State<Custometext> createState() => _CustometextState();
}

class _CustometextState extends State<Custometext> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.textName??"",style: widget.textStyle??GoogleFonts.aboreto(color: widget.fontColor??Colors.black),);
  }
}


