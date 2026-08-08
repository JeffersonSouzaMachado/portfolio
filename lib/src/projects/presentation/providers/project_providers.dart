import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/network/api_client_provider.dart';
import 'package:portfolio/src/projects/data/datasource/projects_remote_datasource.dart';
import 'package:portfolio/src/projects/data/repositories/project_repository.dart';
import 'package:portfolio/src/projects/domain/entities/project_entity.dart';

final projectsRemoteDataSourceProvider = Provider<ProjectsRemoteDatasourceImpl>(
      (ref) {
    final dio = ref.watch(dioProvider);

    return ProjectsRemoteDatasourceImpl(dio: dio);
  },
);

final projectsRepositoryProvider = Provider<ProjectsRepository>((ref) {
  final remoteDataSource = ref.watch(projectsRemoteDataSourceProvider);

  return ProjectsRepositoryImpl(remoteDataSource);
});


final projectProvider = FutureProvider.family<List<ProjectEntity>, String>(
        (ref, language) async {
      final repository = ref.watch(projectsRepositoryProvider);

      return repository.getProjects();
    }
);