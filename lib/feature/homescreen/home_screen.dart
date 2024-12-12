import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:messmate_user/core/constants/colorconstant.dart';
import 'package:messmate_user/core/constants/imageconstant.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/localvariables.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectIndex=0;
  List meals=[
    {
      'image':'assets/images/meal1.png',
      'title':'Steak'
    },
    {
      'image':'assets/images/meal1.png',
      'title':'Steak'
    },
    {
      'image':'assets/images/meal1.png',
      'title':'Steak'
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      appBar: AppBar(
        backgroundColor: ColorConstant.whiteColor,
        title: Padding(
          padding: EdgeInsets.all(width*0.03),
          child: Text('Good morning\nAlexa',style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color:ColorConstant.blackColor
          ),),
        ),
        actions: [
          SvgPicture.asset(SvgConstants.notification,),
          SizedBox(width: width*0.004,),
          Padding(
            padding: EdgeInsets.all(width*0.04),
            child: SvgPicture.asset(SvgConstants.activePlan,),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            CarouselSlider.builder(
              itemCount: 3,
              options:CarouselOptions(
                autoPlay: true,
                autoPlayAnimationDuration: Duration(
                    seconds: 1
                ),
                viewportFraction: 0.9,
                aspectRatio: 16 / 9,
                height: height*0.24,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    selectIndex=index;
                  });
                },
              ) ,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return Container(
                  height: height*0.2,
                  width: width*1,
                  margin: EdgeInsets.all(width*0.01),
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(ImageConstant.carouselImage),
                    fit: BoxFit.fill),
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(width*0.02),
                      boxShadow: [
                        BoxShadow(
                            color: Color((0xff444444))
                                .withOpacity(0.23),
                            // spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(4, 4))
                      ]
                  ),
                );
              },),
            SizedBox(height: height*0.02,
            ),
            AnimatedSmoothIndicator(
              activeIndex: selectIndex,
              count: 3,
              effect: ScaleEffect(
                  activeDotColor:ColorConstant.primaryColor,
                  dotColor: ColorConstant.indicatorColor.withOpacity(0.3),
                  dotHeight: height*0.011,
                  dotWidth: width*0.02
              ),
            ),
            Padding(
              padding:  EdgeInsets.all(width*0.05),
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: Text('ONE DAY MEAL',
                    style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color:ColorConstant.blackColor
                ),),
              ),
            ),
           SizedBox(height: height*0.04,),
        Stack(
          alignment: Alignment.topCenter,
          clipBehavior: Clip.none,
          children: [
            Container(
              height: height*0.132,
              width: width*0.42,
              decoration: BoxDecoration(
                color: ColorConstant.whiteColor,
                borderRadius: BorderRadius.circular(width*0.08),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 8,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
            ),
            Positioned(
              top: -45,
              left: 16,
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(ImageConstant.meal1),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            // Meal Title
            Positioned(
              bottom: 16,
              child: Text('bjnjk',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        )
          ],
        ),
      ),
    );
  }
}
