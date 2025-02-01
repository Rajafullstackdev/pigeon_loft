import 'package:flutter/material.dart';
import 'package:pigeon_loft/ConstFiles/ConstFiles.dart';

class custtomIconButton extends StatefulWidget {

  double ?elevation;
  BorderRadius ?borderRadius;
  Color ?shadowColor;
  IconData icon;
  Color? iconColor;
  Widget?child;
  Color ?outterColor;
  double ?iconSize;

  custtomIconButton(
      {this.elevation,
        this.shadowColor,
        this.iconSize,
        this.borderRadius,
        required this.icon,
        this.iconColor,
        this.child,
        this.outterColor});

  @override
  State<custtomIconButton> createState() => _custtomIconButtonState();
}

class _custtomIconButtonState extends State<custtomIconButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color:widget.outterColor??whiteColor,
      elevation: widget.elevation ?? 10,
      borderRadius: widget.borderRadius ?? BorderRadius.circular(5),
      shadowColor: widget.shadowColor ?? Colors.black12,
      child: widget.child ??
          Icon(widget.icon, color: widget.iconColor ?? spbgColor, size: widget.iconSize??20,),
    );
  }
}
