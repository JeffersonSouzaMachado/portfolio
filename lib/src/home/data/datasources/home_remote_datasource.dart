import 'package:dio/dio.dart';
import 'package:portfolio/core/network/api_constants.dart';
import 'package:portfolio/src/home/data/models/metric_resume_model.dart';

abstract interface class HomeRemoteDatasource {
  Future<List<MetricResumeModel>> getMetrics();
}

class HomeRemoteDatasourceImpl implements HomeRemoteDatasource {
  HomeRemoteDatasourceImpl({required this._dio});

  final Dio _dio;

  @override
  Future<List<MetricResumeModel>> getMetrics() async {
    try {
      final response = await _dio.get<List<dynamic>>(ApiConstants.metrics);

      return (response.data ?? [])
          .map(
            (item) => MetricResumeModel.fromJson(
              Map<String, dynamic>.from(item as Map),
            ),
          )
          .toList();
    } on DioException catch (error) {
      //TODO insert error handling
      rethrow;
    }
  }
}
