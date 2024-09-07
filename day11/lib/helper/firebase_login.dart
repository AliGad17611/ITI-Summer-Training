
  import 'package:day11/helper/show_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<UserCredential> loginUser({required String emailAddress, required String password}) async {
    return await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
  }

  void handleFirebaseAuthError(context, FirebaseAuthException e) {
    if (e.code == 'user-not-found') {
      showSnackBar(context, 'No user found for that email.');
    } else if (e.code == 'wrong-password') {
      showSnackBar(context, 'Wrong password, please enter the correct password');
    } else if (e.code == 'invalid-email') {
      showSnackBar(context, 'The email address is not valid.');
    } else if (e.code == 'user-disabled') {
      showSnackBar(context, 'The user account has been disabled.');
    } else {
      showSnackBar(context, 'Something went wrong');
    }
  }
