import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
Future<String> getUserName(String userId) async {
  try {
    DocumentSnapshot userDoc =
        await firestore.collection('users').doc(userId).get();
    if (userDoc.exists) {
      return userDoc.get('name');
    } else {
      log('User document not found.');
      return '';
    }
  } catch (e) {
    log('Error fetching user name: $e');
    rethrow;
  }
}
Future<String> getUserEmail(String userId) async {
  try {
    DocumentSnapshot userDoc =
    await firestore.collection('users').doc(userId).get();
    if (userDoc.exists) {
      return userDoc.get('email');
    } else {
      log('User document not found.');
      return '';
    }
  } catch (e) {
    log('Error fetching user name: $e');
    rethrow;
  }
}
Future<String> getUserPhone(String userId) async {
  try {
    DocumentSnapshot userDoc =
    await firestore.collection('users').doc(userId).get();
    if (userDoc.exists) {
      return userDoc.get('phone');
    } else {
      log('User document not found.');
      return '';
    }
  } catch (e) {
    log('Error fetching user name: $e');
    rethrow;
  }
}
Future<String> getUserAddress(String userId) async {
  try {
    DocumentSnapshot userDoc =
    await firestore.collection('users').doc(userId).get();
    if (userDoc.exists) {
      return userDoc.get('address');
    } else {
      log('User document not found.');
      return '';
    }
  } catch (e) {
    log('Error fetching user name: $e');
    rethrow;
  }
}
Future<String> getUserImage(String userId) async {
  try {
    DocumentSnapshot userDoc =
    await firestore.collection('users').doc(userId).get();
    if (userDoc.exists) {
      return userDoc.get('image');
    } else {
      log('User document not found.');
      return '';
    }
  } catch (e) {
    log('Error fetching user name: $e');
    rethrow;
  }
}
