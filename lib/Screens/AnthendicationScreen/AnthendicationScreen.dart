import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dialog.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:pigeon_loft/ConstFiles/ConstFiles.dart';
import 'package:pigeon_loft/Controller/authController.dart';
import 'package:pigeon_loft/Screens/AnthendicationScreen/OtpScreen.dart';
import 'package:pigeon_loft/untils/AuthUntils/Authuntil.dart';
import 'package:pigeon_loft/widgets/AppBarWidgets/AppBarWidget.dart';
import 'package:pigeon_loft/widgets/CopyrightWidgets/CopyrightsWidget.dart';
import 'package:pigeon_loft/widgets/CusttomButton/CustomButton.dart';
import 'package:pigeon_loft/widgets/TextWidgets/customeText.dart';

class AnthendicationScreen extends StatefulWidget {
  const AnthendicationScreen({super.key});

  @override
  State<AnthendicationScreen> createState() => _AnthendicationScreenState();
}

class _AnthendicationScreenState extends State<AnthendicationScreen> {


  Country _selectedDialogCountry = CountryPickerUtils.getCountryByPhoneCode('91');
  final authCon=Get.put(authControll(),tag: 'AuthController');

  @override
  void initState() {
    authCon. getPhoneNumber();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
      GetBuilder<authControll>(
        init: authControll(),
        builder: (authCon) {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: PreferredSize(
              preferredSize: Size(double.infinity, 60),
              child: AppBarWidget(
                textName: 'Enter your phone number',
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                spacing: 20,
                children: [

                  Material(
                    elevation: 10,
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(200)),
                    color: spbgColor,
                    child: Container(
                      height: 340,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(200)),
                        color: spbgColor.withOpacity(0.6),
                      ),
                      child: Lottie.asset(lottieAnimation,fit: BoxFit.contain,),
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /// country code  controller

                        GestureDetector(
                          onTap: () {
                            _openCountryPickerDialog();

                            authCon.rorateValue = authCon.rorateValue == 0 ? 1 / 2 : 0;
                            authCon.ContaienrWidth = authCon.ContaienrWidth == 1.5 ? 2.5 : 1.5;

                          },
                          child: FittedBox(
                            fit: BoxFit.cover,
                            clipBehavior: Clip.antiAlias,
                            child: Stack(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(top: 13),
                                    height: 50,
                                    width: 110,
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        border: Border.all(
                                            width: authCon.ContaienrWidth, color: spbgColor)),
                                    child: FittedBox(
                                      fit: BoxFit.contain,
                                      child: Row(
                                        children: [
                                          _buildDialogItem(_selectedDialogCountry),
                                          AnimatedRotation(
                                            turns: authCon.rorateValue,
                                            duration: Duration(milliseconds: 300),
                                            curve: Curves.linear,
                                            child: Icon(
                                              Icons.arrow_drop_down,
                                              color: authCon.rorateValue != 0
                                                  ? spbgColor
                                                  : Colors.black,
                                            ),
                                          )
                                        ],
                                      ),
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 55, left: 15, top: 4),
                                  child: Container(
                                      height: 20,
                                      width: 55,
                                      decoration: BoxDecoration(color: Colors.white),
                                      child: Center(
                                        child: Text(
                                          "Country",
                                          style: fontsValue.fontstyleAboreto(
                                              fontSize: vSmall,
                                              fontWeight: FontWeight.w600,
                                              fontColor: spbgColor),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),

                        /// text field controller
                        Container(
                          height: 65,
                          width: 270,
                          padding: EdgeInsets.only(
                            top: 8,
                            bottom: 10,
                            left: 8,
                          ),
                          child: TextField(
                            focusNode: authCon.focusNode,
                            onTap: () {
                              //getPhoneNumber();
                            },
                            onChanged: (val){
                              setState(() {
                                authCon.errorCheck=false;
                              });
                            },
                            controller: authCon.PhoneNoController,
                            keyboardType: TextInputType.number,
                            maxLength: 15,
                            decoration: InputDecoration(
                              suffixIcon:authCon.errorCheck? Icon(Icons.error,color: errorColor,):null,
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
                      ],
                    ),
                  ),

                  /// Submitted Button
                  Material(
                    borderRadius: BorderRadius.circular(50),
                    color: spbgColor,
                    elevation: 5,
                    child: Button(
                      clickfunction: () {
                        if(authCon.PhoneNoController.text.isNotEmpty && authCon.PhoneNoController.text.length==10){
                          setState(() {
                            authCon. errorCheck=false;
                          });
                          Get.off(OtpScreen(
                            phoneNumber: '+${_selectedDialogCountry.phoneCode}${authCon.PhoneNoController.text}',

                          ), transition: Transition.cupertino,curve: Curves.easeInOut);

                          hideKeyBoard(context);
                        }
                        else{
                          setState(() {
                            authCon.errorCheck=true;
                          });
                          print('Controller is Empty');
                        }

                      },
                      buttonColor: spbgColor,
                      buttonElevation: 10,
                      buttonHeight: 50,
                      buttonradius: BorderRadius.circular(50),
                      buttonShadowColor: Colors.black12,
                      buttonwidth: 380,
                      child: Center(
                          child: Custometext(
                            textName: verify,
                            textStyle: fontsValue.fontstyleAboreto(
                                fontColor: Colors.white,
                                fontSize: small,
                                fontWeight: FontWeight.w600),
                          )),
                    ),
                  ),

                  /// hint Text
                  SizedBox(
                    width: 430,
                    child: Text(
                      hintText,
                      textAlign: TextAlign.center,
                      style: fontsValue.fontstyleAboreto(

                          fontColor: greyColor,
                          fontWeight: FontWeight.w500,
                          fontSize: vSmall),
                    ),
                  )
                ],
              ),
            ),


            bottomNavigationBar:CopyRights(copyRightText: "CopyRights @ 2025",)
        );
      },);
  }


/*  Future<void> getPhoneNumber() async {
    String? result;
    try {
      result = await _phoneNumberHintPlugin.requestHint(
      ) ??
          '';
      String phoneNumber = result.substring(3);
      PhoneNoController.text = phoneNumber;
    } on PlatformException {
      result = 'Failed to get hint.';
    }

    if (!mounted) return;

    setState(() {
      _result = result ?? '';
    });
  }*/

  Widget _buildDialogItem(Country country) => Row(
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          const SizedBox(width: 8.0),
          Text("+${country.phoneCode}"),
          const SizedBox(width: 5),
        ],
      );

  void _openCountryPickerDialog() => showDialog(
      context: context,
      builder: (cxt) => Theme(
            data: Theme.of(context).copyWith(primaryColor: Colors.pink),
            child: CountryPickerDialog(
              titlePadding: const EdgeInsets.all(8.0),
              searchCursorColor: Colors.pinkAccent,
              searchInputDecoration:
                  const InputDecoration(hintText: 'Search...'),
              isSearchable: true,
              title: const Text('Select your phone code'),
              onValuePicked: (Country country) {
                setState(() => _selectedDialogCountry = country);
                setState(() {
                  authCon.rorateValue = 0;
                  authCon.ContaienrWidth = 1.5;
                });
                authCon.focusNode.requestFocus();
              },
              itemBuilder: _buildDialogItem,
              priorityList: [
                CountryPickerUtils.getCountryByIsoCode('TR'),
                CountryPickerUtils.getCountryByIsoCode('US'),
              ],
            ),
          ));
}
