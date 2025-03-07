/*
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
     apiKey: "AIzaSyBEFtDnp-8uXYwZkPuYW7I2UL2IBEPfmV0",
  authDomain: "passwordgen-58bf3.firebaseapp.com",
  databaseURL: "https://passwordgen-58bf3-default-rtdb.firebaseio.com",
  projectId: "passwordgen-58bf3",
  storageBucket: "passwordgen-58bf3.firebasestorage.app",
  messagingSenderId: "975042129663",
  appId: "1:975042129663:web:f99ff16d4b1825e602a6ca",
  measurementId: "G-GZ99JVEGRR"
  );

  static const FirebaseOptions android = FirebaseOptions(
     apiKey: "AIzaSyBEFtDnp-8uXYwZkPuYW7I2UL2IBEPfmV0",
  authDomain: "passwordgen-58bf3.firebaseapp.com",
  databaseURL: "https://passwordgen-58bf3-default-rtdb.firebaseio.com",
  projectId: "passwordgen-58bf3",
  storageBucket: "passwordgen-58bf3.firebasestorage.app",
  messagingSenderId: "975042129663",
  appId: "1:975042129663:web:f99ff16d4b1825e602a6ca",
  measurementId: "G-GZ99JVEGRR"
  );

  static const FirebaseOptions ios = FirebaseOptions(
     apiKey: "AIzaSyBEFtDnp-8uXYwZkPuYW7I2UL2IBEPfmV0",
  authDomain: "passwordgen-58bf3.firebaseapp.com",
  databaseURL: "https://passwordgen-58bf3-default-rtdb.firebaseio.com",
  projectId: "passwordgen-58bf3",
  storageBucket: "passwordgen-58bf3.firebasestorage.app",
  messagingSenderId: "975042129663",
  appId: "1:975042129663:web:f99ff16d4b1825e602a6ca",
  measurementId: "G-GZ99JVEGRR"
  );

  static const FirebaseOptions macos = FirebaseOptions(
     apiKey: "AIzaSyBEFtDnp-8uXYwZkPuYW7I2UL2IBEPfmV0",
  authDomain: "passwordgen-58bf3.firebaseapp.com",
  databaseURL: "https://passwordgen-58bf3-default-rtdb.firebaseio.com",
  projectId: "passwordgen-58bf3",
  storageBucket: "passwordgen-58bf3.firebasestorage.app",
  messagingSenderId: "975042129663",
  appId: "1:975042129663:web:f99ff16d4b1825e602a6ca",
  measurementId: "G-GZ99JVEGRR"
  );
}
*/

// File generated manually based on provided Google service files.
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
          'DefaultFirebaseOptions have not been configured for Windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for Linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: "AIzaSyBEFtDnp-8uXYwZkPuYW7I2UL2IBEPfmV0",
    authDomain: "passwordgen-58bf3.firebaseapp.com",
    databaseURL: "https://passwordgen-58bf3-default-rtdb.firebaseio.com",
    projectId: "passwordgen-58bf3",
    storageBucket: "passwordgen-58bf3.appspot.com",
    messagingSenderId: "975042129663",
    appId: "1:975042129663:web:f99ff16d4b1825e602a6ca",
    measurementId: "G-GZ99JVEGRR",
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: "AIzaSyBS6SDg4Rev7nmxOzWNKLC7uUXWl5VhgWE",
    authDomain: "passwordgen-58bf3.firebaseapp.com",
    databaseURL: "https://passwordgen-58bf3-default-rtdb.firebaseio.com",
    projectId: "passwordgen-58bf3",
    storageBucket: "passwordgen-58bf3.appspot.com",
    messagingSenderId: "975042129663",
    appId: "1:975042129663:android:3eaa864563eab24b02a6ca",
    measurementId: null, // Firebase for Android might not include this
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: "AIzaSyBDEMYksVsv7sSbSXriACK-yEhLt9fhchg",
    authDomain: "passwordgen-58bf3.firebaseapp.com",
    databaseURL: "https://passwordgen-58bf3-default-rtdb.firebaseio.com",
    projectId: "passwordgen-58bf3",
    storageBucket: "passwordgen-58bf3.appspot.com",
    messagingSenderId: "975042129663",
    appId: "1:975042129663:ios:1a12bd02e68b3a4402a6ca",
    measurementId: null, // Firebase for iOS might not include this
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: "AIzaSyBDEMYksVsv7sSbSXriACK-yEhLt9fhchg",
    authDomain: "passwordgen-58bf3.firebaseapp.com",
    databaseURL: "https://passwordgen-58bf3-default-rtdb.firebaseio.com",
    projectId: "passwordgen-58bf3",
    storageBucket: "passwordgen-58bf3.appspot.com",
    messagingSenderId: "975042129663",
    appId: "1:975042129663:ios:1a12bd02e68b3a4402a6ca",
    measurementId: null, // Firebase for macOS might not include this
  );
}
