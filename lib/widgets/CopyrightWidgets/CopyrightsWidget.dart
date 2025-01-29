import 'package:flutter/cupertino.dart';
import 'package:pigeon_loft/widgets/TextWidgets/customeText.dart';

class CopyRights extends StatefulWidget {
  String copyRightText;
  CopyRights({required this.copyRightText});
  @override
  State<CopyRights> createState() => _CopyRightsState();
}

class _CopyRightsState extends State<CopyRights> {



  @override
  Widget build(BuildContext context) {
    return    Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Custometext(textName:widget.copyRightText,),
      ],
    ),
    );
  }
}
