import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pigeon_loft/ConstFiles/ConstFiles.dart';
import 'package:pigeon_loft/tesingScreen/demoScrren.dart';
import 'package:pigeon_loft/untils/AuthUntils/Authuntil.dart';
import 'package:pigeon_loft/widgets/AppBarWidgets/AppBarWidget.dart';
import 'package:pigeon_loft/widgets/CustomContainer/CustomContainer.dart';
import 'package:pigeon_loft/widgets/DrawerWidget/DrawerWidgets.dart';
import 'package:pigeon_loft/widgets/TextWidgets/customeText.dart';
import 'package:pigeon_loft/widgets/TimeDisplay/TimeDisplay.dart';

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
          listWidget: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: InkWell(
                  onTap: () {
                    print('search');
                  },
                  child: CircleAvatar(
                      radius: 18,
                      child: FaIcon(
                        FontAwesomeIcons.search,
                        color: spbgColor,
                        size: 18,
                      ))),
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
          textName: 'Dashboard',
        ),
      ),
      drawer: drawer(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            spacing: 10,
            children: [

              /// userContainer Widgets
              SizedBox(
                height: 130,
                child: Column(
                  children: [

                    /// User Icon Widgets
                    CustomContainer(
                      borderRadius: BorderRadius.circular(100),
                      height: 80,
                      width: 80,
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

                    ///UserName widgets
                    Custometext(
                      textStyle: fontsValue.fontstyleAboreto(
                          fontSize: xlLarge, fontWeight: FontWeight.w600),
                      textName: 'Admin',
                    ),

                    ///Phone Number widgets
                    Custometext(
                      textStyle: fontsValue.fontstyleAboreto(
                          fontSize: small, fontWeight: FontWeight.w600),
                      textName: '+911234567890',
                    ),


                  ],
                ),
              ),

              /// timer widgets
              TimeDisplay(),

              ///Birds Details Container
              CustomContainer(
                  shadowColor: spbgColor,
                  width: double.infinity,
                  height: 170,
                  elevation: 2,
                  contentPadding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      ///Pigeon Data Container
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 5,
                        children: [

                          ///Pigeons Txt widgets(Title)
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
                        child: Image.asset(singleBird,height: 100,width: 100,),
                      )
                    ],
                  ),
                ),

              ///PairBirds Details Container
              CustomContainer(
                shadowColor: spbgColor,
                width: double.infinity,
                height: 170,
                elevation: 2,
                contentPadding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    ///Pigeon Pair Data Container
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 5,
                      children: [

                        ///PigeonsPair Txt widgets(Title)
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
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Image.asset(pairBird,height: 120,width: 120,fit: BoxFit.contain,),
                    )
                  ],
                ),
              ),


              /// Missing Pigeons and disease
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ///Missing Birds Details Container
                  CustomContainer(
                    shadowColor: spbgColor,
                    width: 180,
                    height: 80,
                    elevation: 2,
                    contentPadding: EdgeInsets.all(10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 10,
                        children: [

                          ///PigeonsPair Txt widgets(Title)
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
                                  fontSize: large, fontWeight: FontWeight.w600),
                              textName: 'Birds in Disease',
                            ),
                          ),

                          Custometext(
                            textStyle: fontsValue.fontstyleAboreto(
                                fontSize: small, fontWeight: FontWeight.w600),
                            textName: '${1}-Pigeons',
                          ),

                        ],
                      ),
                    ),
                  ),

                  ///Disease Birds Details Container
                  CustomContainer(
                    shadowColor: spbgColor,
                    width: 180,
                    height: 80,
                    elevation: 2,

                    contentPadding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 10,
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
                                fontSize: large, fontWeight: FontWeight.w600),
                            textName: 'Missing Pigeons',
                          ),
                        ),

                        Custometext(
                          textStyle: fontsValue.fontstyleAboreto(
                              fontSize: small, fontWeight: FontWeight.w600),
                          textName: '${1}-Pigeons',
                        ),



                      ],
                    ),
                  ),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
