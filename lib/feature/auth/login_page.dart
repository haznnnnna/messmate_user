import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:messmate_user/feature/auth/otpscreen.dart';
import 'package:messmate_user/feature/auth/signup_page.dart';

import '../../core/constants/colorconstant.dart';
import '../../core/localvariables.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneNumController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: SizedBox(
            height: height * 1,
            width: width * 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * 0.18,
                  width: width * 0.9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Welcome\nBack!",
                        style: GoogleFonts.montserrat(
                            fontSize: width * 0.1,
                            color: ColorConstant.primaryColor,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Enter your Login details to get you",
                        style: GoogleFonts.montserrat(
                            color: ColorConstant.blackColor),
                      ),
                    ],
                  ),
                ),
                IntlPhoneField(
                  decoration: InputDecoration(
                    counterText: "",
                    labelText: 'Phone number',
                    labelStyle:
                        const TextStyle(color: ColorConstant.primaryColor),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: ColorConstant.primaryColor, width: 1.5),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: ColorConstant.primaryColor, width: 2.0),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  dropdownIcon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.grey,
                  ),
                  initialCountryCode: 'IN', // Default country
                  onChanged: (phone) {
                    print('Phone number: ${phone.completeNumber}');
                  },
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OtpScreen(),
                        ));
                  },
                  child: Container(
                    height: height * 0.06,
                    width: width * 0.7,
                    decoration: BoxDecoration(
                        color: ColorConstant.primaryColor,
                        borderRadius: BorderRadius.circular(width * 0.09)),
                    child: Center(
                      child: Text(
                        "Next",
                        style: GoogleFonts.montserrat(
                            color: ColorConstant.whiteColor,
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.11,
                  width: width * 0.4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Or login with",
                        style: GoogleFonts.montserrat(color: Colors.grey),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {

                            },
                            child: Container(
                              height: height * 0.05,
                              width: width * 0.1,
                              decoration: BoxDecoration(
                                  color: ColorConstant.whiteColor,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.shade200,
                                        offset: Offset(0, 2),
                                        spreadRadius: 2,
                                        blurRadius: 1)
                                  ]),
                              child: Center(
                                child:
                                    Image.asset("assets/images/GoogleLogo.png"),
                              ),
                            ),
                          ),
                          Container(
                            height: height * 0.05,
                            width: width * 0.1,
                            decoration: BoxDecoration(
                                color: ColorConstant.whiteColor,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade200,
                                      offset: Offset(0, 2),
                                      spreadRadius: 2,
                                      blurRadius: 1)
                                ]),
                            child: Center(
                              child: Image.asset("assets/images/iosLogo.png"),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.04,
                  width: width * 0.68,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Dont't have an account?",
                        style: GoogleFonts.montserrat(),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignupPage(),
                              ));
                        },
                        child: Text(
                          "Sign up",
                          style: GoogleFonts.montserrat(
                              color: ColorConstant.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: width * 0.04),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
