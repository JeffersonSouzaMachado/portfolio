import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubeVideo extends StatefulWidget {
  const YoutubeVideo({super.key, required this.videoId});

  final String videoId;

  @override
  State<YoutubeVideo> createState() => _YoutubeVideoState();
}

class _YoutubeVideoState extends State<YoutubeVideo> {
  late final YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();

    controller = YoutubePlayerController.fromVideoId(
      videoId: widget.videoId,
      autoPlay: false,
      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
      ),
    );
  }

  @override
  void didUpdateWidget(covariant YoutubeVideo oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.videoId == widget.videoId) return;

    controller.cueVideoById(videoId: widget.videoId);
  }

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: AspectRatio(
        aspectRatio: 3 / 4,
        child: YoutubePlayer(controller: controller),
      ),
    );
  }
}
