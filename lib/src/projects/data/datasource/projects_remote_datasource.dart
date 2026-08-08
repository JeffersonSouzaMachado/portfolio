import 'package:dio/dio.dart';
import 'package:portfolio/core/network/api_constants.dart';
import 'package:portfolio/src/projects/data/models/project_model.dart';

abstract interface class ProjectsRemoteDatasource {
  Future<List<ProjectModel>> getProjects();
}

class ProjectsRemoteDatasourceImpl implements ProjectsRemoteDatasource {
  ProjectsRemoteDatasourceImpl({required this._dio});

  final Dio _dio;

  @override
  Future<List<ProjectModel>> getProjects() async {
    try {
      final response = await _dio.get<List<dynamic>>(ApiConstants.projects);

      return (response.data ?? [])
          .map(
            (item) =>
                ProjectModel.fromJson(Map<String, dynamic>.from(item as Map)),
          )
          .toList();
    } on DioException catch (error) {
      //TODO Insert error handling
      rethrow;
    }
  }
}
