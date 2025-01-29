import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pigeon_loft/ConstFiles/ConstFiles.dart';
import 'package:pigeon_loft/widgets/CustomContainer/CustomContainer.dart';
import 'package:pigeon_loft/widgets/TextWidgets/customeText.dart';

class TimeDisplay extends StatefulWidget {
  @override
  _TimeDisplayState createState() => _TimeDisplayState();
}

class _TimeDisplayState extends State<TimeDisplay> {
  late String _currentTime;
  late String _currentData;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _updateTime();
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      _updateTime();
    });
  }

  void _updateTime() {
    setState(() {
      DateTime now = DateTime.now();
      var formattedTime = DateFormat('hh:mm:ss a').format(now);
      var formattedDate = DateFormat('dd-MMM-yyyy EEEE').format(now);
      _currentTime = formattedTime;
      _currentData = formattedDate;
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the widget is disposed.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      width: double.infinity,
      shadowColor: spbgColor,
      elevation: 2,
      child: Row(
        spacing: 20,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// Clock Widgets (Custom Container)
          CustomContainer(
            borderRadius: BorderRadius.circular(100),
            height: 80,
            width: 80,
            outColor: spbgColor,
            innerColor: spbgColor,
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                clockImg,
                fit: BoxFit.contain,
                color: whiteColor,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Time Text
              Custometext(
                textStyle: fontsValue.fontstyleAboreto(
                    fontSize: xlLarge, fontWeight: FontWeight.w600),
                textName: _currentTime,
              ),

              ///Indian Standard Time TExt
              Custometext(
                textStyle: fontsValue.fontstyleAboreto(
                    fontSize: small, fontWeight: FontWeight.w500),
                textName: timeStandard,
              ),

              /// Date Text
              Custometext(
                textStyle: fontsValue.fontstyleAboreto(
                  fontColor: spbgColor,
                    fontSize: large, fontWeight: FontWeight.w500),
                textName: _currentData,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
