class ExperienceEntity {
  const ExperienceEntity({
    required this.role,
    required this.company,
    required this.period,
    required this.description,
    required this.tags,
  });

  final String role;
  final String company;
  final String period;
  final String description;
  final List<String> tags;
}