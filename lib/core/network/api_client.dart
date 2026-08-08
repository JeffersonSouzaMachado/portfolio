import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/network/api_constants.dart';

import '../shared/localization/locale_provider.dart';

class ApiClient {
  ApiClient({required Ref ref}) {
    dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final locale = ref.read(localeProvider);
          final language = locale?.languageCode;

          if (language != null) {
            options.queryParameters.putIfAbsent(
              'lang',
              () => locale?.languageCode,
            );
          }

          handler.next(options);
        },
      ),
    );
  }

  late final Dio dio;
}
