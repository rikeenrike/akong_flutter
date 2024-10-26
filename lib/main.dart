import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './ui/profile.dart';
import './provider/theme_notifier.dart';
import './ui/home_screen.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final brightness = ref.watch(themeNotifierProvider);

    return CupertinoApp(
      theme: CupertinoThemeData(
        brightness: brightness,
      ),
      home: HomeScreen(),
    );
  }
}