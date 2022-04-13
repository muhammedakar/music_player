import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/constant/color_cons.dart';

class MyAppBar extends StatelessWidget {
  final String title;
  final String subTitle;
  const MyAppBar({Key? key, required this.title, required this.subTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Text(
            title,
            style: GoogleFonts.montserrat(
                color: ColorCons.txtColor,
                fontSize: 38,
                fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Text(
            subTitle,
            style: GoogleFonts.montserrat(
                color: ColorCons.txtColor,
                fontSize: 24,
                fontWeight: FontWeight.w400),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
      ],
    );
  }
}
