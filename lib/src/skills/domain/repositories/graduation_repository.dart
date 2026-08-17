import 'package:portfolio/src/skills/data/datasources/graduation_remote_datasource.dart';
import 'package:portfolio/src/skills/domain/entities/graduation_entity.dart';

abstract interface class GraduationRepository {
  Future<GraduationEntity> getGraduation(String language);
}

class GraduationRepositoryImpl implements GraduationRepository {
  GraduationRepositoryImpl({required this.remoteDatasource});

  final GraduationRemoteDatasource remoteDatasource;

  @override
  Future<GraduationEntity> getGraduation(String language) {
    return remoteDatasource.getGraduation(language);
  }
}
