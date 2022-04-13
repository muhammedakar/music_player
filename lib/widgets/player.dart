import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player/core/riverpod/music_title_rp.dart';
import 'package:music_player/widgets/time_sileder.dart';

import '../core/constant/color_cons.dart';
import '../core/functions/functions.dart';

class PlayerRow extends ConsumerStatefulWidget {
  final List<SongInfo> list;
  final int sarki;
  const PlayerRow({Key? key, required this.list, required this.sarki})
      : super(key: key);

  @override
  ConsumerState<PlayerRow> createState() => _PlayerRowState();
}

class _PlayerRowState extends ConsumerState<PlayerRow> {
  Func func = Func();
  bool playing = false;
  IconData plyBtn = Icons.play_circle_fill_rounded;
  IconData shuffleBtn = Icons.shuffle;
  int index = 0;
  Duration position = const Duration();
  Duration musicLenght = const Duration();
  AudioPlayer? _player;
  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _player!.setShuffleModeEnabled(true);
    _player!.positionStream.listen((Duration d) {
      setState(() {
        position = d;
      });
    });
    _player!.durationStream.listen((Duration? d) {
      musicLenght = d!;
    });
    var sources = widget.list
        .map(
          (e) => AudioSource.uri(Uri.file(e.filePath)),
        )
        .toList();

    _player!.setAudioSource(
        ConcatenatingAudioSource(
            useLazyPreparation: true,
            shuffleOrder: DefaultShuffleOrder(),
            children: sources),
        initialIndex: widget.sarki,
        initialPosition: Duration.zero);

    _player!.currentIndexStream.listen((event) {
      ref.watch(musicTitle.state).state = widget.list[event!].title;
    });
    _player!.playingStream.listen((event) {});
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TimeSlider(
            position: position, musicLenght: musicLenght, player: _player!),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  index++;
                  if (index == 1) {
                    _player!.setLoopMode(LoopMode.all);
                    ref.read(shuffleIcon.state).state = Icons.repeat_rounded;
                  } else if (index == 2) {
                    _player!.setLoopMode(LoopMode.one);
                    ref.read(shuffleIcon.state).state =
                        Icons.repeat_one_rounded;
                  } else {
                    _player!.setShuffleModeEnabled(true);
                    ref.read(shuffleIcon.state).state = Icons.shuffle;
                    index = 0;
                  }
                },
                icon: Icon(ref.watch(shuffleIcon.state).state),
                iconSize: 40,
                color: ColorCons.iconColor),
            IconButton(
                onPressed: () {
                  _player!.seekToPrevious();
                },
                icon: const Icon(Icons.skip_previous_rounded),
                iconSize: 45,
                color: ColorCons.iconColor),
            IconButton(
                onPressed: () {
                  if (!playing) {
                    _player!.play();
                    ref.read(playIcon.state).state = Icons.pause_circle_rounded;
                    playing = true;
                  } else {
                    _player!.stop();

                    ref.read(playIcon.state).state =
                        Icons.play_circle_fill_rounded;
                    playing = false;
                  }
                },
                icon: Icon(
                  ref.watch(playIcon.state).state,
                  color: ColorCons.buttonColor,
                ),
                iconSize: 100,
                color: ColorCons.primary),
            IconButton(
                onPressed: () {
                  _player!.seekToNext();
                },
                icon: const Icon(Icons.skip_next_rounded),
                iconSize: 45,
                color: ColorCons.iconColor),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite_border),
                iconSize: 40,
                color: ColorCons.iconColor),
          ],
        )
      ],
    ));
  }
}
