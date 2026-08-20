import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubeVideo extends StatefulWidget {
  const YoutubeVideo({
    super.key,
    required this.videoId,
    this.maxWidth = 400,
  });

  final String videoId;
  final double maxWidth;

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
        showControls: false,
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
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth.isFinite
            ? constraints.maxWidth.clamp(0.0, widget.maxWidth).toDouble()
            : widget.maxWidth;

        return SizedBox(
          width: width,
          child: AspectRatio(
            aspectRatio: 3 / 4,
            child: YoutubePlayer(controller: controller),
          ),
        );
      },
    );
  }
}
