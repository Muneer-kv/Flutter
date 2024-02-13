import 'package:firebase_auth/firebase_auth.dart';

class firebaseAuthServices {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<User?> signupwithemailandpassword(
      String email, String password) async {
    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print('some error');
    }
  }

  Future<User?> signinwithemailandpassword(
      String email, String password) async {
    try {
      UserCredential credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print('some error');
    }
  }
}
