import 'package:portfolio/src/skills/data/datasources/skills_remote_datasource.dart';
import 'package:portfolio/src/skills/domain/entities/skills_entity.dart';

abstract interface class SkillsRepository {
  Future<SkillsEntity> getSkills(String language);
}

class SkillsRepositoryImpl implements SkillsRepository {
  SkillsRepositoryImpl({required this.remoteDatasource});

  final SkillsRemoteDatasource remoteDatasource;

  @override
  Future<SkillsEntity> getSkills(String language) {
    return remoteDatasource.getSkills(language);
  }
}
