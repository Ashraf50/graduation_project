import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:graduation_project/core/constant/app_strings.dart';
import 'package:graduation_project/core/helper/api_helper.dart';
import 'package:graduation_project/feature/Auth/data/repo/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiHelper apiHelper;
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();

  AuthRepoImpl(this.apiHelper);

  @override
  Future<Map<String, dynamic>> register({
    required String email,
    required String password,
    required String username,
    required String phone,
    required String role,
  }) async {
    final response =
        await apiHelper.post('${AppStrings.userBaseUrl}/account/register', {
      'username': username,
      'email': email,
      'password': password,
      'phone': phone,
      'role': role,
    });
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    final response =
        await apiHelper.post('${AppStrings.userBaseUrl}/account/login', {
      'email': email,
      'password': password,
    });
    return response.data;
  }

  @override
  Future<bool> isLoggedIn() async {
    return await secureStorage.containsKey(key: 'auth_token');
  }

  @override
  Future<void> logout() async {
    return await secureStorage.delete(key: 'auth_token');
  }
}
