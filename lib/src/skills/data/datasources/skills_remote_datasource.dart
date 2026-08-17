import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio/src/skills/data/models/skills_model.dart';

abstract interface class SkillsRemoteDatasource {
  Future<SkillsModel> getSkills(String language);
}

class SkillsRemoteDatasourceImpl implements SkillsRemoteDatasource {
  SkillsRemoteDatasourceImpl({required FirebaseFirestore firestore})
      : _firestore = firestore;

  final FirebaseFirestore _firestore;

  @override
  Future<SkillsModel> getSkills(String language) async {
    try {
      final documentKeys = _getLanguageKeys(language);

      for (final documentKey in documentKeys) {
        final document =
            await _firestore.collection('skills').doc(documentKey).get();
        final data = document.data();

        if (data != null) {
          return SkillsModel.fromJson(data);
        }
      }

      throw Exception(
        'Skills document was not found. Tried: ${documentKeys.map((key) => 'skills/$key').join(', ')}',
      );
    } on FirebaseException catch (error) {
      throw Exception('Error on get Skills: ${error.message}');
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
