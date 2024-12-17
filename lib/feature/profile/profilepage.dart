import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:messmate_user/main.dart';

import '../../core/constants/colorconstant.dart';
import '../../core/constants/imageconstant.dart';
import '../../core/localvariables.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      // appBar: AppBar(
      //   backgroundColor: ColorConstant.whiteColor,
      //   centerTitle: true,
      //   title: const Text(
      //     "Profile",
      //     style: TextStyle(fontWeight: FontWeight.bold),
      //   ),
      // ),
      body: Padding(
        padding: EdgeInsets.all(width * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Profile",
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w800, fontSize: width * 0.06),
            ),
            Container(
              height: height * 0.3,
              width: width,
              decoration: BoxDecoration(
                color: ColorConstant.whiteColor,
                borderRadius: BorderRadius.circular(width * 0.02),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 4,
                      spreadRadius: 2,
                      offset: Offset(4, 4))
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.topRight,
                        child: SvgPicture.asset(SvgConstants.editProfile)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              radius: width * 0.17,
                              backgroundImage:
                                  const AssetImage(ImageConstant.profile),
                            ),
                            SizedBox(
                                height: height * 0.16,
                                width: width * 0.32,
                                child: Align(
                                    alignment: Alignment.bottomRight,
                                    child:
                                        SvgPicture.asset(SvgConstants.camera)))
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Alexa",
                              style: GoogleFonts.montserrat(
                                  fontSize: width * 0.05,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "+93-53696246",
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff8A8585)),
                            ),
                            Text("village, Bangalore",
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff8A8585))),
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              "83 kg",
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "Height",
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff444444)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.07,
                          child: Container(
                            width: width * 0.002,
                            decoration: BoxDecoration(
                              color: ColorConstant.primaryColor,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  offset: Offset(2, 0),
                                  blurRadius: 3,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              "170 m",
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "Weight",
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff444444)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.07,
                          child: Container(
                            width: width * 0.002,
                            decoration: BoxDecoration(
                              color: ColorConstant.primaryColor,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  offset: Offset(2, 0),
                                  blurRadius: 3,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              "24",
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "BMI",
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff444444)),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      SvgConstants.activePlaneGreen,
                    ),
                    SizedBox(
                      width: width * 0.04,
                    ),
                    Text(
                      "Active plan",
                      style: GoogleFonts.montserrat(
                          fontSize: width * 0.045,
                          fontWeight: FontWeight.w600,
                          color: ColorConstant.primaryColor),
                    ),
                  ],
                ),
                SvgPicture.asset(
                  SvgConstants.openGreen,
                  height: height * 0.03,
                  width: width * 0.03,
                ),
              ],
            ),
            Divider(
              thickness: width * 0.001,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      SvgConstants.recent,
                    ),
                    SizedBox(
                      width: width * 0.04,
                    ),
                    Text(
                      "Recent consultations",
                      style: GoogleFonts.montserrat(
                          fontSize: width * 0.045,
                          fontWeight: FontWeight.w600,
                          color: ColorConstant.primaryColor),
                    ),
                  ],
                ),
                SvgPicture.asset(
                  SvgConstants.openGreen,
                  height: height * 0.03,
                  width: width * 0.03,
                ),
              ],
            ),
            Divider(
              thickness: width * 0.001,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      SvgConstants.reports,
                    ),
                    SizedBox(
                      width: width * 0.04,
                    ),
                    Text(
                      "Reports",
                      style: GoogleFonts.montserrat(
                          fontSize: width * 0.045,
                          fontWeight: FontWeight.w600,
                          color: ColorConstant.primaryColor),
                    ),
                  ],
                ),
                SvgPicture.asset(
                  SvgConstants.openGreen,
                  height: height * 0.03,
                  width: width * 0.03,
                ),
              ],
            ),
            Divider(
              thickness: width * 0.001,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      SvgConstants.address,
                    ),
                    SizedBox(
                      width: width * 0.04,
                    ),
                    Text(
                      "Saved address",
                      style: GoogleFonts.montserrat(
                          fontSize: width * 0.045,
                          fontWeight: FontWeight.w600,
                          color: ColorConstant.primaryColor),
                    ),
                  ],
                ),
                SvgPicture.asset(
                  SvgConstants.openGreen,
                  height: height * 0.03,
                  width: width * 0.03,
                ),
              ],
            ),
            Divider(
              thickness: width * 0.002,
              color: ColorConstant.primaryColor,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      SvgConstants.contactUs,
                    ),
                    SizedBox(
                      width: width * 0.04,
                    ),
                    Text(
                      "Contact us",
                      style: GoogleFonts.montserrat(
                          fontSize: width * 0.045, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SvgPicture.asset(
                  SvgConstants.openBlack,
                  height: height * 0.03,
                  width: width * 0.03,
                ),
              ],
            ),
            Divider(
              thickness: width * 0.001,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      SvgConstants.faq,
                    ),
                    SizedBox(
                      width: width * 0.04,
                    ),
                    Text(
                      "FAQ",
                      style: GoogleFonts.montserrat(
                          fontSize: width * 0.045, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SvgPicture.asset(
                  SvgConstants.openBlack,
                  height: height * 0.03,
                  width: width * 0.03,
                ),
              ],
            ),
            Divider(
              thickness: width * 0.001,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      SvgConstants.rating,
                    ),
                    SizedBox(
                      width: width * 0.04,
                    ),
                    Text(
                      "Rating",
                      style: GoogleFonts.montserrat(
                          fontSize: width * 0.045, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SvgPicture.asset(
                  SvgConstants.openBlack,
                  height: height * 0.03,
                  width: width * 0.03,
                ),
              ],
            ),
            Divider(
              thickness: width * 0.001,
            ),
            Row(
              children: [
                SvgPicture.asset(SvgConstants.logOut),
                SizedBox(
                  width: width * 0.03,
                ),
                Text(
                  "Logout",
                  style: GoogleFonts.montserrat(
                      fontSize: width * 0.04,
                      fontWeight: FontWeight.w700,
                      color: ColorConstant.primaryColor),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
