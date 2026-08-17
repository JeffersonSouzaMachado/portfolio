import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio/src/skills/data/models/graduation_model.dart';

abstract interface class GraduationRemoteDatasource {
  Future<GraduationModel> getGraduation(String language);
}

class GraduationRemoteDatasourceImpl implements GraduationRemoteDatasource {
  GraduationRemoteDatasourceImpl({required FirebaseFirestore firestore})
    : _firestore = firestore;

  final FirebaseFirestore _firestore;

  @override
  Future<GraduationModel> getGraduation(String language) async {
    try {
      final documentKeys = _getLanguageKeys(language);

      for (final documentKey in documentKeys) {
        final document = await _firestore
            .collection('graduation')
            .doc(documentKey)
            .get();
        final data = document.data();

        if (data != null) {
          return GraduationModel.fromJson(data);
        }
      }

      throw Exception(
        'Graduation document was not found. Tried: ${documentKeys.map((key) => 'graduation/$key').join(', ')}',
      );
    } on FirebaseException catch (error) {
      throw Exception('Error on get Graduation: ${error.message}');
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
