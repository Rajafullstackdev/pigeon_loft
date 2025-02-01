import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pigeon_loft/ConstFiles/ConstFiles.dart';
import 'package:pigeon_loft/Controller/dashBoardController.dart';
import 'package:pigeon_loft/widgets/CustomContainer/CustomContainer.dart';
import 'package:pigeon_loft/widgets/TextWidgets/customeText.dart';
import 'package:pigeon_loft/widgets/Textfield/CustomTextField.dart';

class SearchContainer extends StatefulWidget {

  @override
  State<SearchContainer> createState() => _SearchContainerState();
}

class _SearchContainerState extends State<SearchContainer> {

  final dashController=Get.put(dashBoardController(),tag:'dashBoardController');
  @override
  Widget build(BuildContext context) {
    return  dashController.searchEnable?
    ElasticInLeft(
      duration: Duration(milliseconds: 400),
      animate: true,
      child: CustomContainer(
        height: 45,
        width: double.infinity,
        borderRadius: BorderRadius.circular(50),
        elevation: 2,
        child: Center(
          child: CustomTextField
            (
            controller: dashController.searchCon,
            hintText: 'Search',
            onSubmit: (val) {

            },
          ),
        ),
      )
    ):
    ElasticInRight(
      duration: Duration(milliseconds: 400),
      animate: true,
      child: Custometext(
        textName: 'Dashboard',
        textStyle: fontsValue.fontstyleAboreto(
          fontWeight: FontWeight.w500,
          fontSize: medium,
          fontColor: Colors.white,
        ),
      ),
    );
  }
}
