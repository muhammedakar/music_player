import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:music_player/core/constant/color_cons.dart';
import 'package:music_player/widgets/cover_image.dart';
import 'package:music_player/widgets/musicplayer_appbar.dart';
import 'package:music_player/widgets/musicplayer_title.dart';
import 'package:music_player/widgets/player.dart';

class MusicPlayer extends StatefulWidget {
  final SongInfo info;
  final List<SongInfo> list;
  final int sarki;
  const MusicPlayer({Key? key, required this.info, required this.list, required this.sarki})
      : super(key: key);

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: ColorCons.primary,
        systemNavigationBarDividerColor: ColorCons.primary,
      ),
    );
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: [
              ColorCons.primary,
              ColorCons.inActive,
            ])),
        child: Padding(
          padding: const EdgeInsets.only(top: 48),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MyAppBar(
                title: "Music Beats",
                subTitle: "Listen your favorite music",
              ),
              const CoverImage(),
              const MusicPlTitle(),
              PlayerRow(
                list: widget.list,
                sarki: widget.sarki,
              )
            ],
          ),
        ),
      ),
    );
  }
}
