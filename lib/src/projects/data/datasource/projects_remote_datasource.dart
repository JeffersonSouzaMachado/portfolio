import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio/src/projects/data/models/project_model.dart';

abstract interface class ProjectsRemoteDatasource {
  Future<List<ProjectModel>> getProjects(String language);
}

class ProjectsRemoteDatasourceImpl implements ProjectsRemoteDatasource {
  ProjectsRemoteDatasourceImpl({required FirebaseFirestore firestore})
      : _firestore = firestore;

  final FirebaseFirestore _firestore;

  @override
  Future<List<ProjectModel>> getProjects(String language) async {
    try {
      final snapshot = await _firestore.collection('projects').get();
      final languageKey = _getLanguageKey(language);

      final projects = snapshot.docs.expand((document) {
        final data = document.data();
        final localizedContent = data[languageKey];

        if (localizedContent == null) {
          throw Exception(
            'Project ${document.id} does not have $languageKey content',
          );
        }

        if (localizedContent is List) {
          return localizedContent.map((project) {
            final projectJson = Map<String, dynamic>.from(project as Map);

            return ProjectModel.fromJson({
              ...projectJson,
              'order': projectJson['order'] ?? data['order'],
              'id': projectJson['id'] ?? document.id,
            });
          });
        }

        if (localizedContent is Map) {
          final projectJson = Map<String, dynamic>.from(localizedContent);

          return [
            ProjectModel.fromJson({
              ...projectJson,
              'order': projectJson['order'] ?? data['order'],
              'id': document.id,
            }),
          ];
        }

        throw Exception(
          'Project ${document.id} has invalid $languageKey content',
        );
      }).toList();

      projects.sort((a, b) => a.order.compareTo(b.order));

      return projects;
    } on FirebaseException catch (error) {
      throw Exception('Error on get Projects: ${error.message}');
    } catch (error) {
      rethrow;
    }
  }

  String _getLanguageKey(String language) {
    return switch (language) {
      'pt' => 'portuguese',
      'en' => 'english',
      _ => 'english',
    };
  }
}
