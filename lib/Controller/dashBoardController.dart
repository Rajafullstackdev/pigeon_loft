import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class dashBoardController extends GetxController{

  bool searchEnable=false;
  double rorateValue = 0;
  TextEditingController searchCon=TextEditingController();

 // List<> raceData=[];

  searchEnableFunc(){
    searchEnable=!searchEnable;
    searchEnable? searchCon.text:
    searchCon.clear();
    rorateValue = rorateValue == 0 ? 1 / 2 : 0;
    update();
  }

}