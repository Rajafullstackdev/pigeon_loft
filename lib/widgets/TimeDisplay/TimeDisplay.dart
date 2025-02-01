import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pigeon_loft/ConstFiles/ConstFiles.dart';
import 'package:pigeon_loft/widgets/CustomContainer/CustomContainer.dart';
import 'package:pigeon_loft/widgets/MaterialWidgets/MaterialWidgets.dart';
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
      height: 75,
      elevation: 5,
      innerColor: whiteColor,
      outColor: whiteColor,
      shadowColor: spbgColor.withOpacity(0.4),
      width: double.infinity,
      child: Row(
        spacing: 20,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// Clock Widgets (Custom Container)
          MaterialWidgets(
            elevation: 10,
            materialColor: whiteColor,
            borderRadius: BorderRadius.circular(100),
            materialWidgets: CustomContainer(
              borderRadius: BorderRadius.circular(100),
              height: 60,
              width: 60,
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
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Time Text
              Custometext(
                textStyle: fontsValue.fontstyleAboreto(
                    fontSize: large, fontWeight: FontWeight.w600),
                textName: _currentTime,
              ),

              ///Indian Standard Time TExt
              Custometext(
                textStyle: fontsValue.fontstyleAboreto(
                    fontSize: vSmall, fontWeight: FontWeight.w500),
                textName: timeStandard,
              ),

              /// Date Text
              Custometext(
                textStyle: fontsValue.fontstyleAboreto(
                    fontColor: spbgColor,
                    fontSize: small, fontWeight: FontWeight.w500),
                textName: _currentData,
              ),

            ],
          ),
        ],
      ),
    );
  }
}
