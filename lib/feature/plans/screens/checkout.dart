import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:messmate_user/core/constants/colorconstant.dart';
import 'package:messmate_user/core/constants/imageconstant.dart';
import 'package:messmate_user/core/localvariables.dart';
import 'package:messmate_user/feature/cart/screen/cart.dart';

class CheckoutPage extends StatefulWidget {
  final String image;
  final String title;
  final String price;
  final String order;
  const CheckoutPage(
      {super.key,
      required this.image,
      required this.title,
      required this.price,
      required this.order});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  List<Map<String, dynamic>> ingridentsList = [
    {"url": ImageConstant.ingredientsSalt, "name": "Salt"},
    {"url": ImageConstant.ingredientChiken, "name": "Chicken"},
    {"url": ImageConstant.ingredientOnion, "name": "Onion"},
    {"url": ImageConstant.ingredientsGarlic, "name": "Garlic"},
    {"url": ImageConstant.ingredientsPeppers, "name": "Peppers"}
  ];
  int count = 0;
  bool tap = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      appBar: AppBar(
        backgroundColor: ColorConstant.whiteColor,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: width * 0.04),
            child: Icon(Icons.favorite_border),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        // scrollDirection: Axis.horizontal,
        child: SizedBox(
          // color: Colors.blue,
          height: height *1,
          width: width,
          child: Column(
            children: [
              SizedBox(
                height: height * 0.41,
                width: width * 1,
                child: Center(
                  child: Container(
                    height: height * 0.41,
                    width: width * 0.84,
                    child: Image.asset(
                      widget.image,
                      fit: BoxFit.fill,
                    ),
                    decoration: BoxDecoration(shape: BoxShape.circle),
                  ),
                ),
              ),
              Container(
                height: height * 0.56,
                width: width * 1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(width * 0.09),
                        topLeft: Radius.circular(width * 0.09)),
                    color: ColorConstant.whiteColor,
                ),
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
                                widget.title,
                                style: GoogleFonts.sen(
                                    fontSize: width * 0.058,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                widget.price,
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
                                style:
                                    GoogleFonts.sen(fontSize: width * 0.04),
                              ),
                              Text(
                                "Medium",
                                style:
                                    GoogleFonts.sen(fontSize: width * 0.049),
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
                                style:
                                    GoogleFonts.sen(fontSize: width * 0.04),
                              ),
                              Text(
                                "Medium",
                                style:
                                    GoogleFonts.sen(fontSize: width * 0.049),
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
                                style:
                                    GoogleFonts.sen(fontSize: width * 0.04),
                              ),
                              Text(
                                "Medium",
                                style:
                                    GoogleFonts.sen(fontSize: width * 0.049),
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
                        maxLines: tap ? null : 2,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => setState(() => tap = !tap),
                      child: Text(
                        tap ? "Read Less" : "Read More",
                        style: GoogleFonts.sen(fontSize: 19),
                      ),
                    ),
                    SizedBox(
                      // color: Colors.red,
                      height: height * 0.15,
                      width: width * 1,
                      // color: Colors.blue,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ingridents",
                            style: GoogleFonts.sen(fontSize: width * 0.045),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(
                              ingridentsList.length,
                              (index) {
                                return SizedBox(
                                  height: height * 0.11,
                                  width: width * 0.15,
                                   // color: Colors.yellow,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        height: height * 0.07,
                                        width: width * 0.15,
                                        decoration: BoxDecoration(
                                            color: ColorConstant.checkOutItem,
                                            shape: BoxShape.circle),
                                        child: Center(
                                            child: Image.asset(
                                          ingridentsList[index]["url"],
                                          width: width * 0.06,
                                          height: height * 0.06,
                                          fit: BoxFit.contain,
                                        )),
                                      ),
                                      Text(
                                        ingridentsList[index]["name"],
                                        style: GoogleFonts.sen(
                                            fontSize: width * 0.033),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: height * 0.1,
          width: width * 1,
          // color: Colors.purple,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: height * 0.04,
                width: width * 0.2,
                // color: Colors.blue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if(1<=count){
                            count--;
                          }
                        });
                      },
                      child: Container(
                        height: height * 0.026,
                        width: width * 0.062,
                        decoration: BoxDecoration(
                            color: ColorConstant.checkOutItem,
                            borderRadius: BorderRadius.circular(width * 0.012)),
                        child: Icon(
                          Icons.remove,
                          color: ColorConstant.dayColor,
                        ),
                      ),
                    ),
                    Text(
                      count.toString(),
                      style: GoogleFonts.sen(
                          fontSize: width * 0.052, fontWeight: FontWeight.w600),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          count++;
                        });
                      },
                      child: Container(
                        height: height * 0.026,
                        width: width * 0.062,
                        decoration: BoxDecoration(
                            color: ColorConstant.checkOutItem,
                            borderRadius: BorderRadius.circular(width * 0.012)),
                        child: Icon(
                          CupertinoIcons.plus,
                          color: ColorConstant.dayColor,
                          size: width * 0.045,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart())),
                child: Container(
                  height: height * 0.04,
                  width: width * 0.4,
                  decoration: BoxDecoration(
                      color: ColorConstant.primaryColor,
                      borderRadius: BorderRadius.circular(width * 0.023)),
                  child: Center(
                    child: Text(
                      "Add to cart",
                      style: GoogleFonts.sen(
                          color: ColorConstant.whiteColor,
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.bold),
                    ),
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
