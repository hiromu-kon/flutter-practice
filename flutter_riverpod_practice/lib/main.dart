import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod_practice/app.dart';
import 'package:flutter_riverpod_practice/firebase_options.dart';

void main() async {
  const isEmulator = bool.fromEnvironment('IS_EMULATOR');

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (isEmulator) {
    print('start(isEmulator: $isEmulator)');

    const localhost = 'localhost';
    FirebaseFirestore.instance.useFirestoreEmulator(localhost, 8080);

    await Future.wait(
      [
        FirebaseAuth.instance.useAuthEmulator(localhost, 9099),
        FirebaseStorage.instance.useStorageEmulator(localhost, 9199),
      ],
    );
  }

  runApp(const App());
}
