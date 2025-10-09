import 'package:delvirick/features/auth/data/repos/login/login_repo.dart';

class RegisterUsecase {
  final AuthRepository _authRepository;

  RegisterUsecase(this._authRepository);

  Future<Map<String, dynamic>> call({
    required String email,
    required String password,
    required String phone,
    required String firstName,
    required String lastName,
    required String userType,
  }) async {
    if (email.isEmpty ||
        password.isEmpty ||
        phone.isEmpty ||
        firstName.isEmpty ||
        lastName.isEmpty ||
        userType.isEmpty) {
      throw Exception("All fields are required.");
    }

    return await _authRepository.register(
      email: email,
      password: password,
      phone: phone,
      firstName: firstName,
      lastName: lastName,
      userType: userType,
    );
  }
}
