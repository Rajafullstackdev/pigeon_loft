import 'package:flutter/cupertino.dart';

class drawerMenu{
  String itemName;
  IconData itemIcon;
  int ?selectedIndex;
  drawerMenu({required this.itemIcon,required this.itemName,this.selectedIndex});
}