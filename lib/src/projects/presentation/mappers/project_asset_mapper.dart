import 'package:portfolio/core/shared/design/icons/images_app.dart';

abstract final class ProjectAssetMapper {
  static String image(String key) {
    return switch (key) {
      'helpneiMainLogo' => ImagesApp.helpneiMainLogo,
      'helpnei_1' => ImagesApp.mockupHelpnei1,
      'helpnei_2' => ImagesApp.mockupHelpnei2,
      'helpnei_3' => ImagesApp.mockupHelpnei3,
      _ => ImagesApp.code,
    };
  }
}
