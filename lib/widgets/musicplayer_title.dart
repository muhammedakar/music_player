import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_player/core/riverpod/music_title_rp.dart';

import '../core/constant/color_cons.dart';

class MusicPlTitle extends ConsumerWidget {
  const MusicPlTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    return Column(
      children: [
        Center(
          child: AutoSizeText(
            ref.watch(musicTitle.state).state,
            overflow: TextOverflow.fade,
            maxLines: 1,
            style: GoogleFonts.varelaRound(
              color: ColorCons.txtColor,
              fontSize: 38,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
