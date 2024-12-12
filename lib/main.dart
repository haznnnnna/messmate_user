
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:messmate_user/profilepage.dart';
import 'package:messmate_user/signup_login/goal.dart';
import 'package:messmate_user/signup_login/login_page.dart';
import 'package:messmate_user/signup_login/loginsignup.dart';
import 'package:messmate_user/splashcreen.dart';

import 'firebase_options.dart';
import 'otpscreen.dart';
var height;
var width;

Future<void> main() async {
 WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
 runApp(MyApp());
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
