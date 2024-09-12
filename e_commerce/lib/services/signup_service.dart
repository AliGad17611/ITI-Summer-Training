import 'dart:developer';
import 'package:e_commerce/helper/shared_prefrence.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Method to handle user sign-up
  Future<void> signUp({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    try {
      // Create user with email and password
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      String uid = userCredential.user!.uid;

      // Update the user's display name in Firebase Authentication
      await userCredential.user!.updateDisplayName(name);

      // Save user details to Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'name': name,
        'phone': phone,
        'email': email,
        'favoriteProducts': [],
        'address': '',

        // Initialize an empty list for favorite products
      });

      // Save user ID in SharedPreferences
      saveUserId(uid);
      log('Sign-up successful!');
    } on FirebaseAuthException catch (e) {
      log('Firebase Auth Exception: ${e.message}');
      rethrow; // Rethrow for UI error handling
    } catch (e) {
      log('Error during sign-up: $e');
      throw Exception('Sign-up failed');
    }
  }
}
