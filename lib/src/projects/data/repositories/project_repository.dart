import 'package:portfolio/src/projects/data/datasource/projects_remote_datasource.dart';

import '../../domain/entities/project_entity.dart';

abstract interface class ProjectsRepository {
  Future<List<ProjectEntity>> getProjects({required String language});
}

class ProjectsRepositoryImpl implements ProjectsRepository {
  ProjectsRepositoryImpl(this._remoteDatasource);

  final ProjectsRemoteDatasource _remoteDatasource;

  @override
  Future<List<ProjectEntity>> getProjects({required String language}) async {
    return _remoteDatasource.getProjects(language: language);
  }
}
