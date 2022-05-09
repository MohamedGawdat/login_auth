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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB9UerZiV7f-CZxJEu4d9jXCNhKI25RQAU',
    appId: '1:593352975406:android:abbfef3ccc21cd958a6bbf',
    messagingSenderId: '593352975406',
    projectId: 'auth-login-inter',
    storageBucket: 'auth-login-inter.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDfrVs7zPGzIPIm_xIVcOtVXDbPq0x5aGo',
    appId: '1:593352975406:ios:055fa6eafd5d1b418a6bbf',
    messagingSenderId: '593352975406',
    projectId: 'auth-login-inter',
    storageBucket: 'auth-login-inter.appspot.com',
    iosClientId: '593352975406-dn3ghocfghut0p8ep8d6vr14id2mgv7m.apps.googleusercontent.com',
    iosBundleId: 'com.example.authLogin',
  );
}