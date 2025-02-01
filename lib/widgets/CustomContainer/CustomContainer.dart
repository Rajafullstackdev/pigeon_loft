import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pigeon_loft/ConstFiles/ConstFiles.dart';

class CustomContainer extends StatefulWidget {
  double? elevation;
  Color? outColor;
  Color? innerColor;
  double? height;
  double? width;
  BorderRadius? borderRadius;
  Widget child;
  Color ?shadowColor;
  EdgeInsets?contentPadding;
  Border?borderContent;

  CustomContainer(
      {this.elevation,
      this.innerColor,
      this.outColor,
      this.shadowColor,
      this.height,
      this.width,
      this.borderRadius,
      this.contentPadding,
      this.borderContent,
      required this.child});

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: widget.elevation ?? 5,
        color: widget.outColor ?? whiteColor,
        borderRadius: widget.borderRadius ?? BorderRadius.circular(5),
        shadowColor: widget.shadowColor??Colors.black12,
        child: Container(
          padding: widget.contentPadding??EdgeInsets.all(2),
          height: widget.height ?? 100,
          width: widget.width ?? 100,
          decoration: BoxDecoration(
              color: widget.innerColor ?? whiteColor,
              border: widget.borderContent,
              borderRadius: widget.borderRadius ?? BorderRadius.circular(5)),
          child: widget.child,
        )
    );
  }
}
