import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:messmate_user/core/constants/colorconstant.dart';
import 'package:messmate_user/core/constants/imageconstant.dart';

import 'core/localvariables.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<int>count=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    count=List.filled(cart.length, 0);
  }

  int getTotal() {
    int total = 0;
    for (int i = 0; i < cart.length; i++) {
      total += int.parse(cart[i]['price']) * count[i];
    }
    return total;
  }


  List cart=[
    {
      'name':'Fried Chicken',
      'price':'240' ,
    },
    {
      'name':'Chin Fried Rice',
      'price':'450' ,
    },
    {
      'name':'Tangerine Salad',
      'price':'450' ,
    }
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      appBar: AppBar(title: Text('Cart'),
      centerTitle: true,
        backgroundColor: ColorConstant.whiteColor,
        leading: Icon(CupertinoIcons.back),
        actions: [
          Padding(
            padding:  EdgeInsets.only(
              right: width*0.03
            ),
            child: Icon(Icons.delete),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height*0.5,
                width:width*1 ,
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return  Container(
                      height: height * 0.14,
                      width: width * 0.9,
                      decoration: BoxDecoration(
                          color: ColorConstant.categoryColor,
                          borderRadius: BorderRadius.circular(width*0.03)
                      ),
                      child: Stack(
                        children:[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: width*0.03
                              ),
                              child: Container(
                              height: height*0.11,
                              width: width*0.28,
                              decoration: BoxDecoration(
                                // image: DecorationImage(
                                //   alignment: Alignment.center,
                                //     image: AssetImage(ImageConstant.cartImg),fit: BoxFit.fill),
                                color: ColorConstant.lightblackColor,
                                borderRadius: BorderRadius.circular(width*0.03)
                              ),
                                child: Align(
                                  alignment: Alignment.center,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        top: height*0.01
                                      ),
                                      child: Image.asset(ImageConstant.checkOutImg,),
                                    )),
                              ),),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding:  EdgeInsets.only(
                                bottom: height*0.06,
                               left: width*0.15
                              ),
                              child: Text(cart[index]['name'],style: GoogleFonts.montserrat(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding:  EdgeInsets.only(
                                  top: height*0.03,
                                  right: width*0.08
                              ),
                              child: Text(cart[index]['price'],style: GoogleFonts.montserrat(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: EdgeInsets.only(
                                right: width*0.04,
                                bottom: height*0.02
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      if(count[index]>0){
                                        setState(() {
                                          count[index]--;
                                        });
                                      }
                                    },
                                    child: CircleAvatar(
                                      radius: 10,
                                      backgroundColor: ColorConstant.whiteColor,
                                        child: Icon(CupertinoIcons.minus,size: height*0.015,)),
                                  ),
                                  SizedBox(width: width*0.02,),
                                  Text('${count[index]}',style: GoogleFonts.montserrat(
                                      fontSize: 15
                                  ),),
                                  SizedBox(width: width*0.02,),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        count[index]++;
                                      });
                                    },
                                    child: CircleAvatar(
                                        radius: 10,
                                        backgroundColor: ColorConstant.whiteColor,
                                        child: Icon(CupertinoIcons.add,size: height*0.015,)),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ]
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: height*0.02,);
                  },
                  itemCount: cart.length,
                ),
              ),
              Container(
                height: height*0.38,
                width: width*1,
                decoration: BoxDecoration(
                  color: ColorConstant.verylightblue,
                  borderRadius: BorderRadius.circular(width*0.03)
                ),
                child: Padding(
                  padding:  EdgeInsets.all(width*0.04),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: List.generate(cart.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(cart[index]["name"],
                                    style: GoogleFonts.almarai(fontSize: 15)),
                                Text('Rs. ${int.parse(cart[index]["price"]) * count[index]}',
                                    style: GoogleFonts.almarai(fontSize: 15, fontWeight: FontWeight.bold)),

                              ],
                            ),
                          );
                        }),
                      ),
                      Dash(
                        length: 310,
                        dashColor: ColorConstant.dayColor,
                        dashLength: 3, // Dash size
                        dashGap: 2, // Gap between dashes
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total', style: GoogleFonts.almarai(fontSize: 15)),
                          Text('Rs. ${getTotal()}',
                              style: GoogleFonts.almarai(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Container(
                        height: height * 0.07,
                        width: width * 0.7,
                        decoration: BoxDecoration(
                            color: ColorConstant.primaryColor,
                            borderRadius: BorderRadius.circular(width * 0.07)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Checkout',
                                style: GoogleFonts.almarai(
                                    fontSize: 16,
                                    color: ColorConstant.whiteColor,
                                    fontWeight: FontWeight.w700)),
                            SizedBox(width: width * 0.02),
                            Icon(CupertinoIcons.arrow_right,
                                color: ColorConstant.whiteColor, size: height * 0.03)
                          ],
                        ),
                      )
                  //     Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         Text('Fried Chicken',style: GoogleFonts.almarai(
                  //             fontSize: 15
                  //         )),
                  //         Text('Rs 240',style: GoogleFonts.almarai(
                  //             fontSize: 15,
                  //           fontWeight: FontWeight.bold
                  //         )),
                  //       ],
                  //     ),
                  //     Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         Text('Fried Rice',style: GoogleFonts.almarai(
                  //             fontSize: 15
                  //         )),
                  //         Text('Rs 450',style: GoogleFonts.almarai(
                  //             fontSize: 15,
                  //             fontWeight: FontWeight.bold
                  //         )),
                  //       ],
                  //     ),
                  //     Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         Text('Tangerine Salad',style: GoogleFonts.almarai(
                  //             fontSize: 15
                  //         )),
                  //         Text('Rs 450',style: GoogleFonts.almarai(
                  //             fontSize: 15,
                  //             fontWeight: FontWeight.bold
                  //         )),
                  //       ],
                  //     ),
                  //   Dash(
                  //     length: 310,
                  //     dashColor: ColorConstant.dayColor,
                  //     dashLength: 3, // Dash size
                  //     dashGap: 2, // Gap between dashes
                  //   ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text('Total',style: GoogleFonts.almarai(
                  //         fontSize: 15
                  //     )),
                  //     Text('Rs  650',style: GoogleFonts.almarai(
                  //         fontSize: 15,
                  //         fontWeight: FontWeight.bold
                  //     )),
                  //   ],
                  // ),
                  //     Container(
                  //       height: height*0.07,
                  //       width: width*0.7,
                  //       decoration: BoxDecoration(
                  //         color: ColorConstant.primaryColor,
                  //         borderRadius: BorderRadius.circular(width*0.07)
                  //       ),
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [
                  //           Text('Checkout',style: GoogleFonts.almarai(
                  //               fontSize: 16,
                  //               color: ColorConstant.whiteColor,
                  //               fontWeight: FontWeight.w700
                  //           )),
                  //           SizedBox(width: width*0.02,),
                  //           Icon(CupertinoIcons.arrow_right,color: ColorConstant.whiteColor,size: height*0.03,)
                  //         ],
                  //       ),
                  //     )
                    ],
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
