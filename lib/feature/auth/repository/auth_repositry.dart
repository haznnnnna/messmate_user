import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:messmate_user/core/providers/firebase_provider.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final auth = ref.watch(authProvider);
  return AuthRepository(auth);
});

class AuthRepository {
  final FirebaseAuth _auth;
  AuthRepository(this._auth);

  // Sign Up
  Future<UserCredential?> signUp(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  // Sign In
  Future<UserCredential?> signIn(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  // Sign Out
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
