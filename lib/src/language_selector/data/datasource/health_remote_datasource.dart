import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:portfolio/core/network/api_constants.dart';

abstract interface class HealthRemoteDatasource {
  Future<void> wakeup();
}

class HealthRemoteDatasourceImpl implements HealthRemoteDatasource {
  HealthRemoteDatasourceImpl({required this._dio});

  final Dio _dio;

  @override
  Future<void> wakeup() async {
    try {
     await _dio.get(ApiConstants.health);



    } on DioException catch (error) {
      //TODO insert erro handling
      rethrow;
    }
  }
}
