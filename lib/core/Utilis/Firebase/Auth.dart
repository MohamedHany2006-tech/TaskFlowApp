import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_do_list/core/Utilis/cache_helper.dart';

class AuthServices {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final CacheHelper cacheHelper = CacheHelper();

  // Login Method
  Future<UserCredential> login({
    required String email,
    required String password,
  }) async {
    try {
      var credential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      var token = await credential.user?.getIdToken(false);
       cacheHelper.setUserToken(userToken: token ?? '');

      return credential;
    } on FirebaseAuthException catch (e) {
      throw _handleAuthException(e);
    } catch (e) {
      throw 'An unexpected error occurred. Please try again later.';
    }
  }

  // Sign Up / Create Account Method
  Future<UserCredential> createAccount({
    required String email,
    required String password,
  }) async {
    try {
      var credential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      var token = await credential.user?.getIdToken(false);
      cacheHelper.setUserToken(userToken: token ?? '');

      return credential;
    } on FirebaseAuthException catch (e) {
      throw _handleAuthException(e);
    } catch (e) {
      throw 'An unexpected error occurred. Please try again later.';
    }
  }

  // Firebase Error Exception Handler
  String _handleAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return 'No user found with this email address.';
      case 'wrong-password':
        return 'Incorrect password. Please try again.';
      case 'invalid-credential':
        return 'Invalid credentials provided.';
      case 'email-already-in-use':
        return 'This email address is already registered.';
      case 'weak-password':
        return 'The password provided is too weak.';
      case 'invalid-email':
        return 'The email address format is invalid.';
      default:
        return e.message ?? 'An error occurred while connecting to the server.';
    }
  }
}