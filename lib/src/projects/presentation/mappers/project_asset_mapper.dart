import 'package:flutter/cupertino.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:portfolio/core/shared/design/icons/images_app.dart';
import 'package:portfolio/core/shared/design/icons/svg_app.dart';

abstract final class ProjectAssetMapper {
  ProjectAssetMapper(String cardImage);

  static String image(String key) {
    return switch (key) {
      'helpneiMainLogo' => ImagesApp.helpneiMainLogo,
      'helpnei_1' => ImagesApp.mockupHelpnei1,
      'helpnei_2' => ImagesApp.mockupHelpnei2,
      'helpnei_3' => ImagesApp.mockupHelpnei3,
      _ => ImagesApp.code,
    };
  }

  static IconData icon(String key) {
    return switch (key) {
      'code' => LucideIcons.code,
      'database' => LucideIcons.database,
      'mapPin' => LucideIcons.mapPin,
      'gitGraph' => LucideIcons.gitGraph,
      'bug' => LucideIcons.bug,
      'cloudUpload' => LucideIcons.cloudUpload,
      'notepadText' => LucideIcons.notepadText,
      'penTool' => LucideIcons.penTool,
      _ => LucideIcons.aLargeSmallDir,
    };
  }

  static String svg(String key) {
    return switch (key) {
      'playStore' => SvgApp.playStore,
      'appStore' => SvgApp.appleStore,
      _ => SvgApp.playStore,
    };
  }
}
