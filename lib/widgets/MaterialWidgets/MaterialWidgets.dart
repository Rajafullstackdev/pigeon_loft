import 'package:flutter/material.dart';
import 'package:pigeon_loft/ConstFiles/ConstFiles.dart';

class MaterialWidgets extends StatefulWidget {
  double? elevation;
  BorderRadius? borderRadius;
  Color? shadowColor;
  Color? materialColor;
  Widget materialWidgets;

  MaterialWidgets({
    this.borderRadius,
    this.shadowColor,
    this.elevation,
    this.materialColor,
    required this.materialWidgets,
  });

  @override
  State<MaterialWidgets> createState() => _MaterialWidgetsState();
}

class _MaterialWidgetsState extends State<MaterialWidgets> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: widget.elevation ?? 5,
      shadowColor: widget.shadowColor ?? Colors.black12,
      color: widget.materialColor??whiteColor,
      borderRadius: widget.borderRadius ?? BorderRadius.circular(5),
      child:widget.materialWidgets ,
    );
  }
}
