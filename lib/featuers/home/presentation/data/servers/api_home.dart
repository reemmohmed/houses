import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:houses/core/servers/failers.dart';
import 'package:houses/featuers/home/presentation/data/models/home_model.dart';

class ApiHome {
  final Dio _dio;

  ApiHome()
    : _dio = Dio(
        BaseOptions(
          baseUrl: 'https://brojectone-production.up.railway.app',
          headers: {'Content-Type': 'application/json'},
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        ),
      );
  Future<List<HomeModel>> fetchProducts() async {
    final response = await _dio.get('/Api/v1/product');
    final data = response.data;

    // log('Response data: $data'); // للتأكد من شكل البيانات

    if (data is Map && data.containsKey('result')) {
      final List productsJson = data['result'];
      return productsJson.map((json) => HomeModel.fromJson(json)).toList();
    } else if (data is List) {
      // لو جت القائمة مباشرة
      return data.map((json) => HomeModel.fromJson(json)).toList();
    } else {
      return [];
    }
  }

  // البحث عن المنتجات (لو API بيدعم البحث)
  Future<List<HomeModel>> searchProducts(String query) async {
    try {
      final response = await _dio.get(
        '/Api/v1/product',
        queryParameters: {'search': query},
      );

      if (response.statusCode == 200) {
        final data = response.data;

        if (data is Map && data.containsKey('products')) {
          final List productsJson = data['products'];
          return productsJson.map((json) => HomeModel.fromJson(json)).toList();
        } else if (data is List) {
          return data.map((json) => HomeModel.fromJson(json)).toList();
        } else {
          return [];
        }
      } else {
        throw Exception('Failed to search products');
      }
    } on DioException catch (e) {
      throw ServerFailers.fromDioError(e);
    }
  }
}
