import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:messmate_user/core/constants/colorconstant.dart';
import 'package:messmate_user/core/localvariables.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  bool selectedAddress = false;
  String selectedOption = "Home";

  double? CurrentLatitude;
  double? CurrentLongitude;
  double temperature01 = 0;

  getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return;
    }
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    // print('Latitude: ${position.latitude}, Longitude: ${position.longitude}');
    CurrentLatitude= position.latitude;
    CurrentLongitude= position.longitude;


    // getdata();

    setState(() {

    });
    // print(position.latitude.runtimeType);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorConstant.primaryColor,
        title: SizedBox(
          height: height * 0.06,
          width: width * 0.85,
          child: TextFormField(
            textInputAction: TextInputAction.search,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.search),
              labelText: "Enter location",
              filled: true,
              fillColor: ColorConstant.whiteColor,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: SizedBox(
            height: height*0.87,
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.my_location_rounded,
                      size: width * 0.09,
                      color: ColorConstant.defaultColor,
                    ),
                    SizedBox(width: width * 0.02),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Current Location",
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              fontSize: width * 0.04),
                        ),
                        Text(
                          "Using Device",
                          style: GoogleFonts.montserrat(
                              color: ColorConstant.defaultColor,
                              fontWeight: FontWeight.w400,
                              fontSize: width * 0.03),
                        ),
                      ],
                    )
                  ],
                ),
                Text(
                  "Saved location",
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w700, fontSize: width * 0.05),
                ),
                // Row(
                //   children: [
                //     Icon(
                //       Icons.location_on_outlined,
                //       size: width * 0.09,
                //       color: ColorConstant.defaultColor,
                //     ),
                //     SizedBox(width: width * 0.02),
                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Text(
                //           "Home",
                //           style: GoogleFonts.montserrat(
                //               fontWeight: FontWeight.w600,
                //               fontSize: width * 0.04),
                //         ),
                //         Text(
                //           "DDRC SRL TOWER,G-131, Panampilly Nagar, Ernakulam,",
                //           style: GoogleFonts.montserrat(
                //               color: ColorConstant.defaultColor,
                //               fontWeight: FontWeight.w400,
                //               fontSize: width * 0.023),
                //         ),
                //       ],
                //     ),
                //     Radio(
                //       value: false,
                //       groupValue: selectedAddress,
                //       onChanged: (bool? value) {
                //         setState(() {
                //           selectedAddress = value!;
                //         });
                //       },
                //     ),
                //   ],
                // ),
                // Divider(),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: width * 0.09,
                      color: ColorConstant.defaultColor,
                    ),
                    SizedBox(width: width * 0.02),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Home",
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              fontSize: width * 0.04),
                        ),
                        Text(
                          "DDRC SRL TOWER,G-131, Panampilly Nagar, Ernakulam,",
                          style: GoogleFonts.montserrat(
                              color: ColorConstant.defaultColor,
                              fontWeight: FontWeight.w400,
                              fontSize: width * 0.023),
                        ),
                      ],
                    ),
                    Radio(
                      value: true,
                      groupValue: selectedAddress,
                      onChanged: (bool? value) {
                        setState(() {
                          selectedAddress = value!;
                        });
                      },
                    ),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add_location_alt_outlined),
                    Text(
                      "Add new address",
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600, fontSize: width * 0.04),
                    )
                  ],
                ),
                TextFormField(
                  textInputAction: TextInputAction.search,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: "House name",
                      hintText: "House name/Building name",
                      labelStyle:
                          GoogleFonts.montserrat(fontWeight: FontWeight.w600),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder()),
                ),
                TextFormField(
                  textInputAction: TextInputAction.search,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: "Road name",
                      labelStyle:
                          GoogleFonts.montserrat(fontWeight: FontWeight.w600),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder()),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Pincode',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'City',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'State',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: GestureDetector(
                            onTap: () {
                              getCurrentLocation();
                            },
                            child: Container(
                              height: height * 0.06,
                              width: width * 0.3,
                              decoration: BoxDecoration(
                                  color: ColorConstant.primaryColor,
                                  borderRadius:
                                      BorderRadius.circular(width * 0.04)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    Icons.my_location_rounded,
                                    color: ColorConstant.whiteColor,
                                  ),
                                  Text(
                                    "Current location",
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w600,
                                        color: ColorConstant.whiteColor),
                                  )
                                ],
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio<String>(
                      value: "Home",
                      groupValue: selectedOption,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value!;
                        });
                      },
                    ),
                    Text("Home"),

                    Radio<String>(
                      value: "Office",
                      groupValue: selectedOption,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value!;
                        });
                      },
                    ),
                    Text("Office"),

                    Radio<String>(
                      value: "Other",
                      groupValue: selectedOption,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value!;
                        });
                      },
                    ),
                    Text("Other"),
                  ],
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: height * 0.07,
                    width: width * 0.8,
                    decoration: BoxDecoration(
                        color: ColorConstant.primaryColor,
                        borderRadius: BorderRadius.circular(width * 0.09)),
                    child: Center(
                      child: Text(
                        "Save & Continue",
                        style: GoogleFonts.sen(
                            color: ColorConstant.whiteColor,
                            fontSize: width * 0.05,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Back",
                      style:
                          GoogleFonts.montserrat(fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
