import 'package:dio/dio.dart';
import 'package:yod_presentation_travel_to_gether/core/storage/token_storage.dart';
import 'auth_interceptor.dart';

class DioClient {
  late Dio dio;

  DioClient() {
    final tokenStorage = TokenStorage();

    dio = Dio(
      BaseOptions(
        baseUrl: 'http://localhost:8080',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    dio.interceptors.add(AuthInterceptor(tokenStorage));
    dio.interceptors.add(LogInterceptor(responseBody: true));
  }
}
