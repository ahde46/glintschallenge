import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:glistschallenge/services/app_dialog.dart';
import 'package:glistschallenge/services/firestore_service.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  static final AuthService _instance = AuthService.internal();
  factory AuthService() => _instance;
  AuthService.internal();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //auth change user stream
  Stream<User> get user {
    return _auth.authStateChanges();
  }

  //get current user uid
  String getCurrentUserUid() {
    return _auth.currentUser.uid;
  }

  //sign in with email & password
  Future<User> signInWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = userCredential.user;

      await FirestoreService().upsertUserData(user);

      AppDialog.toast("Sign in successfully.");

      return user;
    } catch (e) {
      if (e is FirebaseAuthException) {
        AppDialog.toast(e.message);
      }

      return null;
    }
  }

  //sign in with google
  Future<User> signInWithGoogle() async {
    try {
      GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
      if (googleUser != null) {
        // Obtain the auth details from the request
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        // Create a new credential
        final GoogleAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        User user = userCredential.user;

        await FirestoreService().upsertUserData(user);

        AppDialog.toast("Sign in successfully.");

        return user;
      } else {
        return null;
      }
    } catch (e) {
      if (e is FirebaseAuthException) {
        AppDialog.toast(e.message);
      }

      return null;
    }
  }

  //register with email & password
  Future<User> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      User user = userCredential.user;

      await FirestoreService().upsertUserData(user);
      AppDialog.toast("Sign up successfully.");
      return user;
    } catch (e) {
      if (e is FirebaseAuthException) {
        AppDialog.toast(e.message);
      }

      return null;
    }
  }

  //reset password
  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      AppDialog.toast("A new password has been sent to your email.");
    } catch (e) {
      if (e is FirebaseAuthException) {
        AppDialog.toast(e.message);
      }

      return null;
    }
  }

  //signout
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      if (await GoogleSignIn().isSignedIn()) {
        await GoogleSignIn().signOut();

        AppDialog.toast("Sign out successfully.");
      }
    } catch (e) {}
  }
}
