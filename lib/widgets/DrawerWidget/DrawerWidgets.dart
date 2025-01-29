import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pigeon_loft/ConstFiles/ConstFiles.dart';
import 'package:pigeon_loft/Controller/drawerController.dart';
import 'package:pigeon_loft/untils/AuthUntils/Authuntil.dart';
import 'package:pigeon_loft/widgets/TextWidgets/customeText.dart';
import 'package:pigeon_loft/widgets/custtomIconButton/customIconButton.dart';

class drawer extends StatefulWidget {
  const drawer({super.key});

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {

  final drawercon=Get.put(drawerController(),tag: 'Drawer Widgets');
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: whiteCl,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              height: 150,
              color: Colors.green,
            ),

            Expanded(
              child: AnimatedList(
                shrinkWrap: true,
                initialItemCount: drawercon.menuList.length,
                itemBuilder: (context, index,animation) {
                  return

                    Material(
                      elevation: 5,
                      child: Container(
                        decoration: BoxDecoration(
                          border:
                        ),
                        child: ListTile(
                          tileColor:drawercon.selectIndex==index? spbgColor:whiteCl,
                          onTap: () {
                            setState(() {
                              drawercon.closeDrawer(Index: index);
                            });
                          },
                          leading: SizedBox(
                            height: 30,
                            width: 30,
                            child: custtomIconButton(
                              outterColor: drawercon.selectIndex==index?whiteCl:spbgColor,
                              icon: Icons.home,
                              iconColor: drawercon.selectIndex==index?spbgColor:whiteCl,
                            ),
                          ),
                          title: Custometext(
                            textStyle: fontsValue.fontstyleAboreto(
                              fontSize: small,
                              fontWeight: drawercon.selectIndex==index?FontWeight.w700:FontWeight.w500,
                              fontColor: drawercon.selectIndex==index? whiteCl:spbgColor
                            ),
                            textName: drawercon.menuList[index].itemName,
                          ),
                        ),
                      ),
                    );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
