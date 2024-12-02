// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

 
/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
/// 
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyC3tpICTaOtRcoZ_FvGoqMlmpAth43959U',
    appId: '1:821643765754:web:34b98aa913eaaad67fe643',
    messagingSenderId: '821643765754',
    projectId: 'payrbays-a58c8',
    authDomain: 'payrbays-a58c8.firebaseapp.com',
    storageBucket: 'payrbays-a58c8.firebasestorage.app',
    measurementId: 'G-XRX0R1G12K',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB-i_aqZvMWgDDxCLo7-wQicRovtbYph08',
    appId: '1:821643765754:android:ac0635b3805c7f457fe643',
    messagingSenderId: '821643765754',
    projectId: 'payrbays-a58c8',
    storageBucket: 'payrbays-a58c8.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCKDgO6ozrWKNJpmmqoFMIKROldzxG4M88',
    appId: '1:821643765754:ios:ef735d48bf9752237fe643',
    messagingSenderId: '821643765754',
    projectId: 'payrbays-a58c8',
    storageBucket: 'payrbays-a58c8.firebasestorage.app',
    iosBundleId: 'com.example.akongFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCKDgO6ozrWKNJpmmqoFMIKROldzxG4M88',
    appId: '1:821643765754:ios:ef735d48bf9752237fe643',
    messagingSenderId: '821643765754',
    projectId: 'payrbays-a58c8',
    storageBucket: 'payrbays-a58c8.firebasestorage.app',
    iosBundleId: 'com.example.akongFlutter',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC3tpICTaOtRcoZ_FvGoqMlmpAth43959U',
    appId: '1:821643765754:web:9358bfb5709174d17fe643',
    messagingSenderId: '821643765754',
    projectId: 'payrbays-a58c8',
    authDomain: 'payrbays-a58c8.firebaseapp.com',
    storageBucket: 'payrbays-a58c8.firebasestorage.app',
    measurementId: 'G-1FEH0VMBTQ',
  );
}
