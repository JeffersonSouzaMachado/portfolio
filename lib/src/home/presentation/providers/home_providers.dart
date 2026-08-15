import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/firebase/firestore_provider.dart';
import 'package:portfolio/src/home/data/datasources/home_remote_datasource.dart';
import 'package:portfolio/src/home/domain/entities/metric_resume_entity.dart';
import 'package:portfolio/src/home/domain/repositories/home_repository.dart';

final homeRemoteDataSourceProvider = Provider<HomeRemoteDatasource>((ref) {
  final firestore = ref.watch(firestoreProvider);

  return HomeRemoteDatasourceImpl(firestore: firestore);
});

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  final remoteDataSource = ref.watch(homeRemoteDataSourceProvider);

  return HomeRepositoryImpl(remoteDataSource: remoteDataSource);
});

final metricProvider =
    FutureProvider.family<List<MetricResumeEntity>, String>((ref, language) {
  final repository = ref.watch(homeRepositoryProvider);

  return repository.getMetrics(language);
});
