import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:messmate_user/core/localvariables.dart';

import '../../core/constants/colorconstant.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExploreState();
}

class _ExploreState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: ColorConstant.whiteColor,
        appBar: AppBar(
          backgroundColor: ColorConstant.whiteColor,
          centerTitle: true,
          title: Text(
            "Explore",
            style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            TabBar(
              // isScrollable: true,
              labelStyle: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
              dividerColor: Colors.transparent,
              labelColor: ColorConstant.primaryColor,
              unselectedLabelColor: ColorConstant.indicatorColor,
              indicatorColor: ColorConstant.primaryColor,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Tab(text: "All"),
                Tab(text: "Recipes"),
                Tab(text: "Fitness"),
                Tab(text: "Webinars"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
