import 'package:flutter/material.dart';
import 'package:messmate_user/feature/auth/screens/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../core/constants/imageconstant.dart';
import '../homescreen/screens/home_screen.dart';
import 'onboarding.dart';
String? name;
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  navigation() {
    Future.delayed(const Duration(seconds: 3)).then(
      (value) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const OnBoardingPage(),
            ));
      },
    );
  }

navi(){
    Future.delayed(Duration(
      seconds:4
    )).then((value) async {
      final SharedPreferences prefs=await SharedPreferences.getInstance();
      name= prefs.getString('name')??'';
      name!.isNotEmpty? Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreen(),), (route) => false,):
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnBoardingPage(),));
    },);
}

  @override
  void initState() {
    // TODO: implement initState
    // navigation();
    super.initState();
    navi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(ImageConstant.logo),
      ),
    );
  }
}
