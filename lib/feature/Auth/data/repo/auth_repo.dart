abstract class AuthRepo {
  Future<Map<String, dynamic>> register({
    required String username,
    required String email,
    required String password,
  });
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  });
}
