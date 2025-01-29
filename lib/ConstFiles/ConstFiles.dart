import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pigeon_loft/widgets/FontWidgets/FontWidget.dart';

Color spbgColor=Color(0xff6200ed);
Color hintTextColor=Color(0xffb3b3b3);
Color textColor=Color(0xfffacaff);
Color blackColor=Color(0xff000000);
Color whiteColor=Color(0xffffffff);


/// splash Screen Lottie files
 String splashLottie='assets/Loa.json';


 ///fontSize Config

double vSmall=13;
double xlSmall=14;
double small=16;
double medium=18;
double large=20;
double xlLarge=22;

/// font Class Const Fill
FontsClass fontsValue = FontsClass();

/// lottie file
String lottieAnimation='assets/otpwaiting (New).json';


///drawer Key

 GlobalKey<ScaffoldState> drawerKey=GlobalKey();
 const IconData menu = IconData(0xe3dc, fontFamily: 'MaterialIcons');

///hide keyboard function

hideKeyBoard(BuildContext context){
 return FocusScope.of(context).unfocus();
}
/// TimeDisplay Screen

String timeStandard='Indian Standard Time';

String clockImg='assets/Clock.png';

///DashBoard Screen

String userImg='assets/UserICon.png';
String birdImg='assets/bird.png';
String singleBird='assets/Single.png';
String pairBird='assets/Pairs.png';