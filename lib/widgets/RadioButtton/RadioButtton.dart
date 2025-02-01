import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pigeon_loft/ConstFiles/ConstFiles.dart';
import 'package:pigeon_loft/Controller/pigeonInfoController.dart';
import 'package:pigeon_loft/widgets/CustomContainer/CustomContainer.dart';
import 'package:pigeon_loft/widgets/TextWidgets/customeText.dart';

class RadioButtton extends StatefulWidget {
  const RadioButtton({super.key});

  @override
  State<RadioButtton> createState() => _RadioButttonState();
}

class _RadioButttonState extends State<RadioButtton> {



  @override
  Widget build(BuildContext context) {

    return GetBuilder<pigeonInfoController>(
      init: pigeonInfoController(),
      builder: (dataController) {

      return  Padding(
        padding: const EdgeInsets.only(top: 8,bottom: 8),
        child: CustomContainer(
          height: 40,
          width: double.infinity,
          elevation: 12,
          borderContent: Border.all(
              color: spbgColor,
              width: 2
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List<Widget>.generate(
                dataController.radioButtonList.length,
                    (index) => RadioMenuButton(
                    value: dataController.radioButtonList[index].radioButtonValue,
                    groupValue: dataController.status,
                    onChanged: (value) {
                      dataController.selectValueRadio(value:value);
                    },
                    child: Custometext(
                      textStyle: fontsValue.fontstyleAboreto(
                          fontSize: small, fontWeight: FontWeight.w600),
                      textName: dataController.radioButtonList[index].radioButtonTextValue,
                    ))),
          ),
        ),
      );
    },);
  }
}
