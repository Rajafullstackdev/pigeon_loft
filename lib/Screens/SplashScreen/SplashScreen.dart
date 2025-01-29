import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pigeon_loft/ConstFiles/ConstFiles.dart';
import 'package:pigeon_loft/Screens/AnthendicationScreen/AnthendicationScreen.dart';
import 'package:pigeon_loft/widgets/CopyrightWidgets/CopyrightsWidget.dart';
import 'package:pigeon_loft/widgets/FontWidgets/FontWidget.dart';
import 'package:pigeon_loft/widgets/TextWidgets/customeText.dart';
import 'package:lottie/lottie.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {




  @override
  void initState() {

    Future.delayed(Duration(seconds: 3),(){
      Get.off(AnthendicationScreen(),
          curve: Curves.easeInOut,
          transition: Transition.zoom);
    });

    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Material(
                color: Colors.white,
                elevation: 15,
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                height: 110,
                width: 110,
               child: Icon(Icons.person),
               // child: Image.asset('assets/profile back.jpeg'),
              ),
              ),

              /// Custom Text widgets
              Custometext(
                textName: "Pigeon Loft Manager",
                textStyle: fontsValue.fontstyleAboreto(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    fontColor: spbgColor,) ,
              ),

              /// Lottie File Widgets
              Lottie.asset(splashLottie,height: 90,width: 90)
            ],
          ),
        ),
      ),
      bottomNavigationBar: CopyRights(copyRightText: "CopyRights @ 2025",),
    );
  }

}

