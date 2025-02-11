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
        title: Text(
          "Payment",
          style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        height: height * 1,
        width: width * 1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                child: Row(
                  children: [
                    Container(
                      color: Colors.red,
                      height: height * 0.06,
                      width: width * 0.9,
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
                                fontWeight: FontWeight.w700,
                                fontSize: width * 0.044),
                          ),
                        ],
                      ),
                    ),
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
                child: Row(
                  children: [
                    Radio<String>(
                        value: 'Option 2',
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value;
                          });
                        })
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
                child: Row(
                  children: [
                    Radio<String>(
                        value: 'Option 3',
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value;
                          });
                        })
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
                child: Row(
                  children: [
                    Radio<String>(
                        value: 'Option 4',
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value;
                          });
                        })
                  ],
                ),
              ),
              TextButton(
                  onPressed: () {
                    navigateToPaymentSuccess(context);
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentConfirm(),));
                  },
                  child: Text('confirm payment'))
            ],
          ),
        ),
      ),
    );
  }
}
