import 'package:dio/dio.dart';
import 'package:freshlogistics/utils/constants/api_constants.dart';

class HttpClient {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: ApiConstants.connectTimeout,
      receiveTimeout: ApiConstants.receiveTimeout,
      headers: ApiConstants.defaultHeaders,
    ),
  );

  // GET
  static Future<Response> get(String path, {String? token}) async {
    try {
      final response = await _dio.get(
        path,
        options: _getOptions(token),
      );
      return _handleResponse(response);
    } catch (e) {
      throw _handleError(e);
    }
  }

  // POST
  static Future<Response> post(
    String path, {
    dynamic data,
    String? token,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        options: _getOptions(token),
      );
      return _handleResponse(response);
    } catch (e) {
      throw _handleError(e);
    }
  }

  // PUT (fixed)
  static Future<Response> put(
    String path, {
    dynamic data,
    String? token,
  }) async {
    try {
      final response = await _dio.put(
        path,
        data: data,
        options: _getOptions(token),
      );
      return _handleResponse(response);
    } catch (e) {
      throw _handleError(e);
    }
  }

  // DELETE (fixed)
  static Future<Response> delete(
    String path, {
    String? token,
  }) async {
    try {
      final response = await _dio.delete(
        path,
        options: _getOptions(token),
      );
      return _handleResponse(response);
    } catch (e) {
      throw _handleError(e);
    }
  }

  // Helpers
  static Options _getOptions(String? token) {
    return Options(
      headers: token != null 
          ? {'Authorization': 'Bearer $token'} 
          : null,
    );
  }

  static Response _handleResponse(Response response) {
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return response;
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        error: 'HTTP Error ${response.statusCode}',
      );
    }
  }

  static dynamic _handleError(dynamic error) {
    if (error is DioException) {
      // Handle 401 Unauthorized
      if (error.response?.statusCode == 401) {
        // Add your logout logic here
      }
      return error.response?.data ?? error.message;
    }
    return error.toString();
  }
}