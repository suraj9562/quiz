import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount _user;
  GoogleSignInAccount get user => _user;

  Future googleLogin() async {
    try {
      final googleuser = await googleSignIn.signIn();

      if (googleuser == null) return;
      _user = googleuser;

      final googleAuth = await googleuser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
    notifyListeners();
  }

  void logOut() {
    googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
    notifyListeners();
  }
}
