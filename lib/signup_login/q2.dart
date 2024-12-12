import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:messmate_user/constants/colorconstant.dart';
import 'package:messmate_user/constants/imageconstant.dart';

import '../main.dart';

class Q2 extends StatefulWidget {
  const Q2({super.key});

  @override
  State<Q2> createState() => _Q2State();
}

class _Q2State extends State<Q2> {
  bool change=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      appBar: AppBar(
          backgroundColor: ColorConstant.whiteColor,
          actions: [
            Padding(
              padding:  EdgeInsets.all(width*0.04),
              child: Text('2/2',style: GoogleFonts.montserrat(
                color: ColorConstant.primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
              ),
            ),
          ]
      ),
      body: Padding(
        padding:  EdgeInsets.all(width*0.06),
        child: Center(
          child: Column(
            children: [
              SvgPicture.asset(SvgConstants.q2Chicken,
                height: height*0.13,
              ),
              SizedBox(height: height*0.02,),
              Text('Questions 2',style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w700
              ),),
              SizedBox(height: height*0.006,),
              Text('Select your meal preference',style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w500
              ),),
              SizedBox(height: height*0.06,),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        change=true;
                      });
                    },
                    child: Container(
                      height: height*0.2,
                      width: width*0.41,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: ColorConstant.primaryColor
                          ),
                          color: change?ColorConstant.skyBlue:ColorConstant.lightBlue,
                          borderRadius: BorderRadius.circular(width*0.07)
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(SvgConstants.lunch),
                            SizedBox(height: height*0.01,),
                            Text('lunch',style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500,
                                fontSize: 15
                            ),)
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: width*0.05,),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        change=false;
                      });
                    },
                    child: Container(
                      height: height*0.2,
                      width: width*0.41,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: ColorConstant.primaryColor
                          ),
                          color: change?ColorConstant.lightBlue:ColorConstant.skyBlue,
                          borderRadius: BorderRadius.circular(width*0.07)
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(SvgConstants.dinner),
                            SizedBox(height: height*0.01,),
                            Text('Dinner',style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500,
                                fontSize: 15
                            ),)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height*0.26,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Icon(Icons.arrow_back_ios_sharp,color: ColorConstant.primaryColor,),
                  Text('Back',style: GoogleFonts.montserrat(fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: ColorConstant.primaryColor),),
                  Container(
                    height: height*0.052,
                    width: width*0.3,
                    decoration: BoxDecoration(
                        color: ColorConstant.primaryColor,
                        borderRadius: BorderRadius.circular(width*0.06)
                    ),
                    child: Center(child: Text('Next',style: GoogleFonts.montserrat(
                        color: ColorConstant.whiteColor,
                        fontWeight: FontWeight.w700
                    ),)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
