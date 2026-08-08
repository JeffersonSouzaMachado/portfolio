import '../../domain/entities/metric_resume_entity.dart';

class MetricResumeModel extends MetricResumeEntity {
  MetricResumeModel({
    required super.title,
    required super.text,
    required super.color,
  });

  factory MetricResumeModel.fromJson(Map<String, dynamic> json) {
    return MetricResumeModel(
      title: json['title'] ?? '',
      text: json['text'] ?? '',
      color: json['color'] ?? '',
    );
  }
}
