import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repository/auth_repositry.dart';

// AuthController provider
final authControllerProvider =
StateNotifierProvider<AuthController, bool>((ref) {
  final authRepo = ref.watch(authRepositoryProvider);
  return AuthController(authRepo);
});

class AuthController extends StateNotifier<bool> {
  final AuthRepository _authRepository;
  AuthController(this._authRepository) : super(false);

  // Register user
  Future<void> register(String email, String password) async {
    state = true; // Loading
    await _authRepository.signUp(email, password);
    state = false;
  }

  // Login user
  Future<void> login(String email, String password) async {
    state = true;
    await _authRepository.signIn(email, password);
    state = false;
  }

  // Logout user
  Future<void> logout() async {
    await _authRepository.signOut();
  }
}
