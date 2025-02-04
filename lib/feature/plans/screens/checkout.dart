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
  bool tap = true;
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
                  ImageConstant.checkOutImg,
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                SizedBox(
                  height: height * 0.085,
                  width: width * 0.9,
                  // color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Size",
                            style: GoogleFonts.sen(fontSize: width * 0.04),
                          ),
                          Text(
                            "Medium",
                            style: GoogleFonts.sen(fontSize: width * 0.049),
                          )
                        ],
                      ),
                      Container(
                        height: height * 0.04,
                        width: width * 0.003,
                        color: ColorConstant.defaultColor,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Size",
                            style: GoogleFonts.sen(fontSize: width * 0.04),
                          ),
                          Text(
                            "Medium",
                            style: GoogleFonts.sen(fontSize: width * 0.049),
                          )
                        ],
                      ),
                      Container(
                        height: height * 0.04,
                        width: width * 0.003,
                        color: ColorConstant.defaultColor,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Size",
                            style: GoogleFonts.sen(fontSize: width * 0.04),
                          ),
                          Text(
                            "Medium",
                            style: GoogleFonts.sen(fontSize: width * 0.049),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                AnimatedSize(
                  duration: Duration(microseconds: 300),
                  curve: Curves.easeInOut,
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipisc ing elit. Quis scelerisque sit eu read more ssssssssssssssssssssssssf ffffffffffffww rwwwwwwwwwwwwfwwfw55555555555555555555555554uuuuuuuuuuuuu",
                    overflow: TextOverflow.fade,
                    maxLines: tap ? null : 2 ,
                  ),
                ),
                GestureDetector(
                  onTap: ()=> setState(() => tap = !tap ),
                  child: Text(tap ? "Read Less" : "Read More",style: GoogleFonts.sen(fontSize: 19),),
                ),
                Container(
                  height: height*0.15,
                  width: width*1,
                  // color: Colors.blue,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Ingridents",style: GoogleFonts.sen(
                        fontSize: width*0.045
                      ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:   List.generate(4, (index) {
                        return Container(
                          height: height*0.11,
                          width: width*0.15,
                          color: Colors.red,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: height*0.07,
                                width: width*0.15,
                                decoration: BoxDecoration(
                                  color:ColorConstant.checkOutItem,
                                  shape: BoxShape.circle
                                ),
                              ),
                              Text("Pappers",style: GoogleFonts.sen(fontSize: width*0.033),)
                            ],
                          ),
                        );
                      },),

                    )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
