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
    apiKey: 'AIzaSyCHdsMYc3mbTWD9Eo-wKUWj2M2XnJ-jmDs',
    appId: '1:33023341381:web:737bf704b44ec5112ec42c',
    messagingSenderId: '33023341381',
    projectId: 'gaza-donations-app',
    authDomain: 'gaza-donations-app.firebaseapp.com',
    storageBucket: 'gaza-donations-app.appspot.com',
    measurementId: 'G-Q8793CNK4F',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDQOWgi2V7_V4HYEwHyx-YaFVjIjkluPEA',
    appId: '1:33023341381:android:c332f535b7f7d4532ec42c',
    messagingSenderId: '33023341381',
    projectId: 'gaza-donations-app',
    storageBucket: 'gaza-donations-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCnNgHGUPj7QFbyNFeY7x0z_qgg5f2JRmA',
    appId: '1:33023341381:ios:51e5923fb6ceff282ec42c',
    messagingSenderId: '33023341381',
    projectId: 'gaza-donations-app',
    storageBucket: 'gaza-donations-app.appspot.com',
    iosBundleId: 'com.example.ghazaDonationsApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCnNgHGUPj7QFbyNFeY7x0z_qgg5f2JRmA',
    appId: '1:33023341381:ios:51e5923fb6ceff282ec42c',
    messagingSenderId: '33023341381',
    projectId: 'gaza-donations-app',
    storageBucket: 'gaza-donations-app.appspot.com',
    iosBundleId: 'com.example.ghazaDonationsApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCHdsMYc3mbTWD9Eo-wKUWj2M2XnJ-jmDs',
    appId: '1:33023341381:web:1c3c18ec87fa35b62ec42c',
    messagingSenderId: '33023341381',
    projectId: 'gaza-donations-app',
    authDomain: 'gaza-donations-app.firebaseapp.com',
    storageBucket: 'gaza-donations-app.appspot.com',
    measurementId: 'G-MZPVRL34T2',
  );
}
