import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDFJrwzucltkywjSvZFsMZnJR9qAT0c11U",
            authDomain: "nyurats-lph82n.firebaseapp.com",
            projectId: "nyurats-lph82n",
            storageBucket: "nyurats-lph82n.appspot.com",
            messagingSenderId: "775484333845",
            appId: "1:775484333845:web:d2ee2687480b80b85a931c"));
  } else {
    await Firebase.initializeApp();
  }
}
