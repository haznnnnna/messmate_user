
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constants/colorconstant.dart';
import '../../core/constants/imageconstant.dart';
import '../../core/localvariables.dart';


class Goal extends StatefulWidget {
  const Goal({super.key});

  @override
  State<Goal> createState() => _GoalState();
}

class _GoalState extends State<Goal> {
  int selectIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      appBar: AppBar(
        backgroundColor: ColorConstant.whiteColor,
        title: Text('Our experts',style: GoogleFonts.montserrat(
          fontWeight: FontWeight.w800,
          fontSize: 20,
          color: Color(0xff3F3D3D),
        ),),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(width*0.03),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectIndex=0;
                  });
                },
                child: Container(
                  height: height*0.23,
                  width: width*0.83,
                  decoration: BoxDecoration(
                      color: selectIndex==0?ColorConstant.primaryColor:ColorConstant.whiteColor,
                    borderRadius: BorderRadius.circular(width*0.02),
                      boxShadow: [
                  BoxShadow(
                  color: Color((0xff444444))
                      .withOpacity(0.2),
                // spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(4, 4))
                  ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(SvgConstants.doctor,
                        color:selectIndex==0? Color(0xffFFFFFF):Color(0xff40A94C),
                        height: height*0.09,),
                      SizedBox(height: height*0.02,),
                      Text('Doctor calogram',style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color:selectIndex==0? Color(0xffFFFFFF):Color(0xff40A94C),
                      ),)
                    ],
                  )
                ),
              ),
              SizedBox(height: height*0.03,),
              GestureDetector(
                onTap: () {
                 setState(() {
                   selectIndex=1;
                 });
                },
                child: Container(
                  height: height*0.23,
                  width: width*0.83,
                  decoration: BoxDecoration(
                      color: selectIndex==1?ColorConstant.primaryColor:ColorConstant.whiteColor,
                      borderRadius: BorderRadius.circular(width*0.02),
                      boxShadow: [
                        BoxShadow(
                            color: Color((0xff444444))
                                .withOpacity(0.2),
                            blurRadius: 2,
                            offset: Offset(4, 4))
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(SvgConstants.nutri,
                        color:selectIndex==1? Color(0xffFFFFFF):Color(0xff40A94C),
                        height: height*0.09,),
                      SizedBox(height: height*0.02,),
                      Text('Nutritionist / Dietician',style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color:selectIndex==1? Color(0xffFFFFFF):Color(0xff40A94C),
                      ),)
                    ],
                  ),
                ),
              ),
              SizedBox(height: height*0.03,),
              GestureDetector(
                onTap: () {
                  setState(() {
                selectIndex=2;
                  });
                },
                child: Container(
                  height: height*0.23,
                  width: width*0.83,
                  decoration: BoxDecoration(
                      color: selectIndex==2?ColorConstant.primaryColor:ColorConstant.whiteColor,
                      borderRadius: BorderRadius.circular(width*0.02),
                      boxShadow: [
                        BoxShadow(
                            color: Color((0xff444444))
                                .withOpacity(0.2),
                            blurRadius: 2,
                            offset: Offset(4, 4))
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(SvgConstants.calo,
                        color:selectIndex==2? Color(0xffFFFFFF):Color(0xff40A94C),
                        height: height*0.09,),
                      SizedBox(height: height*0.02,),
                      Text('CaloFit-26',style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color:selectIndex==2? Color(0xffFFFFFF):Color(0xff40A94C),
                      ),)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
