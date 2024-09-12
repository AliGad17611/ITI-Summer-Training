import 'dart:developer';
import 'package:e_commerce/helper/check_email_is_exist.dart';
import 'package:e_commerce/helper/shared_prefrence.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Method to handle user login
  Future<UserCredential> loginUser({
    required String emailAddress,
    required String password,
    required BuildContext context, // Added context parameter
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      String uid = userCredential.user!.uid;
      saveUserId(uid);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      log('Firebase Auth Exception: ${e.message}');
      if (e.code == 'invalid-credential') {
        if (await checkEmail(emailAddress)) {
          throw 'The password is invalid. Please Enter a correct password.';
        } else {
          throw 'The email address have not been registered.';
        }
      } else {
        throw 'Please enter a valid email address and password';
      }
    }
  }
}
