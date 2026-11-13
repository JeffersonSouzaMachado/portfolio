import 'package:flutter/widgets.dart';

import 'youtube_video_native.dart'
    if (dart.library.html) 'youtube_video_web.dart';

class YoutubeVideo extends StatelessWidget {
  const YoutubeVideo({
    super.key,
    required this.videoId,
    this.maxWidth = 400,
  });

  final String videoId;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return YoutubeVideoView(
      videoId: videoId,
      maxWidth: maxWidth,
    );
  }
}
