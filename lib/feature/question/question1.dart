import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:messmate_user/feature/question/question2.dart';

import '../../core/constants/colorconstant.dart';
import '../../core/constants/imageconstant.dart';
import '../../core/localvariables.dart';


class Question1 extends StatefulWidget {
  const Question1({super.key});

  @override
  State<Question1> createState() => _Question1State();
}

class _Question1State extends State<Question1> {
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
            child: Text('1/2',style: GoogleFonts.montserrat(
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
              SvgPicture.asset(SvgConstants.q1Chicken,
                height: height*0.14,
              ),
              SizedBox(height: height*0.02,),
              Text('Questions 1',style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.w700
              ),),
              SizedBox(height: height*0.006,),
              Text('Select your Food type',style: GoogleFonts.montserrat(
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
                          SvgPicture.asset(SvgConstants.nonVeg),
                          SizedBox(height: height*0.01,),
                          Text('Non-veg',style: GoogleFonts.montserrat(
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
                          SvgPicture.asset(SvgConstants.veg),
                          SizedBox(height: height*0.01,),
                          Text('Veg',style: GoogleFonts.montserrat(
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
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Question2(),));
                    },
                    child: Container(
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
                    ),
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
