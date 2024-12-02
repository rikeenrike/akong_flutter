import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import './firebase_options.dart';
import './provider/theme_notifier.dart';
import './ui/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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