
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontsClass{
  fontstyleAboreto({fontSize=14 ,fontColor=Colors.black,fontWeight=FontWeight.normal,letterSpacing=0 ,boxshowEnable=false}){

    var result=
      GoogleFonts.montserrat(
        shadows: boxshowEnable?[
          Shadow(
            blurRadius: 10.0,
            color: Colors.grey,
            offset: Offset(2.0, 2.0),
          ),
        ]:[],
        fontSize:double.parse(fontSize.toString()),
        color: fontColor,
        letterSpacing: double.parse(letterSpacing.toString()),
        fontWeight: fontWeight
      );
    return result;



  }


}