import 'package:flutter/material.dart';
import 'package:pigeon_loft/ConstFiles/ConstFiles.dart';
import 'package:pigeon_loft/widgets/AppBarWidgets/AppBarWidget.dart';
import 'package:pigeon_loft/widgets/DrawerWidget/DrawerWidgets.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: drawerKey,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: AppBarWidget(
          leadingWidget: IconButton(  onPressed:(){

            drawerKey.currentState!.openDrawer();
          },icon: Icon( Icons.arrow_back_ios)),
          textName: 'Dashboard',
        ),
      ),
     drawer: drawer(),
    );
  }
}
