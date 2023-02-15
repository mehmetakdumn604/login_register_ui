import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

final _auth = FirebaseAuth.instance;

class AuhtService {
  static Future<void> forgotYourPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      log(e.toString());
    }
  }
}
