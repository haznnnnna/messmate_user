import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ChoosePlans extends StatefulWidget {
  const ChoosePlans({super.key});

  @override
  State<ChoosePlans> createState() => _ChoosePlansState();
}

class _ChoosePlansState extends State<ChoosePlans> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
       // leading: SvgPicture.asset(assetName),
        centerTitle: true,
        title: Text("Choose plans",style: GoogleFonts.montserrat(
          fontWeight: FontWeight.bold,
        ),),
      )
    );
  }
}
