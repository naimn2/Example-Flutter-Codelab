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
    apiKey: 'AIzaSyAu1DOVGFSkDDVKLwgFtFTyvn6sshkjcBI',
    appId: '1:1074847806588:web:48d33883ae57f6d81305f9',
    messagingSenderId: '1074847806588',
    projectId: 'example-flutter-extend',
    authDomain: 'example-flutter-extend.firebaseapp.com',
    storageBucket: 'example-flutter-extend.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAVLSrkVwW7XE0kQKVSV9fsDaHD--aKXy4',
    appId: '1:1074847806588:android:28006558f67e6cf61305f9',
    messagingSenderId: '1074847806588',
    projectId: 'example-flutter-extend',
    storageBucket: 'example-flutter-extend.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB9Hd2TAAA9EN48NdkP95KA8MxyXxpZZKc',
    appId: '1:1074847806588:ios:45ccb1181bf866dc1305f9',
    messagingSenderId: '1074847806588',
    projectId: 'example-flutter-extend',
    storageBucket: 'example-flutter-extend.appspot.com',
    iosClientId: '1074847806588-psoeu6gdj5e5i6h8g0qb0jee650kpnc9.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB9Hd2TAAA9EN48NdkP95KA8MxyXxpZZKc',
    appId: '1:1074847806588:ios:45ccb1181bf866dc1305f9',
    messagingSenderId: '1074847806588',
    projectId: 'example-flutter-extend',
    storageBucket: 'example-flutter-extend.appspot.com',
    iosClientId: '1074847806588-psoeu6gdj5e5i6h8g0qb0jee650kpnc9.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplication1',
  );
}
