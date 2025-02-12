import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:messmate_user/core/constants/colorconstant.dart';
import 'package:messmate_user/core/constants/imageconstant.dart';
import 'package:messmate_user/feature/profile/profilepage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/localvariables.dart';
import '../notification/notification_page.dart';
import '../plans/screens/checkout.dart';
import '../plans/screens/choose_plans.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List foodItems = [
    {
      'image': ImageConstant.checkOutImg,
      'title': 'Veggie tomato',
      'price': '\$9.22',
      'order': 'order',
    },
    {
      'image': ImageConstant.checkOutImg,
      'title': 'Fried chicken m.',
      'price': '\$9.22',
      'order': 'order',
    },
    {
      'image': ImageConstant.checkOutImg,
      'title': 'Veggie t.',
      'price': '\$9.22',
      'order': 'order',
    },
  ];

  List foodItems2 = [
    {
      'image': ImageConstant.plans1,
      'title': 'Veggie tomato',
      'price': '\$9.22',
      'order': 'order',
    },
    {
      'image': ImageConstant.plans1,
      'title': 'Fried chicken m.',
      'price': '\$9.22',
      'order': 'order',
    },
    {
      'image': ImageConstant.plans1,
      'title': 'Veggie t.',
      'price': '\$9.22',
      'order': 'order',
    },
  ];

  List categories = [
    {
      'title':'All',
      'icon':SvgConstants.categ1,
    },
    {
      'title':'Meat',
      'icon':SvgConstants.categ2,
    },
    {
      'title':'Veggie',
      'icon':SvgConstants.categ1,
    },
    {
      'title':'Hot dogs',
      'icon':SvgConstants.categ3,
    },

  ];
  String selectCategory='All';
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
        automaticallyImplyLeading: false,
        backgroundColor: ColorConstant.whiteColor,
        title: Padding(
          padding: EdgeInsets.all(width*0.03),
          child: Text("Let's find your\nfavorite food!",style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color:ColorConstant.blackColor
          ),),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationPage()));
            },
              child: SvgPicture.asset(SvgConstants.notification,)),
          SizedBox(width: width*0.03,),
          Padding(
            padding: EdgeInsets.only(
                right: width*0.06
            ),
            child: GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage())),
              child: CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage(ImageConstant.profileImg),
              ),
            ),
          ),
        ],
      ),
      body:
      Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: height*0.03,),
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
                    dotColor: ColorConstant.categoryColor,
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
                  child: Text('Categories',
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color:ColorConstant.blackColor
                    ),),
                ),
              ),
              SizedBox(height: height*0.014,),
              SizedBox(
                height: height*0.04,
                child: Padding(
                  padding:  EdgeInsets.only(
                    left: width*0.05,
                    right: width*0.03,
                  ),
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                          onTap:() {
                            // selectCategory==categories[index]?
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryPage(Details: categories[index],),)):SizedBox.shrink();
                            setState(() {
                              selectCategory=categories[index]['title'];
                            });
                            // if(selectCategory!='All'){
                            //   Future.delayed(Duration.zero, () {
                            //     Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //           builder: (context) =>
                            //               CategoryPage(Details: categories[index], selected: selectCategory,)
                            //       ),
                            //     );
                            //   });
                            // }

                          },
                          child:TextButton(
                            onPressed: () {
                              setState(() {
                                selectCategory = categories[index]['title']; // Update the selected category
                              });
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              backgroundColor: selectCategory == categories[index]['title']
                                  ? ColorConstant.primaryColor
                                  : ColorConstant.categoryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(width * 0.07),
                                side: selectCategory == categories[index]['title']
                                    ? BorderSide.none
                                    : BorderSide(
                                  color: ColorConstant.blackColor, // Border for unselected categories
                                  width: 1,
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (categories[index]['title'] != "All")
                                  SvgPicture.asset(categories[index]['icon'],height: height*0.02,),
                                if (categories[index]['title'] != "All") SizedBox(width: 5),
                                Text(
                                  categories[index]['title'],
                                  style: GoogleFonts.montserrat(
                                    fontSize: 15,
                                    color: selectCategory == categories[index]['title']
                                        ? ColorConstant.whiteColor
                                        : ColorConstant.blackColor,
                                  ),
                                ),
                              ],
                            ),
                          )
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: width*0.03,
                      );
                    },
                    itemCount: categories.length,
                  ),
                ),
              ),
              SizedBox(height: height*0.02,),
              Container(
                height: height*0.3,
                width: width*1,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return  Padding(
                      padding:  EdgeInsets.only(
                        left: width*0.02,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CheckoutPage(
                            image: foodItems[index]['image'],
                            title: foodItems[index]['title'],
                            price: foodItems[index]['price'],
                            order: foodItems[index]['order'],),));
                        },
                        child: Stack(
                            children:[
                              Align(
                                // alignment:Alignment.bottomCenter,
                                child: Container(
                                  margin: EdgeInsets.all(width*0.04),
                                  height: height*0.23,
                                  width: width*0.43,
                                  decoration: BoxDecoration(
                                    color: ColorConstant.whiteColor,
                                    borderRadius:
                                    BorderRadius.circular(width * 0.08),
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
                              Align(
                                alignment:Alignment.topCenter,
                                child: Container(
                                  // height: height*0.18,
                                    height: height*0.16,
                                    width: width * 0.5,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.asset(foodItems[index]['image'],)),
                              ),
                              Align(
                                alignment:Alignment.center,
                                child:
                                Padding(
                                  padding:  EdgeInsets.only(
                                      left: width*0.08,
                                      top: height*0.12
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(foodItems[index]['title'],style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15
                                      )),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(foodItems[index]['price'],style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16
                                          ),),
                                          SizedBox(width:width*0.09),
                                          Text(foodItems[index]['order'],style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w500,
                                              color: ColorConstant.blue,
                                              fontSize: 16
                                          )),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                // Text(foodItems[index]['price']),
                              ),
                            ]
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                height: height*0.3,
                width: width*1,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return  Padding(
                      padding:  EdgeInsets.only(
                        left: width*0.02,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CheckoutPage(
                            image: foodItems2[index]['image'],
                            title: foodItems2[index]['title'],
                            price: foodItems2[index]['price'],
                            order: foodItems2[index]['order'],),));
                        },
                        child: Stack(
                            children:[
                              Align(
                                alignment:Alignment.bottomCenter,
                                child: Container(
                                  margin: EdgeInsets.all(width*0.04),
                                  height: height*0.23,
                                  width: width*0.43,
                                  decoration: BoxDecoration(
                                    color: ColorConstant.whiteColor,
                                    borderRadius:
                                    BorderRadius.circular(width * 0.08),
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
                              Align(
                                alignment:Alignment.topCenter,
                                child: Container(
                                    height: height*0.18,
                                    width: width * 0.5,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.asset(foodItems2[index]['image'])
                                ),
                              ),
                              Align(
                                alignment:Alignment.center,
                                child:
                                Padding(
                                  padding:  EdgeInsets.only(
                                      left: width*0.08,
                                      top: height*0.12
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(foodItems2[index]['title'],style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15
                                      )),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(foodItems2[index]['price'],style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16
                                          ),),
                                          SizedBox(width:width*0.09),
                                          Text(foodItems2[index]['order'],style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w500,
                                              color: ColorConstant.blue,
                                              fontSize: 16
                                          )),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                // Text(foodItems[index]['price']),
                              ),


                            ]
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}