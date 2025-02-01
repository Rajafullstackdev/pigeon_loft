import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pigeon_loft/ConstFiles/ConstFiles.dart';
import 'package:pigeon_loft/Controller/pigeonInfoController.dart';
import 'package:pigeon_loft/widgets/TextWidgets/customeText.dart';

class DropDownWidgets extends StatefulWidget {
  Function(String?) onChangeFunc;
  String  dropDownValue;
 List<String> dropDownList;
 DropDownWidgets({required this.dropDownList,required this.dropDownValue, required this.onChangeFunc});



  @override
  State<DropDownWidgets> createState() => _DropDownWidgetsState();
}

class _DropDownWidgetsState extends State<DropDownWidgets> {
  @override
  Widget build(BuildContext context) {

    return  DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        isDense: true,
        hint: Custometext(
          textStyle: fontsValue.fontstyleAboreto(
              fontColor: spbgColor,
              fontSize: small, fontWeight: FontWeight.w600),
          textName: widget.dropDownValue,
        ),
        items:widget. dropDownList
            .map((String item) => DropdownMenuItem<String>(
          value: item,
          child: Custometext(
            textName:item,
            textStyle: fontsValue.fontstyleAboreto(
                fontColor: spbgColor,
                fontSize: small, fontWeight: FontWeight.w600),
          ),
        ))
            .toList(),
        value: widget.dropDownValue.isEmpty ? null : widget.dropDownValue,
        onChanged: widget.onChangeFunc,
        buttonStyleData: const ButtonStyleData(
          padding: EdgeInsets.symmetric(horizontal: 16),
          height: 40,
          width: 140,
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
        ),
      ),
    );
  }
}
