import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:messmate_user/core/constants/colorconstant.dart';

import '../../../core/localvariables.dart';


class PaymentConfirm extends StatefulWidget {
  const PaymentConfirm({super.key});

  @override
  State<PaymentConfirm> createState() => _PaymentConfirmState();
}

class _PaymentConfirmState extends State<PaymentConfirm> {
  final AudioPlayer audioPlayer = AudioPlayer();

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("🔊 Trying to play sound...");
    _playSuccessSound();
  }
  void _playSuccessSound() async {
    try {
      print("🔊 Trying to play sound...");
      await audioPlayer.play(AssetSource('sounds/new-notification-138807.mp3'));
    } catch (e) {
      print("Error playing sound: $e");
    }
  }// Play success sound

  void dispose() {
    audioPlayer.dispose(); // Clean up the audio player
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.whiteColor,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
            child: Icon(Icons.arrow_back_ios_new_sharp)),
      ),
      backgroundColor: ColorConstant.whiteColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: "payment_icon",
              child: Lottie.asset(
                'assets/lottie/Animation - 1739168160500.json', // Lottie file path
                width: 150,
                height: 150,
                repeat: false, // Play animation only once
              ),
            ),
            Text("Payment Successful",
                style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w500,color: ColorConstant.defaultColor)),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.pop(context); // Go back to payment page
            //   },
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: ColorConstant.primaryColor,
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //   ),
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            //     child: Text("OK", style: TextStyle(color: Colors.white)),
            //   ),
            // ),
          ],
        ),
      ),
    );

  }
}
