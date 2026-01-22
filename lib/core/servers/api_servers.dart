import 'package:dio/dio.dart';
import 'package:houses/core/servers/failers.dart';

class ApiServers {
  final Dio _dio;

  ApiServers()
    : _dio = Dio(
        BaseOptions(
          baseUrl: 'https://brojectone-production.up.railway.app',
          headers: {'Content-Type': 'application/json'},
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        ),
      );

  // تسجيل حساب جديد
  Future<Map<String, dynamic>?> signUp(String email, String password) async {
    try {
      final response = await _dio.post(
        'Api/v1/user/signUp',
        data: {'email': email, 'password': password},
      );
      return response.data;
    } on DioException catch (e) {
      throw ServerFailers.fromDioError(e);
    }
  }

  // تسجيل الدخول
  Future<Map<String, dynamic>?> signIn(String email, String password) async {
    try {
      final response = await _dio.post(
        'Api/v1/user/signIn',
        data: {'email': email, 'password': password},
      );
      return response.data;
    } on DioException catch (e) {
      throw ServerFailers.fromDioError(e);
    }
  }
}
