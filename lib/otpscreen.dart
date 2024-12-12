import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:messmate_user/constants/colorconstant.dart';
import 'package:pinput/pinput.dart';

import 'main.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController pinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Align(
              alignment: AlignmentDirectional.topStart,
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome\nBack!",
                      style: TextStyle(
                          color: ColorConstant.primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: width * 0.1),
                    ),
                    const Text("Enter your OTP number send to ******86"),
                  ],
                ),
              ),
            ),
            Pinput(
              length: 4,
              // smsRetriever: ,
              controller: pinController,
              // focusNode: focusNode,
              // defaultPinTheme: defaultPinTheme,
              separatorBuilder: (index) => SizedBox(width: width * 0.03),
              // validator: (value) {
              //   return value == '2222' ? null : 'Pin is incorrect';
              // },
              onCompleted: (pin) {
                debugPrint('onCompleted: $pin');
              },
              onChanged: (value) {
                debugPrint('onChanged: $value');
              },
              cursor: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: width * 0.02),
                    width: width * 0.2,
                    height: height * 0.04,
                  ),
                ],
              ),
            ),
             SizedBox(
              child: Column(
                children: [
                  const Text(
                    "Resend OTP?",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                      decorationColor: ColorConstant.primaryColor,
                      color: ColorConstant.primaryColor,
                    ),
                  ),
                  SizedBox(height: height*0.02,),
                  const Text("Re enter number"),
                ],
              ),
            ),
            Container(
              height: height * 0.06,
              width: width * 0.7,
              decoration: BoxDecoration(
                  color: ColorConstant.primaryColor,
                  borderRadius: BorderRadius.circular(width * 0.09)),
              child: Center(
                  child: Text("Login",
                      style: GoogleFonts.montserrat(
                          color: ColorConstant.whiteColor,
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.bold))),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don’t have an account?"),
                Text(
                  " Sign up",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationColor: ColorConstant.primaryColor,
                      color: ColorConstant.primaryColor,
                      fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
