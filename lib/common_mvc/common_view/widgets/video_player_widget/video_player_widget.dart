import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../../../common_controller/common_utility_classes/screen_utility_functions.dart';
import '../../app_constants/app_measures.dart';
import '../../theme/app_colors.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;
  final double? height;
  final double? width;
  const VideoPlayerWidget(
      {super.key, required this.videoUrl, this.height, this.width});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.networkUrl(
      Uri.parse(widget.videoUrl),
      videoPlayerOptions: VideoPlayerOptions(
          mixWithOthers: true, allowBackgroundPlayback: true),
    );

    _initializeVideoPlayerFuture = _controller.initialize();

    _controller.setLooping(true);
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? 185,
      width: widget.width ?? ScreenUtilityFunctions().getScreenWidth(context),
      decoration: const BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppMeasures.mediumBorderRadius12),
            topRight: Radius.circular(AppMeasures.mediumBorderRadius12)),
      ),
      child: Stack(
        children: [
          FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                // return AspectRatio(
                //   aspectRatio: _controller.value.aspectRatio,
                //   child: Expanded(child: VideoPlayer(_controller),),
                // );

                return Expanded(child: VideoPlayer(_controller));
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  if (_controller.value.isPlaying) {
                    _controller.pause();
                  } else {
                    _controller.play();
                  }
                });
              },
              child: Icon(
                _controller.value.isPlaying
                    ? Icons.pause_rounded
                    : Icons.play_arrow_rounded,
                color: AppColors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
