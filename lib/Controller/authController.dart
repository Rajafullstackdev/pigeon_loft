
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:phone_number_hint/phone_number_hint.dart';

class authControll extends GetxController{



  double rorateValue = 0;
  double ContaienrWidth = 1.5;
  TextEditingController PhoneNoController = TextEditingController();
  var focusNode = FocusNode();
  String _result = 'Unknown';
  final _phoneNumberHintPlugin = PhoneNumberHint();
  bool errorCheck=false;


  Future<void> getPhoneNumber() async {
    String? result;
    try {
      result = await _phoneNumberHintPlugin.requestHint(
      ) ??
          '';
      String phoneNumber = result.substring(3);
      PhoneNoController.text= phoneNumber;
      update();
    } on PlatformException {
      result = 'Failed to get hint.';
    }
      _result = result ?? '';
      update();
  }



}