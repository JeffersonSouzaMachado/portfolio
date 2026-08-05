import 'package:dio/dio.dart';
import 'package:portfolio/core/network/api_constants.dart';

abstract interface class ProjectsRemoteDatasource {
  Future<List<Map<String, dynamic>>> getProjects({required String language});
}

class ProjectsRemoteDatasourceImpl implements ProjectsRemoteDatasource {
  ProjectsRemoteDatasourceImpl({required this._dio});

  final Dio _dio;

  @override
  Future<List<Map<String, dynamic>>> getProjects({
    required String language,
  }) async {
    final response = await _dio.get<List<dynamic>>(
      ApiConstants.projects,
      queryParameters: {'lang': language},
    );
    final data = response.data;

    if (data == null) {
      return [];
    }

    return data.map((item) => Map<String, dynamic>.from(item as Map)).toList();
  }
}
