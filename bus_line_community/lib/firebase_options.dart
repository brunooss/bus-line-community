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
    apiKey: 'AIzaSyBxWu7PWFRdwvFi7GKfJ6ObPUp1KZ-LD_Q',
    appId: '1:494319564758:web:420121f4083f2f4cc11677',
    messagingSenderId: '494319564758',
    projectId: 'bus-line-community',
    authDomain: 'bus-line-community.firebaseapp.com',
    storageBucket: 'bus-line-community.appspot.com',
    measurementId: 'G-6JW5X2Z2ER',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyADezlDQDzu0Aops75YEksaHVpzpSCuv5M',
    appId: '1:494319564758:android:c68ea6a838cf1785c11677',
    messagingSenderId: '494319564758',
    projectId: 'bus-line-community',
    storageBucket: 'bus-line-community.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDQtyW12uKk83lulmorqkt5AhC1yNDSyHU',
    appId: '1:494319564758:ios:494725ad36bdbb0ac11677',
    messagingSenderId: '494319564758',
    projectId: 'bus-line-community',
    storageBucket: 'bus-line-community.appspot.com',
    iosClientId: '494319564758-4fdguf4f3kfl5eqtffo9dkjpo8g8apvt.apps.googleusercontent.com',
    iosBundleId: 'com.example.busLineCommunity',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDQtyW12uKk83lulmorqkt5AhC1yNDSyHU',
    appId: '1:494319564758:ios:494725ad36bdbb0ac11677',
    messagingSenderId: '494319564758',
    projectId: 'bus-line-community',
    storageBucket: 'bus-line-community.appspot.com',
    iosClientId: '494319564758-4fdguf4f3kfl5eqtffo9dkjpo8g8apvt.apps.googleusercontent.com',
    iosBundleId: 'com.example.busLineCommunity',
  );
}