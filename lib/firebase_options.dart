// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        return macos;
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
    apiKey: 'AIzaSyAEf3RyPjBopBL8BoUuYORtzU6G6aGrVxs',
    appId: '1:476972303494:web:e2159e1fa327f5b8247d07',
    messagingSenderId: '476972303494',
    projectId: 'fir-example-9766e',
    authDomain: 'fir-example-9766e.firebaseapp.com',
    storageBucket: 'fir-example-9766e.appspot.com',
    measurementId: 'G-C0N4731CQQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBZUnDIIeE0KAeCdDjF1IKZ0t07yvZrZ7s',
    appId: '1:476972303494:android:21338fbc4fb5486a247d07',
    messagingSenderId: '476972303494',
    projectId: 'fir-example-9766e',
    storageBucket: 'fir-example-9766e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAkenEkYLwF0UhfCz0tdpqearaRYBh31hE',
    appId: '1:476972303494:ios:b969a13b409e1f92247d07',
    messagingSenderId: '476972303494',
    projectId: 'fir-example-9766e',
    storageBucket: 'fir-example-9766e.appspot.com',
    iosBundleId: 'com.example.firebaseExampleApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAkenEkYLwF0UhfCz0tdpqearaRYBh31hE',
    appId: '1:476972303494:ios:9dc8117cc57241e3247d07',
    messagingSenderId: '476972303494',
    projectId: 'fir-example-9766e',
    storageBucket: 'fir-example-9766e.appspot.com',
    iosBundleId: 'com.example.firebaseExampleApp.RunnerTests',
  );
}
