import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/constant/color_cons.dart';

class ListRow extends StatelessWidget {
  final SongInfo inf;
  const ListRow({Key? key, required this.inf}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8, left: 5, right: 7),
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: const Color(0xFF7986CB),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(9, 9, 9, 9),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset("assets/img/sacrifice.jpg").image,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  inf.title,
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  style: GoogleFonts.poppins(
                    color: ColorCons.txtColor,
                    fontSize: 22,
                  ),
                ),
                AutoSizeText(
                  inf.artist,
                  style: GoogleFonts.poppins(
                    color: ColorCons.txtColor.withOpacity(0.3),
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: IconButton(
              color: ColorCons.txtColor,
              icon: const Icon(Icons.navigate_next_rounded),
              onPressed: () {
                print('IconButton pressed ...');
              },
              iconSize: 60,
            ),
          ),
        ],
      ),
    );
  }
}
