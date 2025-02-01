import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pigeon_loft/ConstFiles/ConstFiles.dart';
import 'package:pigeon_loft/widgets/FontWidgets/FontWidget.dart';
import 'package:pigeon_loft/widgets/TextWidgets/customeText.dart';

class AppBarWidget extends StatefulWidget {
  String textName;
  Widget ?leadingWidget;
  Widget ?centerWidget;
  List<Widget>? listWidget;
  AppBarWidget({required this.textName,this.leadingWidget,this.listWidget,this.centerWidget});

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {

  FontsClass fontsValue = FontsClass();
  @override
  Widget build(BuildContext context) {
    return  AppBar(
      leading: widget.leadingWidget,
      actions: widget.listWidget,
      elevation: 0,
      backgroundColor: spbgColor,
    //  bottom: PreferredSize(preferredSize: Size(double.infinity, 2), child: Divider()),
      title:widget. centerWidget??
      Custometext(
        textName: widget.textName,
        textStyle: fontsValue.fontstyleAboreto(
          fontWeight: FontWeight.w500,
          fontSize: medium,
          fontColor: Colors.white,
        ),
      ),
    );
  }
}
