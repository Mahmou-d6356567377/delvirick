import 'package:delvirick/features/auth/data/repos/login/login_repo.dart';

class LoginUseCase {
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  /// Call operator (makes it look like a function when used)
  Future<Map<String, dynamic>> call({
    required String email,
    required String password,
  }) async {
    if (email.isEmpty || password.isEmpty) {
      throw Exception("Email and password cannot be empty");
    }

    // Delegate actual login to repository
    return await _authRepository.login(
      email: email,
      password: password,
    );
  }
}
