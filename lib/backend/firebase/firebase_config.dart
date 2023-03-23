import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCc0ic8CkivoDxQ-JbElD6siICO-5MX62k",
            authDomain: "matcha-63c18.firebaseapp.com",
            projectId: "matcha-63c18",
            storageBucket: "matcha-63c18.appspot.com",
            messagingSenderId: "786866713000",
            appId: "1:786866713000:web:7ffe12248a7364d8802d9d",
            measurementId: "G-G992PZBZWB"));
  } else {
    await Firebase.initializeApp();
  }
}
