import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:messmate_user/core/constants/colorconstant.dart';
import 'package:messmate_user/core/constants/imageconstant.dart';
import 'package:messmate_user/core/localvariables.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // backgroundColor: ColorConstant.whiteColor,
          // leading: SizedBox(
          //     height: height*0.06,width: width*0.07,
          //     child: SvgPicture.asset(SvgConstants.leftArrow2,height: height*0.04,width: width*0.04,)),
          ),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.41,
            width: width * 1,
            // color: Colors.red,
            child: Center(
              child: Container(
                height: height * 0.41,
                width: width * 0.84,
                child: Image.asset(
                ImageConstant.fridChikenPlate,
                  fit: BoxFit.fill,
                ),
                decoration: BoxDecoration(shape: BoxShape.circle),
              ),
            ),
          ),
          Container(
            height: height * 0.47,
            width: width * 1,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(width * 0.09),
                    topLeft: Radius.circular(width * 0.09)),
                color: ColorConstant.whiteColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.06,
                  width: width * 1,
                  // color: Colors.red,
                ),
                SizedBox(
                  height: height * 0.08,
                  width: width * 0.83,
                  // color: Colors.red,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Fride Chiken",
                            style: GoogleFonts.sen(
                                fontSize: width * 0.058,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "\$18.99",
                            style: GoogleFonts.sen(
                                fontSize: width * 0.058,
                                fontWeight: FontWeight.bold,
                                color: ColorConstant.primaryColor),
                          )
                        ],
                      ),
                      Text(
                        "Rose Garden",
                        style: GoogleFonts.sen(
                            color: ColorConstant.roseGardenColor),
                      )
                    ],
                  ),
                ),
                Container(
                  height: height * 0.085,
                  width: width * 1,
                  color: Colors.red,
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Size",style: GoogleFonts.sen(fontSize: width*0.04),),
                          Text("Medium")
                        ],
                      ),
                      // Divider(
                      //
                      // )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
