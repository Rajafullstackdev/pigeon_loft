import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pigeon_loft/ConstFiles/ConstFiles.dart';
import 'package:pigeon_loft/Controller/pigeonInfoController.dart';
import 'package:pigeon_loft/widgets/AppBarWidgets/AppBarWidget.dart';
import 'package:pigeon_loft/widgets/CustomContainer/CustomContainer.dart';
import 'package:pigeon_loft/widgets/DropDownWidgets/DropDownWidgets.dart';
import 'package:pigeon_loft/widgets/RadioButtton/RadioButtton.dart';
import 'package:pigeon_loft/widgets/TextWidgets/customeText.dart';
import 'package:pigeon_loft/widgets/Textfield/CustomTextField.dart';
import 'package:pigeon_loft/widgets/custtomIconButton/customIconButton.dart';

class PigeonInfo extends StatefulWidget {
  const PigeonInfo({super.key});

  @override
  State<PigeonInfo> createState() => _PigeonInfoState();
}

class _PigeonInfoState extends State<PigeonInfo> {



  @override
  Widget build(BuildContext context) {
    return GetBuilder<pigeonInfoController>(
      init: pigeonInfoController(),
      builder: (dataController) {
      return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(double.infinity, 60),
            child: AppBarWidget(
              leadingWidget: IconButton(
                onPressed: () {
                  Get.back();
                  dataController.clearList();
                },
                icon: FaIcon(
                  FontAwesomeIcons.arrowLeft,
                  color: whiteColor,
                ),
              ),
              textName: 'PigeonInfo',
            ),
          ),
          body:
          Padding(
            padding: const EdgeInsets.all( 8),
            child:Column(
              children: [

                ///pigeon Pick Image widgets
                GestureDetector(
                  onTap: (){
                    dataController.selectTypeFilePick(context: context);
                  },
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      ///Image Container
                      Obx((){
                        return CustomContainer(
                            elevation: 4,
                            shadowColor: spbgColor,
                            height: 200,
                            borderContent: Border.all(
                                color: spbgColor,
                                width: 1.5
                            ),
                            width: double.infinity,
                            child:dataController.imageList.value.isNotEmpty?
                            Image.file(dataController.imageList.value[0],fit: BoxFit.cover,):
                            custtomIconButton(
                              iconSize: 100,
                              icon: CupertinoIcons.camera_on_rectangle,
                            ));
                      }),

                      ///Icon Container widgets
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                        Obx((){
                          return SizedBox(
                            child: dataController.imageList.value.isEmpty?
                            CustomContainer(
                                elevation: 12,
                                height: 50,
                                innerColor: spbgColor,
                                outColor: spbgColor,
                                borderRadius: BorderRadius.circular(50),
                                width: 50,
                                child: custtomIconButton(
                                  elevation: 12,
                                  borderRadius: BorderRadius.circular(50),
                                  outterColor: spbgColor,
                                  icon: CupertinoIcons.pencil,
                                  iconColor: whiteColor,
                                  iconSize: 30,

                                )):SizedBox(),
                          );
                        }),

                      ),
                    ],
                  ),
                ),

                ///PigeonStatus Radio Button
                RadioButtton(),

                ///Fields Custom Text fields

                Row(
                 spacing: 15,
                  children: [

                    ///Ring Id Controller Widgets
                    Expanded(
                      child: CustomContainer(
                        height: 50,
                        child: CustomTextField(
                        labelWidget: Custometext(
                          textStyle: fontsValue.fontstyleAboreto(
                            fontColor: spbgColor,
                              fontSize: small, fontWeight: FontWeight.w600),
                          textName: 'RingID',
                        ),
                        controller: dataController.ringIdController,
                      ),),
                    ),

                    Expanded(
                      child: CustomContainer(
                        height: 50,
                        child: DropDownWidgets(
                          dropDownList: dataController.dropDownMenuList,
                          dropDownValue:dataController.dropMenuSelectValue,
                          onChangeFunc: (String? selectedValue) {
                            dataController.dropDownSelectedValue(value: selectedValue);
                          },

                        )),
                    ),
                  ],
                )

              ],
            ),

          )
      );
    },);
  }
}
