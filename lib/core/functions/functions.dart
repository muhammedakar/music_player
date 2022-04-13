
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

class Func {
  void seekToSec(int sec, AudioPlayer _player) {
    Duration newPos = Duration(seconds: sec);
    _player.seek(newPos);
  }
}
