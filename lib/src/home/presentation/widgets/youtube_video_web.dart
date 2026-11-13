import 'dart:ui_web' as ui_web;

import 'package:flutter/widgets.dart';
import 'package:web/web.dart' as web;

class YoutubeVideoView extends StatelessWidget {
  const YoutubeVideoView({
    super.key,
    required this.videoId,
    required this.maxWidth,
  });

  static final registeredViewTypes = <String>{};

  final String videoId;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    final viewType = 'youtube-video-$videoId';
    registerViewFactory(viewType, videoId);

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth.isFinite
            ? constraints.maxWidth.clamp(0.0, maxWidth).toDouble()
            : maxWidth;

        return SizedBox(
          width: width,
          child: AspectRatio(
            aspectRatio: 3 / 4,
            child: HtmlElementView(
              key: ValueKey(viewType),
              viewType: viewType,
            ),
          ),
        );
      },
    );
  }

  static void registerViewFactory(String viewType, String videoId) {
    if (!registeredViewTypes.add(viewType)) return;

    ui_web.platformViewRegistry.registerViewFactory(
      viewType,
      (_) => web.HTMLIFrameElement()
        ..src = 'https://www.youtube.com/embed/$videoId?rel=0&playsinline=1'
        ..title = 'YouTube video player'
        ..allow =
            'accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share'
        ..setAttribute('allowfullscreen', 'true')
        ..style.setProperty('border', '0')
        ..style.setProperty('height', '100%')
        ..style.setProperty('width', '100%'),
    );
  }
}
