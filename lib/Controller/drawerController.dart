import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pigeon_loft/ConstFiles/ConstFiles.dart';
import 'package:pigeon_loft/Model/drawerModel.dart';

class drawerController extends GetxController {

  int selectIndex=0;
  /// Menu List Item
  List<drawerMenu> menuList = [
    drawerMenu(
      itemName: "DashBoard",
      itemIcon: Icons.home,
    ),
    drawerMenu(
      itemName: "My Pigeon",
      itemIcon: Icons.home,
    ),
    drawerMenu(
      itemName: "My Pairs",
      itemIcon: Icons.home,
    ),
    drawerMenu(
      itemName: "Race History",
      itemIcon: Icons.home,
    ),
    drawerMenu(
      itemName: "Problem And Treatment",
      itemIcon: Icons.home,
    ),
    drawerMenu(
      itemName: "Pedigree",
      itemIcon: Icons.home,
    ),
    drawerMenu(
      itemName: "Missing And Found",
      itemIcon: Icons.home,
    ),

    drawerMenu(
      itemName: "Calculate Velocity",
      itemIcon: Icons.home,
    ),

    drawerMenu(
      itemName: "My Race",
      itemIcon: Icons.home,
    ),

    drawerMenu(
      itemName: "My Clubs",
      itemIcon: Icons.home,
    ),

    drawerMenu(
      itemName: "Live Races",
      itemIcon: Icons.home,
    ),

    drawerMenu(
      itemName: "Notes",
      itemIcon: Icons.home,
    ),
    drawerMenu(
      itemName: "Settings",
      itemIcon: Icons.home,
    ),

    drawerMenu(
      itemName: "Purchase License",
      itemIcon: Icons.home,
    ),

    drawerMenu(
      itemName: "Contact us",
      itemIcon: Icons.home,
    ),
    drawerMenu(
      itemName: "Share",
      itemIcon: Icons.home,
    ),
  ];

  /// close the drawer and check index value

  closeDrawer( {Index}) {
   // drawerKey.currentState!.closeDrawer();
    selectIndex=Index;
    update();
  }
}
