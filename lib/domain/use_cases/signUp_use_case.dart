import 'package:firebase_auth/firebase_auth.dart';
import 'package:clean_architecture_bloc_firebase/data/repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository _authRepository;

  RegisterUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  Future<void> signUp(
      {required String email, required String password}) async {
    try {
      await _authRepository.signUp(
           email : email, password: password);

    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception('Failed to register');
    }
  }
}
