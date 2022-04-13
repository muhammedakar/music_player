import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final StateProvider musicTitle = StateProvider<String>((ref) {
  return "";
});

final StateProvider shuffleIcon = StateProvider<IconData>((ref) {
  return Icons.shuffle;
});
final StateProvider playIcon = StateProvider<IconData>((ref) {
  return Icons.play_circle_fill_rounded;
});

