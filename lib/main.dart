import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pigeon_loft/ConstFiles/ConstFiles.dart';
import 'package:pigeon_loft/Screens/DashBoardScreen/DashBoardScreen.dart';
import 'package:pigeon_loft/Screens/SplashScreen/SplashScreen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: spbgColor
        ),
           useMaterial3: true,
            visualDensity: VisualDensity.comfortable,
            textTheme: TextTheme(
              bodyMedium: GoogleFonts.aBeeZee(),
              bodySmall: GoogleFonts.monsieurLaDoulaise()
      )
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
