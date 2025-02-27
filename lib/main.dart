
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:messmate_user/feature/homescreen/bottonnav.dart';

import 'feature/auth/signup_page.dart';
import 'feature/homescreen/cart.dart';
import 'core/localvariables.dart';
import 'feature/homescreen/home_screen.dart';
import 'feature/homescreen/location.dart';
import 'feature/plans/payment/payment.dart';
import 'feature/plans/screens/checkout.dart';
import 'feature/splashscreen/splashcreen.dart';
import 'firebase_options.dart';


Future<void> main() async {
 WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
 runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override

  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
