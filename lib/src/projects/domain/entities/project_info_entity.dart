class ProjectInfoEntity {
  ProjectInfoEntity({
    required this.downloads,
    required this.playStoreUrl,
    required this.appStoreUrl,
    required this.rate,
  });

  final int downloads;
  final String playStoreUrl;
  final String appStoreUrl;
  final String rate;
}
