import 'package:dio/dio.dart';

class ApiHelper {
  final Dio _dio = Dio(
    BaseOptions(
      followRedirects: true,
      validateStatus: (status) {
        return status != null &&
            status < 500; // Accepts redirects and others < 500
      },
    ),
  );

  // POST method
  Future<Response> post({
    required String url,
    required Map<String, dynamic> data,
    Options? options,
  }) async {
    try {
      var response = await _dio.post(url, data: data, options: options);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // GET method
  Future<Response> get(String url, {Map<String, String>? headers}) async {
    try {
      return await _dio.get(
        url,
        options: Options(headers: headers),
      );
    } catch (e) {
      rethrow;
    }
  }

  // DELETE method
  Future<Response> delete(String url, {Map<String, String>? headers}) async {
    try {
      return await _dio.delete(
        url,
        options: Options(headers: headers),
      );
    } catch (e) {
      rethrow;
    }
  }
}
