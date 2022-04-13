

import 'package:flutter_audio_query/flutter_audio_query.dart';

class Info {
  final FlutterAudioQuery audioQuery = FlutterAudioQuery();

  Future<List<SongInfo>> inf() async {
    List<SongInfo> albumList = await audioQuery.getSongs();

    List<SongInfo> list = [];
    for (var i in albumList) {
      if (i.isMusic || i.isRingtone) {
        list.add(i);
      }
    }
    return list;
  }
}
