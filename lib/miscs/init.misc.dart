import 'package:assignment3/controllers/chat.controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

Future<void> init() async {
  log('app init', name: 'app init');
  await Firebase.initializeApp();

  final Chat chatController = Get.put(Chat());

  FirebaseMessaging.onMessage.listen((event) {});

  // log('firestore settings', name: 'firestore init');
  // FirebaseFirestore.instance.settings = const Settings(
  //   host: 'localhost:8080',
  //   sslEnabled: false,
  //   persistenceEnabled: false,
  // );

  // log('auth settings', name: 'auth init');
  // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);

  // log(FirebaseAuth.instance.app.toString(), name: 'auth details, i hope');
  // log(FirebaseFirestore.instance.app.toString(),
  //     name: 'firestore details, i hope');
  // log(Firebase.apps.toString(), name: 'emulator details, i hope');
}
