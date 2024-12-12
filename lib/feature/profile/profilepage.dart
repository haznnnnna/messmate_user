import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:messmate_user/main.dart';

import '../../core/constants/colorconstant.dart';
import '../../core/constants/imageconstant.dart';
import '../../core/localvariables.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      appBar: AppBar(
        backgroundColor: ColorConstant.whiteColor,
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.all(width*0.05),
        child: Column(
          children: [
            Container(
              height: height * 0.3,
              width: width,
              decoration: BoxDecoration(
                color: ColorConstant.whiteColor,
                borderRadius: BorderRadius.circular(width * 0.02),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 4,
                      spreadRadius: 2,
                      offset: Offset(4, 4))
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.topRight,
                        child: SvgPicture.asset(SvgConstants.editProfile)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              radius: width * 0.17,
                              backgroundImage:
                                  const AssetImage(ImageConstant.profile),
                            ),
                            SizedBox(
                                height: height * 0.16,
                                width: width * 0.32,
                                child: Align(
                                    alignment: Alignment.bottomRight,
                                    child:
                                        SvgPicture.asset(SvgConstants.camera)))
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Alexa",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("+93-53696246"),
                            Text("village, Bangalore"),
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("83 kg\nheight"),
                        SizedBox(
                            height: 50,
                            child: VerticalDivider(
                              color: ColorConstant.primaryColor,
                            )),
                        Text("170 m\nWeight"),
                        SizedBox(
                            height: 50,
                            child: VerticalDivider(
                              color: ColorConstant.primaryColor,
                            )),
                        Text("24 \n BMI"),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
