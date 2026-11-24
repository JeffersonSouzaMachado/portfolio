import '../../domain/entities/metric_resume_entity.dart';

class MetricResumeModel extends MetricResumeEntity {
  MetricResumeModel({
    required super.title,
    required super.text,
    required super.color,
    required super.icon
  });

  factory MetricResumeModel.fromJson(Map<String, dynamic> json) {
    return MetricResumeModel(
      title: json['title'] ?? '',
      text: json['text'] ?? '',
      color: json['color'] ?? '',
      icon: json['icon'] ?? '',
    );
  }
}
