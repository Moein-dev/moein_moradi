import 'package:dio/dio.dart';
import 'package:moein_moradi/core/models/error_handler.dart';

class HttpRequestHandler {
  static Future<(dynamic data, ErrorModel? errorMessage)> get(
    String path, {
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? customHeader,
  }) async {
    try {
      final options = Options(
        headers: customHeader ?? _header(),
      );

      final response = await Dio().get(
        path,
        queryParameters: parameters ?? {},
        options: options,
      );

      return (response.data, null);
    } on DioException catch (error) {
      return (
        null,
        ErrorModel(
          message: error.response!.data,
          status: error.response!.statusCode.toString(),
          statusCode: error.response!.statusCode,
        ),
      );
    }
  }

  static Future<(Map<String, dynamic>? data, ErrorModel? errorMessage)> post(
    String path, {
    Map<String, dynamic>? parameters,
    dynamic data,
    Map<String, dynamic>? customHeader,
  }) async {
    try {
      final options = Options(
        headers: customHeader ?? _header(),
      );

      final response = await Dio().post(
        path,
        queryParameters: parameters ?? {},
        data: data,
        options: options,
      );

      return (response.data as Map<String, dynamic>, null);
    } on DioException catch (error) {
      return (
        null,
        ErrorModel(
          message: error.response!.data["message"],
          status: error.response!.data["success"],
          statusCode: error.response!.statusCode,
        ),
      );
    }
  }

  static Future<(Map<String, dynamic>? data, ErrorModel? errorMessage)> put(
    String path, {
    Map<String, dynamic>? parameters,
    dynamic data,
    Map<String, dynamic>? customHeader,
  }) async {
    try {
      final options = Options(
        headers: customHeader ?? _header(),
      );

      final response = await Dio().put(
        path,
        queryParameters: parameters ?? {},
        data: data,
        options: options,
      );

      return (response.data as Map<String, dynamic>, null);
    } on DioException catch (error) {
      return (
        null,
        ErrorModel(
          message: error.response!.data["message"],
          status: error.response!.data["success"],
          statusCode: error.response!.statusCode,
        ),
      );
    }
  }

  static Future<(Map<String, dynamic>? data, ErrorModel? errorMessage)> patch(
    String path, {
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? customHeader,
  }) async {
    try {
      final options = Options(
        headers: customHeader ?? _header(),
      );

      final response = await Dio().patch(
        path,
        queryParameters: parameters ?? {},
        options: options,
      );

      return (response.data as Map<String, dynamic>, null);
    } on DioException catch (error) {
      return (
        null,
        ErrorModel(
          message: error.response!.data["message"],
          status: error.response!.data["success"],
          statusCode: error.response!.statusCode,
        ),
      );
    }
  }

  static Future<(Map<String, dynamic>? data, ErrorModel? errorMessage)> delete(
    String path, {
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? customHeader,
  }) async {
    try {
      final options = Options(
        headers: customHeader ?? _header(),
      );

      final response = await Dio().delete(
        path,
        queryParameters: parameters ?? {},
        options: options,
      );

      return (response.data as Map<String, dynamic>, null);
    } on DioException catch (error) {
      return (
        null,
        ErrorModel(
          message: error.response!.data["message"],
          status: error.response!.data["success"],
          statusCode: error.response!.statusCode,
        ),
      );
    }
  }

  static Map<String, dynamic>? _header() {
    return {
      'Content-Type': 'application/json',
    };
  }
}
