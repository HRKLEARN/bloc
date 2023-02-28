import 'package:clean_architecture_bloc_firebase/data/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginUseCase {
  final AuthRepository _authRepository;

  LoginUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  Future<void> signIn({required String email, required String password}) async {
    try {
      await _authRepository.signIn(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception('Failed to log in');
    }
  }

/*  Future<User?> getCurrentUser() async {
    final user = _authRepository.getCurrentUser();

      return user;

  }*/
}
