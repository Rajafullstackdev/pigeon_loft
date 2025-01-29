import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pigeon_loft/ConstFiles/ConstFiles.dart';
import 'package:pigeon_loft/Screens/userRegScreen/userRegScreen.dart';
import 'package:pigeon_loft/untils/AuthUntils/Otpuntils.dart';
import 'package:pigeon_loft/widgets/AppBarWidgets/AppBarWidget.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:pigeon_loft/widgets/CopyrightWidgets/CopyrightsWidget.dart';
import 'package:pigeon_loft/widgets/CustomButton.dart';
import 'package:pigeon_loft/widgets/FontWidgets/FontWidget.dart';
import 'package:pigeon_loft/widgets/TextWidgets/customeText.dart';
import 'package:pinput/pinput.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class OtpScreen extends StatefulWidget {
  String phoneNumber;
  OtpScreen({required this.phoneNumber});


  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {

  OtpFieldController otpController = OtpFieldController();


  @override
  void initState() {
    // TODO: implement initState
  //  _verifyphone();
    super.initState();
  }
  var _verificationCode;
  var PinValue;

  _verifyphone()async{
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: widget.phoneNumber ,
        verificationCompleted:(PhoneAuthCredential credential)async{
          await FirebaseAuth.instance.signInWithCredential(credential).then((value)async{
            if(value.user!=null){
              Get.off(userRegScreen(phoneNumber: widget.phoneNumber,
              ),transition: Transition.cupertino,curve: Curves.easeInOut);
            }
          });
        },
        verificationFailed:(FirebaseAuthException e){
        } ,
        codeSent:(String ?verificationId ,int ?resendToken ){
          setState(() {
            _verificationCode=verificationId;
          });
        },
        codeAutoRetrievalTimeout:( String verificationId){
          setState(() {
            _verificationCode=verificationId;
          });
        },timeout: const Duration(seconds: 120) );

    //location  function
    //check();

  }
  FontsClass fontsValue = FontsClass();
  @override
  Widget build(BuildContext context) {

    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: AppBarWidget(
          textName: 'Enter your OTP number',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          spacing: 40,
          children: [
        
            /// Image container
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
        
        
            Custometext(
              textName: 'Your Phone Number is : ${widget.phoneNumber}',
              textStyle: fontsValue.fontstyleAboreto(
                fontWeight: FontWeight.w600,
                fontSize: small,
                fontColor: spbgColor,
              ),
            ),
        
            ///PinPUt TextField
        
            Pinput(
              isCursorAnimationEnabled: true,
              pinContentAlignment: Alignment.center,
              animationDuration: Duration(microseconds:300),
              animationCurve: Curves.easeIn,
              length: 6,
        
              closeKeyboardWhenCompleted: true,
              autofocus: true,
              pinAnimationType: PinAnimationType.scale,
              keyboardAppearance:Brightness.dark,
              onCompleted: (value){
                setState(() {
                  PinValue=value;
                });
        
                Get.off(userRegScreen(phoneNumber: widget.phoneNumber,
                ),transition: Transition.cupertino,curve: Curves.easeInOut);
                print(PinValue);
              },
              onSubmitted: (value){
                setState(() {
                  PinValue=value;
                });
                Get.off(userRegScreen(phoneNumber: widget.phoneNumber,
                ),transition: Transition.cupertino,curve: Curves.easeInOut);
                print(PinValue);
              },
        
            ),
        
        
            /// Submitted Button
            Material(
              borderRadius: BorderRadius.circular(50),
              color: spbgColor,
              elevation: 5,
              child: Button(
                clickfunction: () {
        
                  Get.off(userRegScreen(phoneNumber: widget.phoneNumber,
                  ),transition: Transition.cupertino,curve: Curves.easeInOut);
        
                },
                buttonColor: spbgColor,
                buttonElevation: 10,
                buttonHeight: 50,
                buttonradius: BorderRadius.circular(50),
                buttonShadowColor: Colors.black12,
                buttonwidth: 380,
                child: Center(
                    child: Custometext(
                      textName: otpVerify,
                      textStyle: fontsValue.fontstyleAboreto(
                          fontColor: Colors.white,
                          fontSize: small,
                          fontWeight: FontWeight.w600),
                    )),
              ),
            ),
        
            //  Text(widget.phoneNumber.toString())
        
          ],
        ),
      ),
        bottomNavigationBar:CopyRights(copyRightText: "CopyRights @ 2025",)
    );
  }
}
