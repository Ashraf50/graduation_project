abstract class AuthRepo {
  Future<Map<String, dynamic>> register({
    required String username,
    required String email,
    required String password,
    required String phone,
  });
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  });
  Future<bool> isLoggedIn();
  Future<void> logout();
}
