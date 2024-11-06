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
    apiKey: 'AIzaSyCbqwLVAvuzf30nN0dknC0nanBOb0oBeo4',
    appId: '1:85326888153:web:aa38f2903423eb89cb92c8',
    messagingSenderId: '85326888153',
    projectId: 'anilabapp',
    authDomain: 'anilabapp.firebaseapp.com',
    storageBucket: 'anilabapp.firebasestorage.app',
    measurementId: 'G-YE48VZ7F7Y',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD9OgN-KFl5qiHve7C-QwI1hoLhWcgKLjA',
    appId: '1:85326888153:android:a0a5d95e9bdf045ccb92c8',
    messagingSenderId: '85326888153',
    projectId: 'anilabapp',
    storageBucket: 'anilabapp.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDU9TThLec5QQI2vADNmPOMQICewwtnhG8',
    appId: '1:85326888153:ios:dffe3fe6d98516a9cb92c8',
    messagingSenderId: '85326888153',
    projectId: 'anilabapp',
    storageBucket: 'anilabapp.firebasestorage.app',
    iosBundleId: 'com.example.anilabApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDU9TThLec5QQI2vADNmPOMQICewwtnhG8',
    appId: '1:85326888153:ios:dffe3fe6d98516a9cb92c8',
    messagingSenderId: '85326888153',
    projectId: 'anilabapp',
    storageBucket: 'anilabapp.firebasestorage.app',
    iosBundleId: 'com.example.anilabApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCbqwLVAvuzf30nN0dknC0nanBOb0oBeo4',
    appId: '1:85326888153:web:32b3f5f7767f4ce6cb92c8',
    messagingSenderId: '85326888153',
    projectId: 'anilabapp',
    authDomain: 'anilabapp.firebaseapp.com',
    storageBucket: 'anilabapp.firebasestorage.app',
    measurementId: 'G-8C05SJ9DGF',
  );
}
