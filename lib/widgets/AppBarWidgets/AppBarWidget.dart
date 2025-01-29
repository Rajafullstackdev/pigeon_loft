import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pigeon_loft/ConstFiles/ConstFiles.dart';
import 'package:pigeon_loft/widgets/FontWidgets/FontWidget.dart';
import 'package:pigeon_loft/widgets/TextWidgets/customeText.dart';

class AppBarWidget extends StatefulWidget {
  String textName;
  AppBarWidget({required this.textName});

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {

  FontsClass fontsValue = FontsClass();
  @override
  Widget build(BuildContext context) {
    return  AppBar(
      elevation: 0,
      backgroundColor: spbgColor,
    //  bottom: PreferredSize(preferredSize: Size(double.infinity, 2), child: Divider()),
      title: Row(

        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Custometext(
            textName: widget.textName,
            textStyle: fontsValue.fontstyleAboreto(
              fontWeight: FontWeight.w500,
              fontSize: medium,
              fontColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
