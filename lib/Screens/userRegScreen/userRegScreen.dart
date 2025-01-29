import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:pigeon_loft/ConstFiles/ConstFiles.dart';
import 'package:pigeon_loft/Screens/DashBoardScreen/DashBoardScreen.dart';
import 'package:pigeon_loft/untils/userReguntils/userReguntils.dart';
import 'package:pigeon_loft/widgets/AppBarWidgets/AppBarWidget.dart';
import 'package:pigeon_loft/widgets/CopyrightWidgets/CopyrightsWidget.dart';
import 'package:pigeon_loft/widgets/CusttomButton/CustomButton.dart';
import 'package:pigeon_loft/widgets/TextWidgets/customeText.dart';

class userRegScreen extends StatefulWidget {
  String phoneNumber;
  userRegScreen({required this.phoneNumber});

  @override
  State<userRegScreen> createState() => _userRegScreenState();
}

class _userRegScreenState extends State<userRegScreen> {


  TextEditingController userNameController=TextEditingController();
  TextEditingController PhoneNoController=TextEditingController();
  TextEditingController emailController=TextEditingController();

  @override
  void initState() {
    setState(() {
      PhoneNoController.text=widget.phoneNumber;
    });
    // TODO: implement initState
    super.initState();
  }

  FocusNode nameFocus=FocusNode();
  FocusNode emailFocus=FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: AppBarWidget(
          textName: 'Enter your Personal Details',
        ),
      ),
      
      body: Align(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 5,
          children: [

            /// Lottie File Person Icons
            SizedBox(
                height: 180,
                width: 250,
                child: Lottie.asset(PersonUrl,fit: BoxFit.fill)),

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
                focusNode: nameFocus,
                inputFormatters: [
                  UpperCaseTextFormatter()
                ],
                onTap: () {
                },
                onSubmitted: (value){
                  nameFocus.requestFocus(emailFocus);
                },
                controller: userNameController,
                decoration: InputDecoration(
                  prefixIcon:Icon(Icons.person,color: spbgColor,),
                  counterText: "",
                  labelText: "Name",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color:spbgColor, width: 2),
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
            Container(
              height: 80,
              width: 380,
              padding: EdgeInsets.only(
                top: 8,
                bottom: 10,
                left: 8,
              ),
              child: TextField(
                readOnly: true,
                inputFormatters: [
                  UpperCaseTextFormatter()
                ],
                onTap: () {
                },

                controller: PhoneNoController,
                keyboardType: TextInputType.number,
                maxLength: 10,
                decoration: InputDecoration(
                  prefixIcon:Icon(Icons.phone,color: spbgColor,),
                  counterText: "",
                  labelText: "Phone Number",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color:spbgColor, width: 2),
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


            /// Button
            Padding(
              padding: const EdgeInsets.only(top:20),
              child: Material(
                borderRadius: BorderRadius.circular(50),
                color: spbgColor,
                elevation: 5,
                child: Button(
                  clickfunction: () {
                    Get.off(DashBoardScreen(),transition: Transition.cupertino,curve: Curves.easeInOut);
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
        bottomNavigationBar:CopyRights(copyRightText: "CopyRights @ 2025",)
    );
  }
}
