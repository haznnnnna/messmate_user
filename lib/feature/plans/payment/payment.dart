import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:messmate_user/core/constants/colorconstant.dart';
import 'package:messmate_user/core/constants/imageconstant.dart';
import 'package:messmate_user/feature/plans/payment/payment_confirm.dart';

import '../../../core/localvariables.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  void navigateToPaymentSuccess(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 500), // Animation duration
        pageBuilder: (context, animation, secondaryAnimation) {
          return PaymentConfirm();
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }

  String? selectedOption;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      appBar: AppBar(
        backgroundColor: ColorConstant.whiteColor,
        title: Text(
          "Payment",
          style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics:BouncingScrollPhysics() ,
        child: SizedBox(
          height: height ,
          width: width * 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: height * 0.13,
                  width: width * 1,
                  decoration: BoxDecoration(
                      color: ColorConstant.whiteColor,
                      borderRadius: BorderRadius.circular(width * 0.015),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 2,
                            offset: Offset(0, 2),
                            blurRadius: 2)
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // crossAxisAlignment: CrossAxisAlignment.,
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "30 days plans [veg food]",
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "INR 189.00",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                color: ColorConstant.paymentPageInr),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.056,
                        width: width * 0.59,
                        // color: Colors.red,
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Starting Date : Jan 15th ",
                                style:
                                    GoogleFonts.openSans(fontSize: width * 0.036),
                              ),
                              Text(
                                "Ending Date : Feb 15th",
                                style:
                                    GoogleFonts.openSans(fontSize: width * 0.036),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: height * 0.075,
                  width: width * 1,
                  decoration: BoxDecoration(
                      color: ColorConstant.whiteColor,
                      borderRadius: BorderRadius.circular(width * 0.015),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 2,
                            offset: Offset(0, 2),
                            blurRadius: 2)
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          // color: Colors.red,
                          height: height * 0.06,
                          width: width * 0.65,
                          child: Row(
                            children: [
                              Radio<String>(
                                  value: 'Option 1',
                                  groupValue: selectedOption,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedOption = value;
                                    });
                                  }),
                              Text(
                                "Credit/Debit ATM Card",
                                style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.w600,
                                    fontSize: width * 0.042),
                              ),
                            ],
                          ),
                        ),
                        SvgPicture.asset(
                          SvgConstants.cardIcon,
                          height: height * 0.04,
                          width: width * 0.04,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: height * 0.075,
                  width: width * 1,
                  decoration: BoxDecoration(
                      color: ColorConstant.whiteColor,
                      borderRadius: BorderRadius.circular(width * 0.015),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 2,
                            offset: Offset(0, 2),
                            blurRadius: 2)
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          // color: Colors.red,
                          height: height * 0.06,
                          width: width * 0.85,
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Radio<String>(
                                  value: 'Option 2',
                                  groupValue: selectedOption,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedOption = value;
                                    });
                                  }),
                              Text(
                                "UPI (PhonePe / Google Pay / BHIM)",
                                style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.w600,
                                    fontSize: width * 0.04),
                              ),
                            ],
                          ),
                        ),
                        Image.asset(
                          ImageConstant.upiIcon,
                          fit: BoxFit.fill,
                          height: height * 0.03,
                          width: width * 0.06,
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: height * 0.075,
                  width: width * 1,
                  decoration: BoxDecoration(
                      color: ColorConstant.whiteColor,
                      borderRadius: BorderRadius.circular(width * 0.015),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 2,
                            offset: Offset(0, 2),
                            blurRadius: 2)
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          // color: Colors.red,
                          height: height * 0.06,
                          width: width * 0.65,
                          child: Row(
                            children: [
                              Radio<String>(
                                  value: 'Option 3',
                                  groupValue: selectedOption,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedOption = value;
                                    });
                                  }),
                              Text(
                                "Net Banking",
                                style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.w600,
                                    fontSize: width * 0.042),
                              ),
                            ],
                          ),
                        ),
                        SvgPicture.asset(
                          SvgConstants.netBanking,
                          height: height * 0.03,
                          width: width * 0.03,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: height * 0.075,
                  width: width * 1,
                  decoration: BoxDecoration(
                      color: ColorConstant.whiteColor,
                      borderRadius: BorderRadius.circular(width * 0.015),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 2,
                            offset: Offset(0, 2),
                            blurRadius: 2)
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          // color: Colors.red,
                          height: height * 0.06,
                          width: width * 0.65,
                          child: Row(
                            children: [
                              Radio<String>(
                                  value: 'Option 4',
                                  groupValue: selectedOption,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedOption = value;
                                    });
                                  }),
                              Text(
                                "Cash Payment",
                                style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.w600,
                                    fontSize: width * 0.042),
                              ),
                            ],
                          ),
                        ),
                        SvgPicture.asset(
                          SvgConstants.cashPic,
                          height: height * 0.04,
                          width: width * 0.03,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: height * 0.37,
                  width: width * 1,
                  decoration: BoxDecoration(
                      color: ColorConstant.whiteColor,
                      borderRadius: BorderRadius.circular(width * 0.015),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 2,
                            offset: Offset(0, 2),
                            blurRadius: 2)
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(
                          "PRICE DETAILS",
                          style: GoogleFonts.openSans(
                              color: ColorConstant.dayColor,
                              fontSize: width * 0.04),
                        ),
                      ),
                      Divider(
                        color: ColorConstant.dividerColor,
                        thickness: height * 0.0016,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Price (1 Strip)"),
                            Text(
                              "INR 189.00",
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold,
                                  color: ColorConstant.paymentPageInr),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Shipping Charges"),
                            Text(
                              "INR 189.00",
                              style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.bold,
                                  color: ColorConstant.blackColor),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: ColorConstant.dividerColor,
                        thickness: height * 0.0016,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Discount (20%)",
                              style: GoogleFonts.openSans(),
                            ),
                            Text(
                              "INR 189.00",
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold,
                                  color: ColorConstant.discountColor),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Point Discount",
                              style: GoogleFonts.openSans(),
                            ),
                            Text(
                              "INR 189.00",
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold,
                                  color: ColorConstant.discountColor),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: ColorConstant.dividerColor,
                        thickness: height * 0.0016,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Payable Amount",
                              style: GoogleFonts.openSans(),
                            ),
                            Text(
                              "INR 189.00",
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold,
                                  color: ColorConstant.paymentPageInr),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    navigateToPaymentSuccess(context);
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentConfirm(),));
                  },
                  child: Container(
                    width: width * 0.75,
                    height: height * 0.065,
                    decoration: BoxDecoration(
                        color: ColorConstant.primaryColor,
                        borderRadius: BorderRadius.circular(width * 0.08)),
                    child: Center(
                        child: Text(
                      "Confirm Payment",
                      style: GoogleFonts.roboto(
                          color: ColorConstant.whiteColor,
                          fontSize: width * 0.055,
                          fontWeight: FontWeight.w600),
                    )),
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
