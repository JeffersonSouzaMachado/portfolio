import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio/src/home/data/models/metric_resume_model.dart';

abstract interface class HomeRemoteDatasource {
  Future<List<MetricResumeModel>> getMetrics(String language);
}

class HomeRemoteDatasourceImpl implements HomeRemoteDatasource {
  HomeRemoteDatasourceImpl({required FirebaseFirestore firestore})
      : _firestore = firestore;

  final FirebaseFirestore _firestore;

  @override
  Future<List<MetricResumeModel>> getMetrics(String language) async {
    try {
      final languageKey = _getLanguageKey(language);
      final document = await _firestore
          .collection('metrics')
          .doc(languageKey)
          .get();
      final data = document.data();

      if (data == null) {
        return [];
      }

      return _metricsFromDocument(data);
    } on FirebaseException catch (error) {
      throw Exception('Error on get Metrics: ${error.message}');
    }
  }

  List<MetricResumeModel> _metricsFromDocument(Map<String, dynamic> data) {
    final rawMetrics = data['metrics'] ?? data['items'] ?? data['data'];

    if (rawMetrics is List) {
      return rawMetrics
          .map((item) => MetricResumeModel.fromJson(
                Map<String, dynamic>.from(item as Map),
              ))
          .toList();
    }

    if (data.containsKey('title')) {
      return [MetricResumeModel.fromJson(data)];
    }

    return data.values
        .whereType<Map>()
        .map((item) => MetricResumeModel.fromJson(
              Map<String, dynamic>.from(item),
            ))
        .toList();
  }

  String _getLanguageKey(String language) {
    return switch (language) {
      'pt' => 'portuguese',
      'en' => 'english',
      _ => 'english',
    };
  }
}
