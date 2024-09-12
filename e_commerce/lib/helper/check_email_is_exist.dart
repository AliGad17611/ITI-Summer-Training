import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

Future<bool> checkEmail(String email) async {
  bool emailExists = await isEmailInFirestore(email);
  return emailExists;

  }
Future<bool> isEmailInFirestore(String email) async {
  try {
    QuerySnapshot querySnapshot = await _firestore
        .collection('users') // Your collection name
        .where('email', isEqualTo: email) // Field to search
        .get();

    // Check if any documents were returned
    return querySnapshot.docs.isNotEmpty;
  } catch (e) {
    // Handle error
    return false;
  }
}