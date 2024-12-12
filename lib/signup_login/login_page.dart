import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:messmate_user/constants/colorconstant.dart';

import '../main.dart';

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome\nBack!",
            style: GoogleFonts.montserrat(
                fontSize: width * 0.1, color: ColorConstant.primaryColor,fontWeight: FontWeight.w600),
          ),
          Text(
            "Enter your Login details to get you",
            style: GoogleFonts.montserrat(color: ColorConstant.blackColor),
          ),
          IntlPhoneField(
            decoration: InputDecoration(
              labelText: 'Country Code',
              labelStyle: const TextStyle(color: ColorConstant.primaryColor),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: ColorConstant.primaryColor, width: 1.5),
                borderRadius: BorderRadius.circular(8.0),
              ),
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
          Container(
            height: height * 0.06,
            width: width * 0.7,
            decoration: BoxDecoration(
                color: ColorConstant.primaryColor,
                borderRadius: BorderRadius.circular(width * 0.09)),
            child: Center(
                child: Text("Next",
                    style: GoogleFonts.montserrat(
                        color: ColorConstant.whiteColor,
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.bold))),
          ),
          Column(
            children: [
              Text("Or login with")
            ],
          )
        ],
      ),
    );
  }
}
