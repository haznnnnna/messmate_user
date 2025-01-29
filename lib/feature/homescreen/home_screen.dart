import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:messmate_user/core/constants/colorconstant.dart';
import 'package:messmate_user/core/constants/imageconstant.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/localvariables.dart';
import '../plans/screens/choose_plans.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectIndex=0;
  int selectPlans=0;
  List meals=[
    {
      'image':'assets/images/meal1.png',
      'title':'Steak'
    },
    {
      'image':'assets/images/meal2.png',
      'title':'Veg Food'
    },
    {
      'image':'assets/images/meal3.png',
      'title':'Meal'
    }
  ];

   List items = [
    {
      'title': '7',
      'caption':'Days Plan',
      'subtitle': '\u{20B9}${1599.00}/ Only\n\u{20B9}${35}/meal',
      'image': 'assets/images/plans1.png',
      // 'backgroundColor': Colors.white,
    },
    {
      'title': '30',
      'caption':'Days Plan',
      'subtitle': '\u{20B9}${1599.00}/ Only\n\u{20B9}${35}/meal',
      'image': 'assets/images/plans2.png',
      // 'backgroundColor': Colors.green.shade100,
    },
    {
      'title': '14',
      'caption':'Days Plan',
      'subtitle': '\u{20B9}${1599.00}/ Only\n\u{20B9}${35}/meal',
      'image': 'assets/images/plans3.png',
      // 'backgroundColor': Colors.white,
    },
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
        child: SingleChildScrollView(
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
                        borderRadius: BorderRadius.circular(width*0.02),
                        boxShadow: [
                          BoxShadow(
                              color: Color((0xff444444))
                                  .withOpacity(0.23),
                              // spreadRadius: 1,
                              blurRadius: 4,
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
              SizedBox(height: height*0.01,),
              Padding(
                padding: EdgeInsets.only(
                  left: width*0.05
                ),
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
          SizedBox(height: height*0.014,),
          SizedBox(
            height: height*0.2,
            width: width*0.9,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:EdgeInsets.only(
                     left: width*0.01,
                     right: width*0.01
                    ),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      clipBehavior: Clip.none,
                      children: [
                        Center(
                          child: Container(
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
                        ),
                        Positioned(
                          top: -6,
                          left: 16,
                          child: Container(
                            height: height*0.155,
                            width: width*0.33,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(meals[index]['image'],),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        // Meal Title
                        Positioned(
                          bottom: 33,
                          child: Text(meals[index]['title'],
                            style: GoogleFonts.montserrat(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: width*0.05,);
                },
                itemCount: 3),
          ),
              Padding(
                padding: EdgeInsets.only(
                    right: width*0.05
                ),
                child: Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: Text('see more',
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color:ColorConstant.primaryColor
                    ),),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: width*0.05
                ),
                child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text('PLANS FOR YOU',
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color:ColorConstant.blackColor
                    ),),
                ),
              ),
              CarouselSlider.builder(
                itemCount: items.length,
                options:CarouselOptions(
                  autoPlayAnimationDuration: Duration(
                      seconds: 1
                  ),
                  viewportFraction: 0.5,
                  aspectRatio: 16 / 9,
                  height: height*0.3,
                  // autoPlay: true,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      selectPlans=index;
                    });
                  },
                ) ,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  final item = items[index];
                  final isActive = index == selectPlans;
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ChoosePlans()));
                    },
                    child: Container(
                      height: height*0.3,
                      width: width*0.45,
                      margin: EdgeInsets.all(width*0.01),
                      decoration: BoxDecoration(
                          color: isActive
                              ? ColorConstant.primaryColor
                              : ColorConstant.whiteColor,
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
                      child: Center(
                        child: Column(
                          children: [
                            Text(items[index]['title'], style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w700,
                                fontSize:isActive? 20:17,
                              color: isActive
                                  ? ColorConstant.whiteColor
                                  : ColorConstant.primaryColor,
                            )),
                            Text(items[index]['caption'], style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                              fontSize:isActive? 15:13,
                              color: isActive
                                  ? ColorConstant.whiteColor
                                  : ColorConstant.primaryColor,
                            )),
                            Image(image: AssetImage(items[index]['image']),
                              height:isActive? height*0.15:height*0.1,),
                            Text(items[index]['subtitle'],
                                textAlign: TextAlign.center, style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w700,
                                fontSize: 13,
                                  color: isActive
                                      ? ColorConstant.whiteColor
                                      : ColorConstant.primaryColor,
                            )),
                            // Text('\u{20B9}${35}/meal', style: GoogleFonts.montserrat(
                            //     fontWeight: FontWeight.w600,
                            //     fontSize: 11,
                            //     color:ColorConstant.whiteColor
                            // )),

                          ],
                        ),
                      ),
                    ),
                  );
                },),

            ],
          ),
        ),
      ),
    );
  }
}
