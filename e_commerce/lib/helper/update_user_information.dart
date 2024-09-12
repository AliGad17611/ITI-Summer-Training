 import 'package:cloud_firestore/cloud_firestore.dart';

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

Future<void> updateUsername(String userId, String name) async {
  try {
    await _firestore.collection('users').doc(userId).update({'name': name});
    print('User name updated successfully');
  } catch (e) {
    print('Error updating user name: $e');
  }
}
Future<void> updateUserAddress(String userId, String address) async {
  try {
    await _firestore.collection('users').doc(userId).update({'address': address});
    print('User address updated successfully');
  } catch (e) {
    print('Error updating user address: $e');
  }
}
