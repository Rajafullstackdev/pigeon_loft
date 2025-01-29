import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dialog.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:phone_number_hint/phone_number_hint.dart';
import 'package:pigeon_loft/ConstFiles/ConstFiles.dart';
import 'package:pigeon_loft/Screens/AnthendicationScreen/OtpScreen.dart';
import 'package:pigeon_loft/untils/AuthUntils/Authuntil.dart';
import 'package:pigeon_loft/widgets/AppBarWidgets/AppBarWidget.dart';
import 'package:pigeon_loft/widgets/CopyrightWidgets/CopyrightsWidget.dart';
import 'package:pigeon_loft/widgets/CustomButton.dart';
import 'package:pigeon_loft/widgets/TextWidgets/customeText.dart';

class AnthendicationScreen extends StatefulWidget {
  const AnthendicationScreen({super.key});

  @override
  State<AnthendicationScreen> createState() => _AnthendicationScreenState();
}

class _AnthendicationScreenState extends State<AnthendicationScreen> {


  Country _selectedDialogCountry = CountryPickerUtils.getCountryByPhoneCode('91');

  double rorateValue = 0;
  double ContaienrWidth = 1.5;

  TextEditingController PhoneNoController = TextEditingController();
  var focusNode = FocusNode();

  String _result = 'Unknown';
  final _phoneNumberHintPlugin = PhoneNumberHint();
  bool errorCheck=false;

  @override
  void initState() {
    getPhoneNumber();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                      setState(() {
                        rorateValue = rorateValue == 0 ? 1 / 2 : 0;
                        ContaienrWidth = ContaienrWidth == 1.5 ? 2.5 : 1.5;
                      });
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
                                      width: ContaienrWidth, color: spbgColor)),
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: Row(
                                  children: [
                                    _buildDialogItem(_selectedDialogCountry),
                                    AnimatedRotation(
                                      turns: rorateValue,
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.linear,
                                      child: Icon(
                                        Icons.arrow_drop_down,
                                        color: rorateValue != 0
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
                                width: 50,
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
                      focusNode: focusNode,
                      onTap: () {
                        //getPhoneNumber();
                      },
                      onChanged: (val){
                        setState(() {
                          errorCheck=false;
                        });
                      },
                      controller: PhoneNoController,
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      decoration: InputDecoration(
                        suffixIcon:errorCheck? Icon(Icons.error,color: errorColor,):null,
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
                  if(PhoneNoController.text.isNotEmpty && PhoneNoController.text.length==10){
                    setState(() {
                      errorCheck=false;
                    });
                    Get.off(OtpScreen(
                      phoneNumber: '+${_selectedDialogCountry.phoneCode}${PhoneNoController.text}',

                    ), transition: Transition.cupertino,curve: Curves.easeInOut);

                    hideKeyBoard(context);
                  }
                  else{
                    setState(() {
                      errorCheck=true;
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
            Text(
              hintText,
              style: fontsValue.fontstyleAboreto(
                  fontColor: greyColor,
                  fontWeight: FontWeight.w500,
                  fontSize: xlSmall),
            )
          ],
        ),
      ),
      

      bottomNavigationBar:CopyRights(copyRightText: "CopyRights @ 2025",)
    );
  }


  Future<void> getPhoneNumber() async {
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
  }

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
                  rorateValue = 0;
                  ContaienrWidth = 1.5;
                });
                focusNode.requestFocus();
              },
              itemBuilder: _buildDialogItem,
              priorityList: [
                CountryPickerUtils.getCountryByIsoCode('TR'),
                CountryPickerUtils.getCountryByIsoCode('US'),
              ],
            ),
          ));
}
