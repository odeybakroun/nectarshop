  

 

import 'package:dio/dio.dart';
import 'package:nectarshop/src/core/api/interface/interface_client_http.dart';

class ApiEndpoints {
   static const String baseUrl = 'https://dummyjson.com';
}

 class ApiException implements Exception {
  final int? statusCode;
  final String message;

  ApiException(this.message, [this.statusCode]);

  @override
  String toString() {
    if (statusCode != null) {
      return 'ApiException ($statusCode): $message';
    }
    return 'ApiException: $message';
  }
}


// ----------------------------------------------------------------------

class DioClient implements IHttpClient<Response> {
  final Dio _dio;

  // Constructor
  DioClient._internal() : _dio = Dio() {
    _dio.options = BaseOptions(
      baseUrl: ApiEndpoints.baseUrl,
      connectTimeout: const Duration(seconds: 5), // 5 seconds
      receiveTimeout: const Duration(seconds: 3), // 3 seconds
      headers: const {
        'Content-Type': 'application/json',
      },
    );

    // إضافة الـ Interceptor (للتسجيل)
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));
  }

  // Singleton factory
  static final DioClient _instance = DioClient._internal();
  factory DioClient() => _instance;

  // ------------------------- HTTP Methods Implementations -------------------------

  @override
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return response as Response<T>; // يتم تحويل استجابة Dio إلى Response<T> المخصصة
    } catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return response as Response<T>;
    } catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.put<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return response as Response<T>;
    } catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.delete<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return response as Response<T>;
    } catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<Response<T>> patch<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.patch<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return response as Response<T>;
    } catch (e) {
      throw _handleError(e);
    }
  }

  // ------------------------- Error Handling -------------------------

  Exception _handleError(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return ApiException('Connection timeout');
        case DioExceptionType.receiveTimeout:
          return ApiException('Receive timeout');
        case DioExceptionType.sendTimeout:
          return ApiException('Send timeout');
        case DioExceptionType.badResponse:
          // يتم إرجاع ApiException مع كود الحالة والرسالة من الاستجابة
   return ApiException(
  error.response?.statusMessage ?? 'Unknown error', // الرسالة أولًا
  error.response?.statusCode ?? 500,               // الكود ثانيًا
);

        case DioExceptionType.cancel:
          return ApiException('Request was cancelled');
        case DioExceptionType.badCertificate:
          return ApiException('Bad SSL certificate');
        case DioExceptionType.connectionError:
          return ApiException('Connection error');
        case DioExceptionType.unknown:
        default:
          return ApiException( 'Something went wrong' ,500);
      }
    }
    // إذا لم يكن الخطأ من DioException
    return Exception('Unknown error occurred');
  }
}