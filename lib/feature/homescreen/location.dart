import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:google_fonts/google_fonts.dart';
import 'package:messmate_user/core/constants/colorconstant.dart';
import 'package:messmate_user/core/constants/firebaseConstants.dart';
import 'package:messmate_user/core/localvariables.dart';
import 'package:messmate_user/model/address_model.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  TextEditingController houseNameController = TextEditingController();
  TextEditingController roadNameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool selectedAddress = false;
  String selectedOption = "Home";
  String currentAddress = "Fetching location...";
  List<String> States = [
    "Goa",
    "Gujarat",
    "Karnataka",
    "Kerala",
    "Madhya Pradesh",
    "Maharashtra",
    "Odisha",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
  ];
  String? dropdownvalue;

  addAddress() {
    if (formKey.currentState!.validate()) {
      AddressModel addressModel = AddressModel(
          Housename: houseNameController.text,
          Roadname: roadNameController.text,
          state: dropdownvalue.toString(),
          city: cityController.text,
          pincode: pinCodeController.text,
          id: "",
          radioValue: selectedOption);
      FirebaseFirestore.instance
          .collection(FirebaseConstant.address)
          .add(addressModel.tomap())
          .then(
        (value) {
          value.update({'id': value.id});
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
              "address added successful",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.green,
          ));
          houseNameController.clear();
          roadNameController.clear();
          cityController.clear();
          pinCodeController.clear();
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "no address added",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ));
    }
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  Future<void> getLocation() async {
    try {
      geo.LocationPermission permission =
          await geo.Geolocator.checkPermission();
      if (permission == geo.LocationPermission.denied ||
          permission == geo.LocationPermission.deniedForever) {
        permission = await geo.Geolocator.requestPermission();
      }

      geo.Position position = await geo.Geolocator.getCurrentPosition(
          desiredAccuracy: geo.LocationAccuracy.high);

      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      Placemark place = placemarks[0];
      setState(() {
        currentAddress = "${place.locality}, ${place.country}";
      });
    } catch (e) {
      print(e);
      setState(() {
        currentAddress = "Could not fetch location.";
      });
    }
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
            decoration: const InputDecoration(
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
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection(FirebaseConstant.address)
                .snapshots()
                .map((snapshot) {
              return snapshot.docs
                  .map((doc) =>
                      AddressModel.fromMap(doc.data() as Map<String, dynamic>))
                  .toList();
            }),
            builder: (BuildContext context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              final addresses = snapshot.data!;
              return SizedBox(
                height: height * 0.87,
                width: width,
                child: Form(
                  key: formKey,
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
                            fontWeight: FontWeight.w700,
                            fontSize: width * 0.05),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            final address = addresses[index];
                            return Dismissible(
                              key: Key("item1"),
                              onDismissed: (direction) {
                                print("an item one dismissed");
                              },
                              direction: DismissDirection.horizontal,
                              background: Container(
                                color: Colors.red,
                                alignment: Alignment.centerRight,
                                padding: EdgeInsets.only(right: width * 0.03),
                                child: Icon(Icons.delete),
                              ),
                              child: ListTile(
                                title: Text(address.radioValue),
                                subtitle:
                                    Text("${address.city},${address.Roadname}"),
                                leading: Icon(
                                  Icons.location_on_outlined,
                                  size: width * 0.09,
                                  color: ColorConstant.defaultColor,
                                ),
                                trailing: Radio(
                                  value: true,
                                  groupValue: selectedAddress,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      selectedAddress = value!;
                                    });
                                  },
                                ),
                              ),
                            );
                          },
                          itemCount: addresses.length,
                        ),
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.add_location_alt_outlined),
                          Text(
                            "Add new address",
                            style: GoogleFonts.montserrat(
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w600,
                                fontSize: width * 0.04),
                          )
                        ],
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.search,
                        keyboardType: TextInputType.text,
                        controller: houseNameController,
                        validator: (value) {
                          if (value!.isEmpty || value == null) {
                            return "please enter house name";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            labelText: "House name",
                            hintText: "House name/Building name",
                            labelStyle: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600),
                            border: const OutlineInputBorder(),
                            focusedBorder: const OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.search,
                        keyboardType: TextInputType.text,
                        controller: roadNameController,
                        validator: (value) {
                          if (value!.isEmpty || value == null) {
                            return "please enter road name";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          labelText: "Road name",
                          labelStyle: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600),
                          border: const OutlineInputBorder(),
                          focusedBorder: const OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: TextFormField(
                                maxLength: 6,
                                controller: pinCodeController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter a pincode";
                                  } else if (!RegExp(r'^[0-9]{6}$')
                                      .hasMatch(value)) {
                                    return "Enter a valid 6-digit pincode";
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
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
                                controller: cityController,
                                validator: (value) {
                                  if (value!.isEmpty || value == null) {
                                    return "please enter city name";
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: const InputDecoration(
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
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(width * 0.01),
                                    border: Border.all(
                                        color: ColorConstant.defaultColor
                                            .withOpacity(0.5))),
                                child: DropdownButton(
                                  hint: Text("select state"),
                                  icon:
                                      Icon(Icons.keyboard_arrow_down_outlined),
                                  value: dropdownvalue,
                                  items: States.map((value) {
                                    return DropdownMenuItem(
                                      child: Text(
                                        value,
                                        style: GoogleFonts.almarai(
                                            fontWeight: FontWeight.w500),
                                      ),
                                      value: value,
                                    );
                                  }).toList(),
                                  onChanged: (newvalue) {
                                    setState(() {
                                      dropdownvalue = newvalue.toString();
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    getLocation();
                                  },
                                  child: Container(
                                    height: height * 0.06,
                                    width: width * 0.3,
                                    decoration: BoxDecoration(
                                        color: ColorConstant.primaryColor,
                                        borderRadius: BorderRadius.circular(
                                            width * 0.04)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        const Icon(
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
                          const Text("Home"),
                          Radio<String>(
                            value: "Office",
                            groupValue: selectedOption,
                            onChanged: (value) {
                              setState(() {
                                selectedOption = value!;
                              });
                            },
                          ),
                          const Text("Office"),
                          Radio<String>(
                            value: "Other",
                            groupValue: selectedOption,
                            onChanged: (value) {
                              setState(() {
                                selectedOption = value!;
                              });
                            },
                          ),
                          const Text("Other"),
                        ],
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () {
                            addAddress();
                          },
                          child: Container(
                            height: height * 0.07,
                            width: width * 0.8,
                            decoration: BoxDecoration(
                                color: ColorConstant.primaryColor,
                                borderRadius:
                                    BorderRadius.circular(width * 0.09)),
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
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Text(currentAddress)
                          // _locationData != null
                          //         ? Text("Latitude: ${_locationData!.latitude}\n"
                          //         "Longitude: ${_locationData!.longitude}")
                          //         : Text("Press the button to get location"),
                          )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
