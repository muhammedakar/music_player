
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player/core/functions/functions.dart';

import '../core/constant/color_cons.dart';

class TimeSlider extends StatelessWidget {
  final Duration position;
  final Duration musicLenght;
  final AudioPlayer player;
  const TimeSlider(
      {Key? key,
      required this.position,
      required this.musicLenght,
      required this.player})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Func func = Func();
    return Slider(
      
      value: position.inSeconds.toDouble(),
      activeColor: ColorCons.iconColor,
      inactiveColor: ColorCons.buttonColor,
      max: musicLenght.inSeconds.toDouble(),
      onChanged: (value) {
        func. seekToSec(value.toInt(), player);
      },
    );
  }
}
