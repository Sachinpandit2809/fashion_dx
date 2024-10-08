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
    apiKey: 'AIzaSyCxasGxlfZnjc5SfNXOGgY284iDM3XEztI',
    appId: '1:630487406759:web:78f8712fb9839a4e63a382',
    messagingSenderId: '630487406759',
    projectId: 'fashion-dx',
    authDomain: 'fashion-dx.firebaseapp.com',
    storageBucket: 'fashion-dx.appspot.com',
    measurementId: 'G-K3DK1TB0KP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDTNQg4lIWRgCE0Vh_khVW_qsr4PJAwzJU',
    appId: '1:630487406759:android:54e3a0d4216d343e63a382',
    messagingSenderId: '630487406759',
    projectId: 'fashion-dx',
    storageBucket: 'fashion-dx.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB_5uxrcgsw3N8MaAVX3qzz0v0CorbU2gE',
    appId: '1:630487406759:ios:5eff27b5e479380763a382',
    messagingSenderId: '630487406759',
    projectId: 'fashion-dx',
    storageBucket: 'fashion-dx.appspot.com',
    iosBundleId: 'com.example.fashionDx',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB_5uxrcgsw3N8MaAVX3qzz0v0CorbU2gE',
    appId: '1:630487406759:ios:5eff27b5e479380763a382',
    messagingSenderId: '630487406759',
    projectId: 'fashion-dx',
    storageBucket: 'fashion-dx.appspot.com',
    iosBundleId: 'com.example.fashionDx',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCxasGxlfZnjc5SfNXOGgY284iDM3XEztI',
    appId: '1:630487406759:web:72790bcdd88daaed63a382',
    messagingSenderId: '630487406759',
    projectId: 'fashion-dx',
    authDomain: 'fashion-dx.firebaseapp.com',
    storageBucket: 'fashion-dx.appspot.com',
    measurementId: 'G-K63BZSNG05',
  );
}
