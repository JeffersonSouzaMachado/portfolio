import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio/src/skills/data/models/experience_model.dart';

abstract interface class ExperiencesRemoteDatasource {
  Future<List<ExperienceModel>> getExperiences(String language);
}

class ExperiencesRemoteDatasourceImpl implements ExperiencesRemoteDatasource {
  ExperiencesRemoteDatasourceImpl({required FirebaseFirestore firestore})
      : _firestore = firestore;

  final FirebaseFirestore _firestore;

  @override
  Future<List<ExperienceModel>> getExperiences(String language) async {
    try {
      final documentKeys = _getLanguageKeys(language);
      Map<String, dynamic>? data;

      for (final documentKey in documentKeys) {
        final document =
            await _firestore.collection('experiences').doc(documentKey).get();
        data = document.data();

        if (data != null) {
          break;
        }
      }

      if (data == null) {
        throw Exception(
          'Experiences document was not found. Tried: ${documentKeys.map((key) => 'experiences/$key').join(', ')}',
        );
      }

      final experiencesJson = data['experiences'] as List<dynamic>? ?? [];

      return experiencesJson
          .map(
            (item) => ExperienceModel.fromJson(
              Map<String, dynamic>.from(item as Map),
            ),
          )
          .toList();
    } on FirebaseException catch (error) {
      throw Exception('Error on get Experiences: ${error.message}');
    }
  }

  List<String> _getLanguageKeys(String language) {
    return switch (language) {
      'pt' => ['pt', 'portuguese'],
      'en' => ['en', 'english'],
      _ => ['en', 'english'],
    };
  }
}
