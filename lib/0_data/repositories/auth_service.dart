import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// =====================
  /// Email & Password Sign Up
  /// =====================
  Future<UserCredential> signUpWithEmailPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw 'The password is too weak.';
      } else if (e.code == 'email-already-in-use') {
        throw 'An account already exists for that email.';
      }
      rethrow;
    }
  }

  /// =====================
  /// Email & Password Login
  /// =====================
  Future<UserCredential> signInWithEmailPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        throw 'Wrong password provided.';
      }
      rethrow;
    }
  }

  /// =====================
  /// Google Sign-In
  /// =====================
  Future<UserCredential> signInWithGoogle() async {
    // Begin Google sign-in process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    if (gUser == null) {
      throw 'Google sign-in was canceled.';
    }

    // Obtain authentication details
    final GoogleSignInAuthentication gAuth = await gUser.authentication;

    // Create credential for Firebase
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    // Sign in to Firebase
    return await _auth.signInWithCredential(credential);
  }

  /// =====================
  /// Sign Out
  /// =====================
  Future<void> signOut() async {
    await _auth.signOut();
    await GoogleSignIn().signOut(); // Also sign out from Google
  }

  /// =====================
  /// Auth State Changes Listener
  /// =====================
  Stream<User?> get authStateChanges => _auth.authStateChanges();
}
