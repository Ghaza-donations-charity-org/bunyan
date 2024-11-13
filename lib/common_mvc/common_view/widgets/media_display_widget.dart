import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../common_controller/common_utility_classes/image_utils.dart';

class MediaDisplayWidget extends StatefulWidget {
  final String mediaUrl;

  const MediaDisplayWidget({super.key, required this.mediaUrl});

  @override
  _MediaDisplayWidgetState createState() => _MediaDisplayWidgetState();
}

class _MediaDisplayWidgetState extends State<MediaDisplayWidget> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();

    // Initialize video controller if the media is a video
    if (_isVideo(widget.mediaUrl)) {
      _videoController = VideoPlayerController.network(widget.mediaUrl)
        ..initialize().then((_) {
          setState(() {}); // Update the state after video initializes
          _videoController.play(); // Auto-play the video
        });
    }
  }

  @override
  void dispose() {
    if (_isVideo(widget.mediaUrl)) {
      _videoController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _getMediaWidget(widget.mediaUrl);
  }

  Widget _getMediaWidget(String mediaUrl) {
    String fileExtension = mediaUrl.split('.').last.toLowerCase();

    // Handle image and GIF files
    if (fileExtension == 'jpg' || fileExtension == 'jpeg' || fileExtension == 'png' || fileExtension == 'gif') {
      return Image(image: ImageUtilityFunctions.getImage(mediaUrl), fit: BoxFit.cover,);
    }
    // Handle video files
    else if (_isVideo(mediaUrl)) {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: VideoPlayer(_videoController),
      );
    }
    // Return an error message if the media type is unsupported
    else {
      return const Text('Unsupported media type');
    }
  }

  bool _isVideo(String mediaUrl) {
    final fileExtension = mediaUrl.split('.').last.toLowerCase();
    return fileExtension == 'mp4' || fileExtension == 'avi' || fileExtension == 'mov'; // Add other video formats if needed
  }
}
