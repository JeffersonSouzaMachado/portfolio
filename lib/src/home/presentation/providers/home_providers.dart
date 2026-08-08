import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/network/api_client_provider.dart';
import 'package:portfolio/src/home/data/datasources/home_remote_datasource.dart';
import 'package:portfolio/src/home/domain/repositories/home_repository.dart';

final homeRemoteDataSourceProvider = Provider<HomeRemoteDatasourceImpl>((ref) {
  final dio = ref.watch(dioProvider);

  return HomeRemoteDatasourceImpl(dio: dio);
});

final homeRepositoryProvider = Provider<HomeRepository>((ref){
  final remoteDataSource = ref.watch(homeRemoteDataSourceProvider);

  return HomeRepositoryImpl(remoteDataSource: remoteDataSource);
});


final metricProvider = FutureProvider((ref){
  final repository = ref.watch(homeRepositoryProvider);

  return repository.getMetrics();
});