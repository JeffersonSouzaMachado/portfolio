import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/network/api_client_provider.dart';
import 'package:portfolio/src/projects/data/datasource/projects_remote_datasource.dart';

final projectsRemoteDataSourceProvider = Provider<ProjectsRemoteDatasourceImpl>(
  (ref) {
    final dio = ref.watch(dioProvider);

    return ProjectsRemoteDatasourceImpl(dio: dio);
  },
);


