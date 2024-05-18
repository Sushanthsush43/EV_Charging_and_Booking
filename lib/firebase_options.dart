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

  static FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBs0SIEISWm2WjJjZNJ_8cpIpiADvWLheI',
    appId: '1:934438009739:web:f2c555ca43c0bab7840d8e',
    messagingSenderId: '934438009739',
    projectId: 'sushanth-uber-app',
    authDomain: 'sushanth-uber-app.firebaseapp.com',
    storageBucket: 'sushanth-uber-app.appspot.com',
    measurementId: 'G-NDC4BNZ3JL',
  );

  static FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB3rZ2NspdLxKSVL5AxEXRbPDQVlbcjyTM',
    appId: '1:934438009739:android:615c50fc1612aded840d8e',
    messagingSenderId: '934438009739',
    projectId: 'sushanth-uber-app',
    storageBucket: 'sushanth-uber-app.appspot.com',
  );

  static FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD85km53cMIzhzpfWlO9jY2Xo1sI6suKlw',
    appId: '1:934438009739:ios:d76e90f633063ace840d8e',
    messagingSenderId: '934438009739',
    projectId: 'sushanth-uber-app',
    storageBucket: 'sushanth-uber-app.appspot.com',
    iosBundleId: 'com.example.carUber',
  );

  static FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD85km53cMIzhzpfWlO9jY2Xo1sI6suKlw',
    appId: '1:934438009739:ios:46a35f6cdacab5b6840d8e',
    messagingSenderId: '934438009739',
    projectId: 'sushanth-uber-app',
    storageBucket: 'sushanth-uber-app.appspot.com',
    iosBundleId: 'com.example.carUber.RunnerTests',
  );
}
