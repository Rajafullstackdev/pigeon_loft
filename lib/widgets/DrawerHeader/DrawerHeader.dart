import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pigeon_loft/ConstFiles/ConstFiles.dart';
import 'package:pigeon_loft/Controller/drawerController.dart';
import 'package:pigeon_loft/widgets/TextWidgets/customeText.dart';

class drawerHead extends StatefulWidget {
  const drawerHead({super.key});

  @override
  State<drawerHead> createState() => _drawerHeadState();
}

class _drawerHeadState extends State<drawerHead> {

  final drawerCon=Get.put(drawerController(),tag:"drawerController");

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 200,
      width: double.infinity,
      padding: EdgeInsets.only(left: 15,top: 25),
      decoration: BoxDecoration(
          color: spbgColor,
          border: Border(
          bottom: BorderSide(
            width: 2,
            color: Colors.grey
          )
        )
      ),
      child: Column(
        spacing: 4,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment:CrossAxisAlignment.start ,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Image Widgets
              CircleAvatar(
                radius: 50,
                backgroundColor: whiteColor,
                child:FaIcon(FontAwesomeIcons.userSecret),
              ),

              ///theme Change Widgets
              GestureDetector(
                onTap: (){
                  setState(() {
                    drawerCon. changeTheme();
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: CircleAvatar(
                    backgroundColor: drawerCon.theme?Colors.black:whiteColor,
                    child: Icon(
                      CupertinoIcons.sun_max_fill,
                      color:drawerCon.theme? whiteColor:spbgColor,
                      size: 24.0,
                    ),
                  ),
                ),
              )
            ],
          ),

          /// userName Text
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Custometext(
              textStyle: fontsValue.fontstyleAboreto(
                  fontSize: small,
                fontColor: whiteColor,
                fontWeight: FontWeight.w600
              ),
              textName: 'Pigeon Loft Manager',
            ),
          ),

          /// Mail Text
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Custometext(
              textStyle: fontsValue.fontstyleAboreto(
                  fontSize: vSmall,
                  fontColor: whiteColor,
                  fontWeight: FontWeight.w600
              ),
              textName: 'demo123@gmail.com',
            ),
          ),
        ],
      ),
    );
  }
}
