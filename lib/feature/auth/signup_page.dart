import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../constants/colorconstant.dart';
import '../main.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController phoneNumberController =TextEditingController();
  TextEditingController userNameController =TextEditingController();
  String? _selectedGender;
  bool touch = false;
  bool touch1 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(backgroundColor: ColorConstant.whiteColor,),

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
                   height: height * 0.12,
                   width: width * 0.9,
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text(
                         "Welcome",
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
                 SizedBox(
                   height: height * 0.2,
                   width: width * 1,
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       TextFormField(
                         controller: userNameController,
                         decoration: InputDecoration(
                           labelText: 'Username',
                           labelStyle: const TextStyle(
                               color: ColorConstant
                                   .primaryColor), // Default label color
                           enabledBorder: OutlineInputBorder(
                             borderSide: BorderSide(
                                 color: ColorConstant
                                     .primaryColor), // Unselected border
                             borderRadius: BorderRadius.circular(8.0),
                           ),
                           focusedBorder: OutlineInputBorder(
                             borderSide: BorderSide(
                                 color: Colors.green,
                                 width: 2.0), // Selected border
                             borderRadius: BorderRadius.circular(8.0),
                           ),
                         ),
                         style: const TextStyle(
                             color: Colors.black), // Text style
                         cursorColor: Colors.green, // Cursor color
                         onChanged: (value) {
                           print("Username: $value"); // Handle changes
                         },
                         validator: (value) {
                           if (value == null || value.isEmpty) {
                             return 'Please enter a username'; // Validation error message
                           }
                           return null;
                         },
                       ),
                       IntlPhoneField(
                         controller: phoneNumberController,
                         decoration: InputDecoration(
                           counterText: "",
                           labelText: 'Phone Number',
                           labelStyle: const TextStyle(
                               color: ColorConstant.primaryColor),
                           enabledBorder: OutlineInputBorder(
                             borderSide: const BorderSide(
                                 color: ColorConstant.primaryColor,
                                 width: 1.5),
                             borderRadius: BorderRadius.circular(8.0),
                           ),
                           border:
                           OutlineInputBorder(borderSide: BorderSide()),
                           focusedBorder: OutlineInputBorder(
                             borderSide: const BorderSide(
                                 color: ColorConstant.primaryColor,
                                 width: 2.0),
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
                     ],
                   ),
                 ),

                SizedBox(
                  height: height*0.21,
                  width: width*1,
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Gender",
                            style: TextStyle(
                                fontSize: width*0.04),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  Radio<String>(
                                    activeColor: ColorConstant.primaryColor,
                                    value: 'Female',
                                    groupValue: _selectedGender,
                                    onChanged: (String? value) {
                                      setState(() {
                                        _selectedGender = value;
                                      });
                                    },
                                  ),
                                  Text("Female"),
                                ],
                              ),
                              Row(
                                children: [
                                  Radio<String>(
                                    activeColor: ColorConstant.primaryColor,
                                    value: 'Male',
                                    groupValue: _selectedGender,
                                    onChanged: (String? value) {
                                      setState(() {
                                        _selectedGender = value;
                                      });
                                    },
                                  ),
                                  Text("Male"),
                                ],
                              ),
                              Row(
                                children: [
                                  Radio<String>(
                                    activeColor: ColorConstant.primaryColor,
                                    value: 'Others',
                                    groupValue: _selectedGender,
                                    onChanged: (String? value) {
                                      setState(() {
                                        _selectedGender = value;
                                      });
                                    },
                                  ),
                                  Text("Others"),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(children: [
                            Checkbox(
                              side: BorderSide(
                                width: width * 0.004,
                                color: ColorConstant.primaryColor,
                              ),
                              activeColor: ColorConstant.primaryColor,
                              focusColor: ColorConstant.primaryColor,
                              value: touch,
                              onChanged: (value) {
                                setState(() {
                                  touch = value!;
                                });
                              },
                            ),
                            Text(
                              "Remeber me",
                              style: GoogleFonts.montserrat(
                                  color: ColorConstant.primaryColor),
                            )
                          ]),
                          Row(children: [
                            Checkbox(
                              side: BorderSide(
                                  width: width * 0.004,
                                  color: ColorConstant.primaryColor),
                              activeColor: ColorConstant.primaryColor,
                              value: touch1,
                              onChanged: (value) {
                                setState(() {
                                  touch1 = value!;
                                });
                              },
                            ),
                            Text(
                              "Agree the terms & conditions",
                              style: GoogleFonts.montserrat(
                                color: ColorConstant.primaryColor,
                                decoration: TextDecoration.underline,
                                decorationColor: ColorConstant.primaryColor,
                              ),
                            )
                          ]),
                        ],
                      ),
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
                      child: Text("Next",
                          style: GoogleFonts.montserrat(
                              color: ColorConstant.whiteColor,
                              fontSize: width * 0.04,
                              fontWeight: FontWeight.bold))),
                ),
                SizedBox(
                  height: height * 0.04,
                  width: width * 0.64,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Already have an account?",
                        style: GoogleFonts.montserrat(
                          decorationColor: ColorConstant.primaryColor,
                        ),
                      ),
                      Text(
                        "Login",
                        style: GoogleFonts.montserrat(
                            decoration: TextDecoration.underline,
                            decorationColor: ColorConstant.primaryColor,
                            color: ColorConstant.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: width * 0.04),
                      )
                    ],
                  ),
                )
                ]),
          ),
        ),
      ),
    );
  }
}
