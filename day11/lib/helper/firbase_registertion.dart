import 'package:day11/helper/show_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<UserCredential> registerUser({required String emailAddress, required String password}) async {
    return await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
  }

  void handleFirebaseAuthError(context, FirebaseAuthException e) {
    if (e.code == 'weak-password') {
      showSnackBar(context, 'The password provided is too weak');
    } else if (e.code == 'invalid-email') {
      showSnackBar(context, 'The email provided is invalid');
    } else if (e.code == 'email-already-in-use') {
      showSnackBar(context, 'The account already exists for that email.');
    } else {
      showSnackBar(context, 'Something went wrong');
    }
  }