import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pigeon_loft/ConstFiles/ConstFiles.dart';
import 'package:pigeon_loft/Controller/dashBoardController.dart';
import 'package:pigeon_loft/widgets/CustomContainer/CustomContainer.dart';
import 'package:pigeon_loft/widgets/TextWidgets/customeText.dart';
import 'package:pigeon_loft/widgets/custtomIconButton/customIconButton.dart';

class activeListBuilders extends StatefulWidget {
  const activeListBuilders({super.key});

  @override
  State<activeListBuilders> createState() => _activeListBuildersState();
}

class _activeListBuildersState extends State<activeListBuilders> {

  final dashController=Get.put(dashBoardController(),tag:'dashBoardController');
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 7,
      itemBuilder: (context, index) {

      /*  if(dashController.searchCon.text.contains()){

        }*/
        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: CustomContainer(
            elevation: 5,
            innerColor: whiteColor,
            outColor: whiteColor,
          //borderContent: Border.all(color: spbgColor, width: 1.5),
            shadowColor: spbgColor.withOpacity(0.4),
            height: 110,
            child: Row(
              spacing: 15,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                ///data and caller widgets
                Container(
                  width: 110,
                  //margin: EdgeInsets.all(5),
                 padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: spbgColor,
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    spacing: 1,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ///IconsWidgets
                      custtomIconButton(
                        iconColor: Colors.red,
                        icon: CupertinoIcons.calendar,
                      ),

                      /// Date Widgets
                      Custometext(
                        textName: '31',
                        textStyle: fontsValue.fontstyleAboreto(
                          fontWeight: FontWeight.w600,
                          fontColor: whiteColor,
                          fontSize: medium,
                        ),
                      ),

                      /// Day Widgets
                      Custometext(
                        textName: 'Fri',
                        textStyle: fontsValue.fontstyleAboreto(
                          fontWeight: FontWeight.w600,
                          fontColor: whiteColor,
                          fontSize: vSmall,
                        ),
                      ),

                      /// Day with year Widgets
                      Custometext(
                        textName: 'Jan,2025',
                        textStyle: fontsValue.fontstyleAboreto(
                          fontWeight: FontWeight.w600,
                          fontColor: whiteColor,
                          fontSize: vSmall,
                        ),
                      )
                    ],
                  ),
                ),

                ///Race Widgets
                SizedBox(
                  width: 240,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 4,
                    children: [
                      /// Date Widgets
                      Custometext(
                        textName: '250Gps',
                        textStyle: fontsValue.fontstyleAboreto(
                          fontWeight: FontWeight.w600,
                          boxshowEnable: false,
                          fontColor: spbgColor,
                          fontSize: medium,
                        ),
                      ),

                      /// location and text Widgets
                      Row(
                        spacing: 15,
                        children: [
                          custtomIconButton(
                              icon: CupertinoIcons.location_solid),
                          Custometext(
                            textName: 'BAS MA LOOK',
                            textStyle: fontsValue.fontstyleAboreto(
                              fontWeight: FontWeight.w600,
                              fontSize: vSmall,
                            ),
                          ),
                        ],
                      ),

                      /// location and text Widgets
                      Row(
                        spacing: 15,
                        children: [
                          custtomIconButton(icon: CupertinoIcons.home),
                          Custometext(
                            textName: 'Club: IRPCP',
                            textStyle: fontsValue.fontstyleAboreto(
                              fontWeight: FontWeight.w600,
                              fontSize: vSmall,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        );
      },
    );
  }
}
