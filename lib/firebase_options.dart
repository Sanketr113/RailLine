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
    apiKey: 'AIzaSyAFfj0XfK8lo1Z5Jv97ZlW0bblQbmDjcME',
    appId: '1:111004468830:web:b32253eb24161d342296cf',
    messagingSenderId: '111004468830',
    projectId: 'railline-e7d77',
    authDomain: 'railline-e7d77.firebaseapp.com',
    storageBucket: 'railline-e7d77.appspot.com',
    measurementId: 'G-5TFQ695QL8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDDsm5l_6byrSwq9Su7cZgaMSC41Y8KCI4',
    appId: '1:111004468830:android:68a3c0953c18ec562296cf',
    messagingSenderId: '111004468830',
    projectId: 'railline-e7d77',
    storageBucket: 'railline-e7d77.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBO9WPzw-N5ry5w0r72-t7Ff4v6ZhgKP40',
    appId: '1:111004468830:ios:76cb14147085a5032296cf',
    messagingSenderId: '111004468830',
    projectId: 'railline-e7d77',
    storageBucket: 'railline-e7d77.appspot.com',
    iosClientId: '111004468830-m55jevnrukjsmos4t1438gvsthsjl6k8.apps.googleusercontent.com',
    iosBundleId: 'com.example.railline',
  );
}
