import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:music_player/core/constant/color_cons.dart';
import 'package:music_player/core/sound_info.dart';
import 'package:music_player/widgets/list_row.dart';
import 'package:music_player/widgets/musicplayer_appbar.dart';

import 'music_player.dart';

class MusicList extends StatelessWidget {
  const MusicList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Info inf = Info();
    return Scaffold(
      backgroundColor: ColorCons.primary,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MyAppBar(
              title: "Music Player",
              subTitle: "Your music list...",
            ),
            Expanded(
              child: FutureBuilder<List<SongInfo>>(
                future: inf.inf(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<SongInfo>? data = snapshot.data;
                    return ListView.builder(
                        itemCount: data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        MusicPlayer(info: data[index],list: data,sarki: index,))),
                            child: ListRow(
                              inf: data[index],
                            ),
                          );
                        });
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
