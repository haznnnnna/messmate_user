import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/colorconstant.dart';
import '../../../core/constants/imageconstant.dart';
import '../../../core/localvariables.dart';

class ChoosePlanWidget extends StatefulWidget {
  final DateTime date;
  final String meal;
  const ChoosePlanWidget({super.key, required this.date, required this.meal});

  @override
  State<ChoosePlanWidget> createState() => _ChoosePlanWidgetState();
}

class _ChoosePlanWidgetState extends State<ChoosePlanWidget> {
  List<Map<String, String>> lunchItems = [
    {
      "title": "American pasta",
      "description":
          "Lorem ipsum dolor sit amet consectetur.\nNunc trupis sapien selerisque enim.i",
      "calories": "1025Kcal",
      "protein": "25g protein",
      "carbo": "25 Carbo",
      "fat": "5g Fat",
    },
    {
      "title": "Sheet pan sweet pasta",
      "description":
          "Lorem ipsum dolor sit amet consectetur.\nNunc trupis sapien selerisque enim.i",
      "calories": "1025Kcal",
      "protein": "25g protein",
      "carbo": "25 Carbo",
      "fat": "5g Fat",
    },
    {
      "title": "American pasta",
      "description":
          "Lorem ipsum dolor sit amet consectetur.\nNunc trupis sapien selerisque enim.i",
      "calories": "1025Kcal",
      "protein": "25g protein",
      "carbo": "25 Carbo",
      "fat": "5g Fat",
    },
  ];
  int selectedIndex1 = 0;
  String selectedOption = "Lunch";
  bool tap = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      body: SizedBox(
        height: height * 0.42,
        width: width,
        // color: Colors.yellow,
        child: Center(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: List.generate(
                lunchItems.length,
                (index) {
                  bool inSelected = selectedIndex1 == index;
                  return Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex1 = index; // Update selected card index
                        });
                      },
                      child: Container(
                        height: height * 0.16,
                        width: width * 0.9,
                        //: const EdgeInsets.only(top: 8.0),
                        decoration: BoxDecoration(
                          // color: Colors.red,
                          border: Border.all(
                            color: inSelected
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
                              height: height * 0.16,
                              decoration: BoxDecoration(
                                // color: Colors.red,
                                image: DecorationImage(
                                  image:
                                      AssetImage(ImageConstant.americanPasta),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            SizedBox(
                              width: width*0.013,
                            ),
                            Expanded(
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        lunchItems[index]['title']!,
                                        style: GoogleFonts.montserrat(
                                          fontSize: width * 0.04,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      if (inSelected)
                                        Icon(
                                          Icons.check_circle,
                                          color: ColorConstant.primaryColor,
                                          size: width * 0.05,
                                        ),
                                    ],
                                  ),
                                  Text(
                                    lunchItems[index]['description']!,
                                    style: GoogleFonts.montserrat(
                                      fontSize: width * 0.03,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  // Row(
                                  //   mainAxisAlignment:
                                  //   MainAxisAlignment.spaceBetween,
                                  //   children: [
                                  //     Text(
                                  //       lunchItems[index]['calories']!,
                                  //       style: GoogleFonts.montserrat(
                                  //           fontSize: width * 0.03),
                                  //     ),
                                  //     Text(
                                  //       lunchItems[index]['protein']!,
                                  //       style: GoogleFonts.montserrat(
                                  //           fontSize: width * 0.03),
                                  //     ),
                                  //     Text(
                                  //       lunchItems[index]['carbo']!,
                                  //       style: GoogleFonts.montserrat(
                                  //           fontSize: width * 0.03),
                                  //     ),
                                  //     Text(
                                  //       lunchItems[index]['fat']!,
                                  //       style: GoogleFonts.montserrat(
                                  //           fontSize: width * 0.03),
                                  //     ),
                                  //   ],
                                  // ),
                                ],
                              ),
                            ),

                            // Check Circle for Selected Card
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
