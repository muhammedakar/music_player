import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_player/screen/music_list.dart';

void main() {
  runApp(
    const ProviderScope(child: MaterialApp(debugShowCheckedModeBanner: false, home: MusicList())),
  );
}
