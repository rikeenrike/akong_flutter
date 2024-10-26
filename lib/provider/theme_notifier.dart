import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeNotifier extends StateNotifier<Brightness> {
  ThemeNotifier() : super(Brightness.light);

  void toggleTheme() {
    state = state == Brightness.light ? Brightness.dark : Brightness.light;
  }
}

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, Brightness>(
  (ref) => ThemeNotifier(),
);