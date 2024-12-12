import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/localvariables.dart';



class Splashscreen5 extends StatefulWidget {
  const Splashscreen5({super.key});

  @override
  State<Splashscreen5> createState() => _Splashscreen5State();
}

class _Splashscreen5State extends State<Splashscreen5> {
  bool change=true;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor:  Color(0xffFFFFFF),
      body: Padding(
        padding:  EdgeInsets.all(width*0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: height*0.37,
            ),
            Text('Messmate',style: GoogleFonts.anton(
                fontWeight: FontWeight.w900,
              fontSize: 36,
              color: Color(0xff40A94C)
            ),),
            SizedBox(height: height*0.016,),
            Text('Lorem ipsum dolor sit amet consectetur.\nNisl cras ultrices aliquet ut porttitor. Risus tellus',
              textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w500,
                fontSize: 13.5,
                color: Color(0xff444444)
            ),),
            SizedBox(height: height*0.04,),
            GestureDetector(
              onTap: () {
               setState(() {
                 change=true;
               });
              },
              child: Container(
                height: height*0.062,
                width: width*0.7,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xff40A94C) ,
                    width: 2
                  ),
                  color: change? Color(0xff40A94C):Color(0xffFFFFFF),
                  borderRadius: BorderRadius.circular(width*0.07),
                ),
                child: Center(child: Text('Login',style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color:change? Color(0xffFFFFFF):Color(0xff40A94C)
                ),)),
              ),
            ),
            SizedBox(height: height*0.004,),
            Text('or',style: TextStyle(
              fontWeight: FontWeight.w300,
                fontSize: 16,
                color: Color(0xff444444).withOpacity(0.5)
            ),),
            SizedBox(height: height*0.004,),
            GestureDetector(
              onTap: () {
                setState(() {
                  change=false;
                });
              },
              child: Container(
                height: height*0.062,
                width: width*0.7,
                decoration: BoxDecoration(
                  color:change? Color(0xffFFFFFF): Color(0xff40A94C) ,
                  borderRadius: BorderRadius.circular(width*0.07),
                  border: Border.all(
                      color: Color(0xff40A94C) ,
                      width: 2
                  ),
                ),
                child: Center(child: Text('Sign up',style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color:change?Color(0xff40A94C): Color(0xffFFFFFF)
                ),)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
