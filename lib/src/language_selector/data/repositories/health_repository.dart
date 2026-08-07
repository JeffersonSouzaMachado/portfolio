

import 'package:portfolio/src/language_selector/data/datasource/health_remote_datasource.dart';

abstract interface class HealthRepository {
  Future<void> wakeup();
}

class HealthRepositoryImpl implements HealthRepository {
  HealthRepositoryImpl(this._remoteDataSource);

  final HealthRemoteDatasource _remoteDataSource;

  @override
  Future<void> wakeup() {
    return _remoteDataSource.wakeup();
  }
}
