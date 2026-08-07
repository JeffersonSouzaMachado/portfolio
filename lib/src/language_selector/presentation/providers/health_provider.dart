import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/network/api_client_provider.dart';
import 'package:portfolio/src/language_selector/data/datasource/health_remote_datasource.dart';
import 'package:portfolio/src/language_selector/data/repositories/health_repository.dart';

final healthRemoteDataSourceProvider = Provider<HealthRemoteDatasourceImpl>((
  ref,
) {
  final dio = ref.watch(dioProvider);

  return HealthRemoteDatasourceImpl(dio: dio);
});

final healthRepositoryProvider = Provider<HealthRepository>((ref) {
  final remoteDataSource = ref.watch(healthRemoteDataSourceProvider);

  return HealthRepositoryImpl(remoteDataSource);
});

final healthProvider = FutureProvider<void>((ref) {
  final repository = ref.watch(healthRepositoryProvider);

  return repository.wakeup();
});
