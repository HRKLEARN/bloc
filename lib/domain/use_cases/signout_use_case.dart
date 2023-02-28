import 'package:clean_architecture_bloc_firebase/data/repositories/auth_repository.dart';

class LogoutUseCase {
  final AuthRepository _authRepository;

  LogoutUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  Future<void> logout() async {
    await _authRepository.signOut();
  }
}
