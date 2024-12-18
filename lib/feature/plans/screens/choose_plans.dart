import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:messmate_user/core/constants/colorconstant.dart';
import 'package:messmate_user/core/constants/imageconstant.dart';
import 'package:messmate_user/feature/plans/screens/choose_plan_widget.dart';

import '../../../core/localvariables.dart';

class ChoosePlans extends StatefulWidget {
  const ChoosePlans({super.key});

  @override
  State<ChoosePlans> createState() => _ChoosePlansState();
}

class _ChoosePlansState extends State<ChoosePlans> {
  List items = [
    {
      'title': '7',
      'caption': 'Days Plan',
      'subtitle': '\u{20B9}${1599.00}/ Only\n\u{20B9}${35}/meal',
      'image': 'assets/images/plans1.png',
      // 'backgroundColor': Colors.white,
    },
    {
      'title': '30',
      'caption': 'Days Plan',
      'subtitle': '\u{20B9}${1599.00}/ Only\n\u{20B9}${35}/meal',
      'image': 'assets/images/plans2.png',
      // 'backgroundColor': Colors.green.shade100,
    },
    {
      'title': '14',
      'caption': 'Days Plan',
      'subtitle': '\u{20B9}${1599.00}/ Only\n\u{20B9}${35}/meal',
      'image': 'assets/images/plans3.png',
      // 'backgroundColor': Colors.white,
    },
  ];
  int selectIndex = 0;
  int selectPlans = 0;
  DateTime? selectedDate;
  DateTime today = DateTime.now();
  List<DateTime> currentWeekDates = [];

  getDates() {
    // Find the start of the week (Monday)
    DateTime startOfWeek = today.subtract(Duration(days: today.weekday - 1));

    // Generate the list of dates for the current week with time set to 00:00:00
    currentWeekDates = List.generate(7, (index) {
      DateTime date = startOfWeek.add(Duration(days: index));
      return DateTime(date.year, date.month, date.day); // Set time to 00:00:00
    });
    setState(() {});

    print(currentWeekDates);
  }

  String selectedOption = "Lunch";
  bool tap = true;

  List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  List<int> dates = [22, 23, 24, 25, 26, 27];
  @override
  void initState() {
    getDates();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: ColorConstant.whiteColor,
        appBar: AppBar(
          leading: Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
          centerTitle: true,
          backgroundColor: ColorConstant.whiteColor,
          title: Text(
            "Choose plans",
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: SizedBox(
            height: height,
            width: width,
            child: Column(
              children: [
                SizedBox(
                  // color: Colors.yellow,
                  height: height * 0.34,
                  width: width,
                  child: CarouselSlider.builder(
                    itemCount: items.length,
                    options: CarouselOptions(
                      autoPlayAnimationDuration: Duration(seconds: 1),
                      viewportFraction: 0.5,
                      aspectRatio: 16 / 9,
                      height: height * 0.3,
                      // autoPlay: true,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          selectPlans = index;
                        });
                      },
                    ),
                    itemBuilder:
                        (BuildContext context, int index, int realIndex) {
                      final item = items[index];
                      final isActive = index == selectPlans;
                      return Container(
                        height: height * 0.3,
                        width: width * 0.45,
                        margin: EdgeInsets.all(width * 0.01),
                        decoration: BoxDecoration(
                            color: isActive
                                ? ColorConstant.primaryColor
                                : ColorConstant.whiteColor,
                            borderRadius: BorderRadius.circular(width * 0.02),
                            boxShadow: [
                              BoxShadow(
                                  color: Color((0xff444444)).withOpacity(0.23),
                                  // spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: Offset(4, 4))
                            ]),
                        child: Center(
                          child: Column(
                            children: [
                              Text(items[index]['title'],
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w700,
                                    fontSize: isActive ? 20 : 17,
                                    color: isActive
                                        ? ColorConstant.whiteColor
                                        : ColorConstant.primaryColor,
                                  )),
                              Text(items[index]['caption'],
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    fontSize: isActive ? 15 : 13,
                                    color: isActive
                                        ? ColorConstant.whiteColor
                                        : ColorConstant.primaryColor,
                                  )),
                              Image(
                                fit: BoxFit.fill,
                                image: AssetImage(items[index]['image']),
                                height: isActive ? height * 0.15 : height * 0.1,
                              ),
                              Text(items[index]['subtitle'],
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.montserrat(
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
                      );
                    },
                  ),
                ),
                SizedBox(
                  // color: Colors.yellow,
                  height: height * 0.14,
                  width: width * 0.9,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Select starting date",
                            style: GoogleFonts.montserrat(
                                color: ColorConstant.blackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: width * 0.05),
                          ),
                          Text(
                            "December",
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.bold,
                                fontSize: width * 0.03),
                          )
                        ],
                      ),
                      SizedBox(
                          // color: Colors.red,
                          height: height * 0.1,
                          width: width * 0.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                              currentWeekDates.length,
                              (index) {
                                bool isSelected =
                                    selectedDate == currentWeekDates[index];
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedDate = currentWeekDates[index];
                                      print(selectedDate);
                                    });
                                  },
                                  child: Container(
                                    height: height * 0.083,
                                    width: width * 0.09,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: isSelected
                                                ? ColorConstant.primaryColor
                                                : Colors.grey.shade300),
                                        color: isSelected
                                            ? ColorConstant.primaryColor
                                            : ColorConstant.whiteColor,
                                        borderRadius: BorderRadius.circular(
                                            width * 0.06)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: Text(
                                            DateFormat.E().format(
                                                currentWeekDates[index]),
                                            style: GoogleFonts.montserrat(
                                                color: isSelected
                                                    ? ColorConstant.whiteColor
                                                    : ColorConstant.dayColor,
                                                fontSize: width * 0.03),
                                          ),
                                        ),
                                        Container(
                                          height: height * 0.04,
                                          width: width * 0.08,
                                          decoration: BoxDecoration(
                                            color: ColorConstant.whiteColor,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: isSelected
                                                    ? ColorConstant.primaryColor
                                                    : Colors.grey.shade300),
                                          ),
                                          child: Center(
                                              child: Text(
                                            DateFormat.d().format(
                                                currentWeekDates[index]),
                                            style: GoogleFonts.montserrat(
                                                fontWeight: FontWeight.bold,
                                                color: isSelected
                                                    ? ColorConstant.blackColor
                                                    : ColorConstant.dayColor),
                                          )),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  // color: Colors.pink,
                  height: height * 0.5,
                  width: width,
                  child: Column(
                    children: [
                      const TabBar(
                          // indicatorSize: TabBarIndicatorSize,
                          dividerColor: Colors.transparent,
                          labelColor: ColorConstant.blackColor,
                          unselectedLabelColor: Colors.grey,
                          indicatorColor: ColorConstant.blackColor,
                          tabs: [
                            Tab(
                              text: "Lunch",
                            ),
                            Tab(
                              text: "Dinner",
                            )
                          ]),
                      selectedDate == null
                          ? Container()
                          : Expanded(
                              child: TabBarView(children: [
                                Container(
                                  height: height * 0.12,
                                  width: width * 0.9,
                                  child: ChoosePlanWidget(
                                      date: selectedDate!, meal: "Lunch"),
                                  color: ColorConstant.whiteColor,
                                ),
                                Container(
                                  height: height * 0.12,
                                  width: width * 0.9,
                                  color: ColorConstant.whiteColor,
                                  child: ChoosePlanWidget(
                                      date: selectedDate!, meal: "Dinner"),
                                ),
                              ]),
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
