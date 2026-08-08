import 'package:portfolio/src/home/data/datasources/home_remote_datasource.dart';
import 'package:portfolio/src/home/domain/entities/metric_resume_entity.dart';

abstract interface class HomeRepository {
  Future<List<MetricResumeEntity>> getMetrics();
}

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl({required this._remoteDataSource});

  final HomeRemoteDatasource _remoteDataSource;

  @override
  Future<List<MetricResumeEntity>> getMetrics() async {
    return _remoteDataSource.getMetrics();
  }
}
