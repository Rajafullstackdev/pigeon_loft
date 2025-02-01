import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pigeon_loft/ConstFiles/ConstFiles.dart';
import 'package:pigeon_loft/Controller/dashBoardController.dart';
import 'package:pigeon_loft/Screens/PigeonInfo/PigeonInfo.dart';
import 'package:pigeon_loft/Screens/ProfileScreen/ProfileScreen.dart';
import 'package:pigeon_loft/Screens/widgets/ListViewBuilder/activeListBuilders.dart';
import 'package:pigeon_loft/Screens/widgets/SearchContainer/SearchContainer.dart';
import 'package:pigeon_loft/widgets/AppBarWidgets/AppBarWidget.dart';
import 'package:pigeon_loft/widgets/CustomContainer/CustomContainer.dart';
import 'package:pigeon_loft/widgets/DrawerWidget/DrawerWidgets.dart';
import 'package:pigeon_loft/widgets/MaterialWidgets/MaterialWidgets.dart';
import 'package:pigeon_loft/widgets/TextWidgets/customeText.dart';
import 'package:pigeon_loft/widgets/TimeDisplay/TimeDisplay.dart';




class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {

  final dashController=Get.put(dashBoardController(),tag:'dashBoardController');
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: drawerKey,
      appBar:
     PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: AppBarWidget(
          centerWidget: SearchContainer(),
          listWidget: [
            Padding(
              padding: const EdgeInsets.only(right: 15,),
              child: InkWell(
                borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    setState(() {
                      dashController.searchEnableFunc();
                    });
                  },
                  child: CustomContainer(
                    height: 40,
                    width: 40,
                    borderRadius: BorderRadius.circular(50),
                    child: Center(
                      child: AnimatedRotation(
                         turns: dashController.rorateValue,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.linear,
                        child: FaIcon(
                          dashController.searchEnable?
                          FontAwesomeIcons.x:FontAwesomeIcons.search,
                          color: spbgColor,
                          size: 16,
                        ),
                      ),
                    ),
                  )),
            )
          ],
          leadingWidget: IconButton(
            onPressed: () {
              drawerKey.currentState!.openDrawer();
            },
            icon: FaIcon(
              FontAwesomeIcons.bars,
              color: whiteColor,
            ),
          ),
          textName: '',

        ),
      ),
      drawer: drawer(),
      body: Padding(
        padding: const EdgeInsets.only(left: 15,right: 15,top: 10),
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            spacing: 6,
            children: [

              /// userContainer Widgets
              InkWell(
                onTap: (){
                 Get.to(profileScreen(),curve: Curves.linear,transition: Transition.native);
                },
                child: CustomContainer(
                  height: 75,
                  elevation: 5,
                  innerColor: whiteColor,
                  outColor: whiteColor,
                  shadowColor: spbgColor.withOpacity(0.4),
                  width: double.infinity,
                  child: Row(
                    spacing: 20,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      /// User Icon Widgets
                      Padding(
                        padding: const EdgeInsets.only(left: 75),
                        child: Hero(
                          tag: 'Profile',
                          child: MaterialWidgets(
                            elevation: 5,
                            materialColor: spbgColor,
                            borderRadius: BorderRadius.circular(100),
                            materialWidgets:
                            CustomContainer(
                              borderRadius: BorderRadius.circular(100),
                              height: 60,
                              width: 60,
                              outColor: spbgColor,
                              innerColor: spbgColor,
                              elevation: 10,
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Image.asset(
                                  userImg,
                                  fit: BoxFit.contain,
                                  color: whiteColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [


                          ///UserName widgets
                          Custometext(
                            textStyle: fontsValue.fontstyleAboreto(
                                fontSize: medium, fontWeight: FontWeight.w600),
                            textName: 'Admin',
                          ),

                          ///Phone Number widgets
                          Custometext(
                            textStyle: fontsValue.fontstyleAboreto(
                                fontSize: vSmall, fontWeight: FontWeight.w600),
                            textName: '+911234567890',
                          ),

                        ],
                      ),

                    ],
                  ),
                ),
              ),

              /// timer widgets
              TimeDisplay(),

              ///Birds Details Container

              GestureDetector(
                onTap: (){
                  Get.to(PigeonInfo(),transition: Transition.cupertino);
                },
                child: CustomContainer(
                  elevation: 5,
                  innerColor: whiteColor,
                  outColor: whiteColor,
                  shadowColor: spbgColor.withOpacity(0.4),

                  width: double.infinity,
                  height: 166,
                  borderRadius: BorderRadius.circular(5),
                  contentPadding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      ///Pigeon Data Container
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //  spacing: 2,
                        children: [

                          ///Pigeons Txt widgets(Title)
                          Container(
                            margin: EdgeInsets.only(left: 150),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: spbgColor,
                                        width: 1.5
                                    )
                                )
                            ),
                            child: Custometext(
                              textStyle: fontsValue.fontstyleAboreto(
                                  fontColor: spbgColor,
                                  fontSize: large, fontWeight: FontWeight.w600),
                              textName: 'Pigeons',
                            ),
                          ),

                          Custometext(
                            textStyle: fontsValue.fontstyleAboreto(
                                fontSize: small, fontWeight: FontWeight.w600),
                            textName: 'Total Pigeons - ${1}',
                          ),

                          Custometext(
                            textStyle: fontsValue.fontstyleAboreto(
                                fontSize: small, fontWeight: FontWeight.w600),
                            textName: 'Total Cocks - ${1}',
                          ),

                          Custometext(
                            textStyle: fontsValue.fontstyleAboreto(
                                fontSize: small, fontWeight: FontWeight.w600),
                            textName: 'Total Hens - ${1}',
                          ),

                          Custometext(
                            textStyle: fontsValue.fontstyleAboreto(
                                fontSize: small, fontWeight: FontWeight.w600),
                            textName: 'Total Young - ${1}',
                          ),

                          Custometext(
                            textStyle: fontsValue.fontstyleAboreto(
                                fontSize: small, fontWeight: FontWeight.w600),
                            textName: 'Total Alive Pigeons - ${1}',
                          ),

                        ],
                      ),

                      ///  pigeon Image widgets
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Image.asset(singleBird,height: 90,width: 100,fit: BoxFit.cover,),
                      )
                    ],
                  ),
                ),
              ),

              ///PairBirds Details Container
              CustomContainer(
                elevation: 5,
                innerColor: whiteColor,
                outColor: whiteColor,
                shadowColor: spbgColor.withOpacity(0.4),
                width: double.infinity,
                height: 166,
                contentPadding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    ///Pigeon Pair Data Container
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                     // spacing: 2,
                      children: [

                        ///PigeonsPair Txt widgets(Title)
                        Container(
                          margin: EdgeInsets.only(left: 160),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: spbgColor,
                                      width: 1.5
                                  )
                              )
                          ),
                          child: Custometext(
                            textStyle: fontsValue.fontstyleAboreto(
                                fontColor: spbgColor,
                                fontSize: large, fontWeight: FontWeight.w600),
                            textName: 'Pairs',
                          ),
                        ),

                        Custometext(
                          textStyle: fontsValue.fontstyleAboreto(
                              fontSize: small, fontWeight: FontWeight.w600),
                          textName: 'Total Pairs - ${1}',
                        ),

                        Custometext(
                          textStyle: fontsValue.fontstyleAboreto(
                              fontSize: small, fontWeight: FontWeight.w600),
                          textName: 'Total Activated - ${1}',
                        ),

                        Custometext(
                          textStyle: fontsValue.fontstyleAboreto(
                              fontSize: small, fontWeight: FontWeight.w600),
                          textName: 'Total Hatched - ${1}',
                        ),

                        Custometext(
                          textStyle: fontsValue.fontstyleAboreto(
                              fontSize: small, fontWeight: FontWeight.w600),
                          textName: 'Total Wear Ring - ${1}',
                        ),

                        Custometext(
                          textStyle: fontsValue.fontstyleAboreto(
                              fontSize: small, fontWeight: FontWeight.w600),
                          textName: 'Other Pairs - ${1}',
                        ),

                      ],
                    ),

                    ///  pigeon Image widgets
                    Image.asset(pairBird,height: 90,width: 120,fit: BoxFit.fill,),
                  ],
                ),
              ),

              /// Missing Pigeons and disease
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ///Missing Birds Details Container
                  CustomContainer(
                    elevation: 5,
                    innerColor: whiteColor,
                    outColor: whiteColor,
                    shadowColor: spbgColor.withOpacity(0.4),
                    width: 180,
                    height: 80,

                    contentPadding: EdgeInsets.all(10),
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 8,
                        children: [

                          ///PigeonsPair Txt widgets(Title)
                          Container
                            (
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: spbgColor,
                                        width: 1.5
                                    )
                                )
                            ),
                            child: Custometext(
                              textStyle: fontsValue.fontstyleAboreto(
                                fontColor: spbgColor,
                                  fontSize: medium, fontWeight: FontWeight.w600),
                              textName: 'Birds in Disease',
                            ),
                          ),

                          Center(
                            child: Custometext(
                              textStyle: fontsValue.fontstyleAboreto(
                                  fontSize: small, fontWeight: FontWeight.w600),
                              textName: '${1}-Pigeons',
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),

                  ///Disease Birds Details Container
                  CustomContainer(
                    width: 180,
                    height: 80,
                    elevation: 5,
                    innerColor: whiteColor,
                    outColor: whiteColor,
                    shadowColor: spbgColor.withOpacity(0.4),
                    contentPadding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 8,
                      children: [

                        ///Disease Birds Txt widgets(Title)
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: spbgColor,
                                      width: 1.5
                                  )
                              )
                          ),
                          child: Custometext(
                            textStyle: fontsValue.fontstyleAboreto(
                                fontColor: spbgColor,
                                fontSize: medium, fontWeight: FontWeight.w600),
                            textName: 'Missing Pigeons',
                          ),
                        ),

                        Center(
                          child: Custometext(
                            textStyle: fontsValue.fontstyleAboreto(
                                fontSize: small, fontWeight: FontWeight.w600),
                            textName: '${1}-Pigeons',
                          ),
                        ),



                      ],
                    ),
                  ),
                ],
              ),

              ///Active Race Text Widgets
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: spbgColor,
                            width: 1.5
                        )
                    )
                ),
                child: Custometext(
                  textStyle: fontsValue.fontstyleAboreto(
                      fontColor: spbgColor,
                      fontSize: medium, fontWeight: FontWeight.w600),
                  textName: 'Active Races',
                ),
              ),

              ///Active List ViewBuilder Widgets
              activeListBuilders()

            ],
          ),
        ),
      ),
    );
  }
}
