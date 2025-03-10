import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:messmate_user/core/constants/colorconstant.dart';
import 'package:messmate_user/feature/chat/screen/chatwithbot.dart';
import 'package:messmate_user/feature/homescreen/screens/explore.dart';
import 'package:messmate_user/feature/profile/profilepage.dart';

import '../../../core/localvariables.dart';
import 'home_screen.dart';

class BottomNaviPage extends StatefulWidget {
  const BottomNaviPage({super.key});

  @override
  _BottomNaviPageState createState() => _BottomNaviPageState();
}

class _BottomNaviPageState extends State<BottomNaviPage> {
  int selectedIndex = 0;
  List pages = [
    const HomeScreen(),
    const ExplorePage(),
    const ChatScreen(),
    const ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      backgroundColor: ColorConstant.whiteColor,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(width * 0.1),
            color: ColorConstant.whiteColor,
            // boxShadow: [
            //   BoxShadow(
            //     blurRadius: 5,
            //     color: ColorConstant.primaryColor.withOpacity(0.5),
            //   )
            // ],
            gradient: LinearGradient(
              colors: [Colors.green.shade50, Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0.1, 0.4],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                // rippleColor: Colors.grey[300]!,
                // hoverColor: Colors.grey[100]!,
                gap: width * 0.01,
                activeColor: ColorConstant.primaryColor,
                iconSize: width * 0.06,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: const Duration(milliseconds: 400),
                tabBackgroundColor: Colors.green.shade50,
                tabActiveBorder: Border.all(color: ColorConstant.primaryColor),
                color: ColorConstant.primaryColor,
                tabs: const [
                  GButton(
                    icon: Icons.home_outlined,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.explore,
                    text: 'Explore',
                  ),
                  GButton(
                    // icon: Icons.chat,
                    icon: Icons.chat,
                    text: 'chat',
                  ),
                  GButton(
                    icon: Icons.person_outline,
                    text: 'Profile',
                  ),
                ],
                selectedIndex: selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
