abstract class AuthRepository {
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  });

  Future<Map<String, dynamic>> register({
    required String email,
    required String password,
    required String phone,
    required String firstName,
    required String lastName,
    required String userType,
  });
}