import 'package:portfolio/src/skills/data/datasources/experiences_remote_datasource.dart';
import 'package:portfolio/src/skills/domain/entities/experience_entity.dart';

abstract interface class ExperiencesRepository {
  Future<List<ExperienceEntity>> getExperiences(String language);
}

class ExperiencesRepositoryImpl implements ExperiencesRepository {
  ExperiencesRepositoryImpl({required this.remoteDatasource});

  final ExperiencesRemoteDatasource remoteDatasource;

  @override
  Future<List<ExperienceEntity>> getExperiences(String language) {
    return remoteDatasource.getExperiences(language);
  }
}
