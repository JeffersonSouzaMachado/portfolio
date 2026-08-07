import 'package:dio/dio.dart';
import 'package:portfolio/core/network/api_constants.dart';

class ApiClient {
  ApiClient()
    : dio = Dio(
        BaseOptions(
          baseUrl: ApiConstants.baseUrl,
          connectTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 15),
          // sendTimeout: const Duration(seconds: 15), //Util para POST
          headers: {
            'Accept': 'application/json',
            // 'Content-Type': 'application/json',
          },
        ),
      );

  final Dio dio;
}
