import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pigeon_loft/ConstFiles/ConstFiles.dart';
import 'package:pigeon_loft/Controller/ProfileController.dart';
import 'package:pigeon_loft/untils/userReguntils/userReguntils.dart';
import 'package:pigeon_loft/widgets/AppBarWidgets/AppBarWidget.dart';
import 'package:pigeon_loft/widgets/CusttomButton/CustomButton.dart';
import 'package:pigeon_loft/widgets/TextWidgets/customeText.dart';
import 'package:pigeon_loft/widgets/custtomIconButton/customIconButton.dart';

class profileScreen extends StatefulWidget {
  const profileScreen({super.key});

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {

  final dataController = Get.put(ProfileController(), tag: 'profileController');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: AppBarWidget(
          leadingWidget: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: FaIcon(
              FontAwesomeIcons.arrowLeft,
              color: whiteColor,
            ),
          ),
          textName: 'Profile',
        ),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [


                /// userContainer Widgets
                GestureDetector(
                  onTap: () {
                    setState(() {
                      dataController.selectTypeFilePick(context: context);
                    });
                  },
                  child: SizedBox(
                    height: 135,
                    width: double.infinity,
                    /*      decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('https://t3.ftcdn.net/jpg/01/23/52/26/360_F_123522646_djOqVS9wzwPI9kYmORudBLioBbp6rczK.jpg'),
                        fit: BoxFit.cover
                      ),
                    ),*/
                    child: Column(
                      children: [

                        /// User Icon Widgets
                        Hero(
                          tag: 'Profile',
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Material(
                                elevation: 5,
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(100),
                                child: Obx(() {
                                  return CircleAvatar(
                                    foregroundImage: dataController.photo1.value == null
                                        ? AssetImage(userImg)
                                        : FileImage(dataController.photo1.value!) as ImageProvider,
                                    radius: 40,
                                  );
                                }),
                              ),
                              Material(
                                elevation: 5,
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white,
                                child: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: custtomIconButton(
                                    borderRadius: BorderRadius.circular(50),
                                    outterColor: Colors.white,
                                    icon: CupertinoIcons.pen,
                                    iconColor: spbgColor,
                                  ),
                                ),
                              )
                            ],
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
                ),


                /// UserName Controller field
                Container(
                  height: 80,
                  width: 380,
                  padding: EdgeInsets.only(
                    top: 8,
                    bottom: 10,
                    left: 8,
                  ),
                  child: TextField(
                    focusNode: dataController.nameFocus,
                    inputFormatters: [
                      UpperCaseTextFormatter()
                    ],
                    onTap: () {},
                    controller: dataController.userNameController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person, color: spbgColor,),
                      counterText: "",
                      labelText: "Name",
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: spbgColor, width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:
                        spbgColor, width: 1.5),
                      ),
                      labelStyle: fontsValue.fontstyleAboreto(
                          fontSize: small,
                          fontColor: spbgColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),


                /// User Phone Controller field  14 character
                IgnorePointer(
                  ignoring: true,
                  child: Container(
                    height: 80,
                    width: 380,
                    padding: EdgeInsets.only(
                      top: 8,
                      bottom: 10,
                      left: 8,
                    ),
                    child: TextField(
                      readOnly: true,
                      controller: dataController.phoneNoController,
                      keyboardType: TextInputType.number,
                      // maxLength: 10,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone, color: spbgColor,),
                        counterText: "",
                        labelText: "Phone Number",
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: spbgColor, width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:
                          spbgColor, width: 1.5),
                        ),
                        labelStyle: fontsValue.fontstyleAboreto(
                            fontSize: small,
                            fontColor: spbgColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),

                /// Button
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Material(
                    borderRadius: BorderRadius.circular(50),
                    color: spbgColor,
                    elevation: 5,
                    child: Button(
                      clickfunction: () {

                      },
                      buttonColor: spbgColor,
                      buttonElevation: 10,
                      buttonHeight: 50,
                      buttonradius: BorderRadius.circular(50),
                      buttonShadowColor: Colors.black12,
                      buttonwidth: 380,
                      child: Center(
                          child: Custometext(
                            textName: submit,
                            textStyle: fontsValue.fontstyleAboreto(
                                fontColor: Colors.white,
                                fontSize: small,
                                fontWeight: FontWeight.w600),
                          )),
                    ),
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
