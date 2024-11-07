import 'package:graduation_project/core/constant/app_strings.dart';
import 'package:graduation_project/core/helper/api_helper.dart';
import 'package:graduation_project/feature/Auth/data/repo/auth_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiHelper apiHelper;

  AuthRepoImpl(this.apiHelper);

  @override
  Future<Map<String, dynamic>> register({
    required String email,
    required String password,
    required String username,
  }) async {
    final response = await apiHelper.post('${AppStrings.baseUrl}/register', {
      'name': username,
      'email': email,
      'password': password,
    });
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    final response = await apiHelper.post('${AppStrings.baseUrl}/login', {
      'email': email,
      'password': password,
    });
    return response.data;
  }

  @override
  Future<bool> isLoggedIn() async {
    SharedPreferences storeToken = await SharedPreferences.getInstance();
    return storeToken.containsKey('auth_token');
  }

  @override
  Future<void> logout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove('auth_token');
  }
}
