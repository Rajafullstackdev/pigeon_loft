import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class userRegisterController extends GetxController{

  TextEditingController userNameController=TextEditingController();
  TextEditingController phoneNoController=TextEditingController();



  FocusNode nameFocus=FocusNode();
  FocusNode emailFocus=FocusNode();
}