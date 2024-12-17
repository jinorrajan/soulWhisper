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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyC1-NBOHKzAUEQQOO594a6EAH2i5PcrSfw',
    appId: '1:893550965833:web:b9bb4cf7d7502e1940fb98',
    messagingSenderId: '893550965833',
    projectId: 'soulwhisper-8c36a',
    authDomain: 'soulwhisper-8c36a.firebaseapp.com',
    storageBucket: 'soulwhisper-8c36a.firebasestorage.app',
    measurementId: 'G-X1R2KMTTTY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBVWcxGeM3vbsuEJVgNGFcLg5OT6W6rAYM',
    appId: '1:893550965833:android:1948a77bac87817240fb98',
    messagingSenderId: '893550965833',
    projectId: 'soulwhisper-8c36a',
    storageBucket: 'soulwhisper-8c36a.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA7ePTIJ62nCQjotuLpRo-0T9XO_tHvPBc',
    appId: '1:893550965833:ios:4ad86d0286ba5fda40fb98',
    messagingSenderId: '893550965833',
    projectId: 'soulwhisper-8c36a',
    storageBucket: 'soulwhisper-8c36a.firebasestorage.app',
    iosBundleId: 'com.example.soulwhisper',
  );
}
