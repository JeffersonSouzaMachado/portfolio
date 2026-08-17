import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/firebase/firestore_provider.dart';
import 'package:portfolio/src/skills/data/datasources/experiences_remote_datasource.dart';
import 'package:portfolio/src/skills/data/datasources/skills_remote_datasource.dart';
import 'package:portfolio/src/skills/domain/entities/experience_entity.dart';
import 'package:portfolio/src/skills/domain/entities/skills_entity.dart';
import 'package:portfolio/src/skills/domain/repositories/experiences_repository.dart';
import 'package:portfolio/src/skills/domain/repositories/skills_repository.dart';

final skillsRemoteDatasourceProvider = Provider<SkillsRemoteDatasource>((ref) {
  final firestore = ref.watch(firestoreProvider);

  return SkillsRemoteDatasourceImpl(firestore: firestore);
});

final skillsRepositoryProvider = Provider<SkillsRepository>((ref) {
  final remoteDatasource = ref.watch(skillsRemoteDatasourceProvider);

  return SkillsRepositoryImpl(remoteDatasource: remoteDatasource);
});

final skillsProvider = FutureProvider.family<SkillsEntity, String>(
  (ref, language) {
    final repository = ref.watch(skillsRepositoryProvider);

    return repository.getSkills(language);
  },
);

final experiencesRemoteDatasourceProvider =
    Provider<ExperiencesRemoteDatasource>((ref) {
  final firestore = ref.watch(firestoreProvider);

  return ExperiencesRemoteDatasourceImpl(firestore: firestore);
});

final experiencesRepositoryProvider = Provider<ExperiencesRepository>((ref) {
  final remoteDatasource = ref.watch(experiencesRemoteDatasourceProvider);

  return ExperiencesRepositoryImpl(remoteDatasource: remoteDatasource);
});

final experiencesProvider =
    FutureProvider.family<List<ExperienceEntity>, String>(
  (ref, language) {
    final repository = ref.watch(experiencesRepositoryProvider);

    return repository.getExperiences(language);
  },
);
