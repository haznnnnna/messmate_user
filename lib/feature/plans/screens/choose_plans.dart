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

  DateTime? selectedDate;
  DateTime today = DateTime.now();
  List<DateTime> currentWeekDates = [];
  getDates(){

    
    
  // Find the start of the week (Monday)
    DateTime startOfWeek = today.subtract(Duration(days: today.weekday - 1));
  

    // Generate the list of dates for the current week with time set to 00:00:00
 currentWeekDates = List.generate(7, (index) {
      DateTime date = startOfWeek.add(Duration(days: index));
      return DateTime(date.year, date.month, date.day); // Set time to 00:00:00
    });
  setState(() {

  });


  print(currentWeekDates);
}

  List<Map<String, String>> lunchItems = [
    {
      "title": "American pasta",
      "description": "Lorem ipsum dolor sit amet consectetur.",
      "calories": "1025Kcal",
      "protein": "25g protein",
      "carbo": "25 Carbo",
      "fat": "5g Fat",
    },
    {
      "title": "Sheet pan sweet pasta",
      "description": "Lorem ipsum dolor sit amet consectetur.",
      "calories": "1025Kcal",
      "protein": "25g protein",
      "carbo": "25 Carbo",
      "fat": "5g Fat",
    },
    {
      "title": "American pasta",
      "description": "Lorem ipsum dolor sit amet consectetur.",
      "calories": "1025Kcal",
      "protein": "25g protein",
      "carbo": "25 Carbo",
      "fat": "5g Fat",
    },
  ];
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: width * 0.2,
                        backgroundColor: ColorConstant.circularColor,
                        child: Image.asset(ImageConstant.saladPlate),
                      ),
                      SizedBox(
                        // color: Colors.red,
                        height: height * 0.09,
                        width: width * 0.2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "30",
                              style: GoogleFonts.montserrat(
                                  fontSize: width * 0.05,
                                  fontWeight: FontWeight.bold,
                                  color: ColorConstant.primaryColor),
                            ),
                            Text(
                              "Days plan",
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                  fontSize: width * 0.03,
                                  color: ColorConstant.primaryColor),
                            ),
                          ],
                        ),
                      )
                    ],
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
                                fontWeight: FontWeight.bold, fontSize: width * 0.03),
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
                                bool isSelected = selectedDate == currentWeekDates[index];
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
                                        borderRadius:
                                            BorderRadius.circular(width * 0.06)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: Text(
                                            DateFormat.E().format(currentWeekDates[index]),
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
                                                  DateFormat.d().format(currentWeekDates[index]),
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
                Container(
                  // color: Colors.pink,
                  height: height * 0.5,
                  width: width ,
                  child: Column(
                    children: [
                     const TabBar(
                       // indicatorSize: TabBarIndicatorSize,
                        dividerColor: ColorConstant.whiteColor,
                        labelColor: ColorConstant.blackColor,
                          unselectedLabelColor: Colors.grey,
                          indicatorColor: ColorConstant.blackColor,
                          tabs: [
                        Tab(text: "Lunch",),
                        Tab(text: "Dinner",)
                      ]),
                   selectedDate==null?
                   Container():
                   Expanded(
                        child: TabBarView(children: [
                          Container(
                            height: height*0.12,
                            width: width*0.9,
                            child: ChoosePlanWidget(date: selectedDate!, meal: "Lunch"),
                            color: ColorConstant.whiteColor,
                          ),Container(
                            height: height*0.12,
                            width: width*0.9,
                            color: ColorConstant.whiteColor,
                            child: ChoosePlanWidget(date: selectedDate!, meal: "Dinner"),

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
