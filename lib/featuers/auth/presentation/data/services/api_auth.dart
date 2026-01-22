import 'package:dio/dio.dart';
import 'package:houses/core/servers/failers.dart';
import 'package:houses/featuers/auth/presentation/data/services/token_storage.dart';

class ApiAuth {
  final Dio _dio;

  ApiAuth()
    : _dio = Dio(
        BaseOptions(
          baseUrl: 'https://brojectone-production.up.railway.app',
          headers: {'Content-Type': 'application/json'},
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        ),
      );

  // تسجيل حساب جديد
  Future<Map<String, dynamic>?> signUp(
    String email,
    String password,
    String name,
  ) async {
    try {
      final response = await _dio.post(
        '/Api/v1/user/signUp',
        data: {'email': email, 'password': password, "name": name},
      );
      return response.data;
    } on DioException catch (e) {
      throw ServerFailers.fromDioError(e);
    }
  }

  // تسجيل الدخول + حفظ التوكن
  Future<Map<String, dynamic>?> signIn(String email, String password) async {
    try {
      final response = await _dio.post(
        '/Api/v1/user/signIn',
        data: {'email': email, 'password': password},
      );

      return response.data; // فقط إرجاع البيانات بدون حفظ
    } on DioException catch (e) {
      throw ServerFailers.fromDioError(e);
    }
  }
}
