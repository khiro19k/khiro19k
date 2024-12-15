import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDy1qsUFHl9o7VvYVbKteSF-U_uXFYzwGI",
            authDomain: "my-dealyy-c75d2.firebaseapp.com",
            projectId: "my-dealyy-c75d2",
            storageBucket: "my-dealyy-c75d2.appspot.com",
            messagingSenderId: "975128109140",
            appId: "1:975128109140:web:10fb2a2aaccd744c5b8dc1"));
  } else {
    await Firebase.initializeApp();
  }
}
