// lib/repositories/auth_repository_impl.dart
import 'package:delvirick/features/auth/data/repos/login/login_repo.dart';
import 'package:delvirick/features/auth/data/sources/API/api_service.dart';
import 'package:delvirick/core/utils/consts/text.dart';
  

class AuthRepositoryImpl implements AuthRepository {
  final ApiService _apiService = ApiService();

  @override
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _apiService.post(
        url: "${ConstText.baseUrl}/api/Auth/login", 
        token: null,
        body: {
          "email": email,
          "password": password,
        },
      );

      return response; // can wrap in model later
    } catch (e) {
      throw Exception("Login failed: $e");
    }
  }
}
