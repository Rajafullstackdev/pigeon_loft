import 'package:flutter/material.dart';

class Button extends StatefulWidget {

  Widget child;
  double? buttonHeight;
  double? buttonwidth;
  Color? buttonColor;
  Color ?buttonShadowColor;
  Padding? buttonPadding;
  BorderRadius? buttonradius;
  double ?buttonElevation;
  VoidCallback clickfunction;

  Button(
      {this.buttonHeight,
      this.buttonColor,
      this.buttonPadding,
        this.buttonElevation,
        this.buttonShadowColor,
      this.buttonwidth,
      this.buttonradius,
      required this.child,
      required this.clickfunction,
      });

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.clickfunction,
      child: Material(
        elevation: widget.buttonElevation??10,
        shadowColor: widget.buttonShadowColor??Colors.black12,
        color: widget.buttonColor ?? Colors.grey.shade300,
        borderRadius: widget.buttonradius ?? BorderRadius.circular(5),
        child: Container(
          height: widget.buttonHeight ?? 50,
          width: widget.buttonwidth ?? 100,
          decoration: BoxDecoration(
            color: widget.buttonColor ?? Colors.grey.shade300,
            borderRadius: widget.buttonradius ?? BorderRadius.circular(5),
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
