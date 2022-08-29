import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBDUZ0guwxa_tLDt2KAfgPOmsogFKKede8',
    appId: '1:460883956859:android:d817b5c4b8cdad31f6bede',
    messagingSenderId: '460883956859',
    projectId: 'portfolio-490c0',
    storageBucket: 'flutterfcm-43171.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBpyMImuNl-aRaZytMt4Z41jbKYeUAvM4g',
    appId: '1:188731554366:ios:ea6f2c44d4e1eaeaa62f6f',
    messagingSenderId: '188731554366',
    projectId: 'portfolio-490c0',
    storageBucket: 'flutterfcm-43171.appspot.com',
    iosClientId: '188731554366-93bl0uraepoa3u54b7jmdahnce9mfm0g.apps.googleusercontent.com',
    iosBundleId: 'com.swalisoft.flutter',
  );
}
