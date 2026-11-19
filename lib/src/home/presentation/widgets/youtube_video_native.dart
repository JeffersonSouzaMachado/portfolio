import 'package:material_ui/material_ui.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubeVideoView extends StatefulWidget {
  const YoutubeVideoView({
    super.key,
    required this.videoId,
    required this.maxWidth,
  });

  final String videoId;
  final double maxWidth;

  @override
  State<YoutubeVideoView> createState() => _YoutubeVideoViewState();
}

class _YoutubeVideoViewState extends State<YoutubeVideoView> {
  late final YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();

    controller = YoutubePlayerController.fromVideoId(
      videoId: widget.videoId,
      autoPlay: false,
      params: const YoutubePlayerParams(
        showControls: false,
        showFullscreenButton: false,
      ),
    );
  }

  @override
  void didUpdateWidget(covariant YoutubeVideoView oldWidget) {
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
