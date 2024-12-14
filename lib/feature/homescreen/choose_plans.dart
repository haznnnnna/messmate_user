import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:messmate_user/core/constants/colorconstant.dart';
import 'package:messmate_user/core/constants/imageconstant.dart';

import '../../core/localvariables.dart';

class ChoosePlans extends StatefulWidget {
  const ChoosePlans({super.key});

  @override
  State<ChoosePlans> createState() => _ChoosePlansState();
}

class _ChoosePlansState extends State<ChoosePlans> {
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
  int selectedIndex = -1;
  int selectedIndex1 = -1;
  List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  List<int> dates = [22, 23, 24, 25, 26, 27];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios_new_rounded,
        ),
        centerTitle: true,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: width * 0.05,
                        ),
                        SizedBox(
                            // color: Colors.red,
                            height: height * 0.1,
                            width: width * 0.75,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(
                                dates.length,
                                (index) {
                                  bool isSelected = selectedIndex == index;
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedIndex = index;
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
                                              days[index],
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
                                              dates[index].toString(),
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
                        Icon(
                          Icons.arrow_forward_ios,
                          size: width * 0.05,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                // color: Colors.pink,
                height: height * 0.5,
                width: width ,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Tabs for Lunch and Dinner
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Lunch Option
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedOption = "Lunch"; // Update selected option
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "Lunch",
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                  fontSize: width * 0.04,
                                  color: selectedOption == "Lunch"
                                      ? ColorConstant.blackColor
                                      : ColorConstant.defaultColor,
                                ),
                              ),
                              if (selectedOption == "Lunch")
                                Container(
                                  margin: EdgeInsets.only(top: 4),
                                  width: width * 0.1,
                                  height: 2,
                                  color: ColorConstant.blackColor,
                                ),
                            ],
                          ),
                        ),

                        // Dinner Option
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedOption = "Dinner"; // Update selected option
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "Dinner",
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                  fontSize: width * 0.04,
                                  color: selectedOption == "Dinner"
                                      ? ColorConstant.blackColor
                                      : ColorConstant.defaultColor,
                                ),
                              ),
                              if (selectedOption == "Dinner")
                                Container(
                                  margin: EdgeInsets.only(top: 4),
                                  width: width * 0.1,
                                  height: 2,
                                  color: ColorConstant.blackColor,
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: height*0.42,
                      width: width*0.9,
                      // color: Colors.yellow,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                          lunchItems.length,
                              (index) {
                            bool Selected = selectedIndex1 == index;
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex1 = index; // Update selected card index
                                });
                              },
                              child: Container(
                                height: height*0.13,
                                width: width*0.9,
                                //: const EdgeInsets.only(top: 8.0),
                                decoration: BoxDecoration(
                                  // color: Colors.red,
                                  border: Border.all(
                                    color: Selected
                                        ? ColorConstant.primaryColor
                                        : Colors.grey.shade300,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      spreadRadius: 1,
                                      blurRadius: 3,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Placeholder Image
                                    Container(
                                      width: width * 0.24,
                                      height: height * 0.14,
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        image: DecorationImage(
                                          image: AssetImage(ImageConstant.americanPasta),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            lunchItems[index]['title']!,
                                            style: GoogleFonts.montserrat(
                                              fontSize: width * 0.04,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            lunchItems[index]['description']!,
                                            style: GoogleFonts.montserrat(
                                              fontSize: width * 0.03,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                lunchItems[index]['calories']!,
                                                style: GoogleFonts.montserrat(
                                                    fontSize: width * 0.03),
                                              ),
                                              Text(
                                                lunchItems[index]['protein']!,
                                                style: GoogleFonts.montserrat(
                                                    fontSize: width * 0.03),
                                              ),
                                              Text(
                                                lunchItems[index]['carbo']!,
                                                style: GoogleFonts.montserrat(
                                                    fontSize: width * 0.03),
                                              ),
                                              Text(
                                                lunchItems[index]['fat']!,
                                                style: GoogleFonts.montserrat(
                                                    fontSize: width * 0.03),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),

                                    // Check Circle for Selected Card
                                    if (Selected)
                                      Icon(
                                        Icons.check_circle,
                                        color: ColorConstant.primaryColor,
                                        size: width * 0.05,
                                      ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
