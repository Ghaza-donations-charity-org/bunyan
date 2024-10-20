import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';
import 'package:image/image.dart' as img;

class MediaUtilityFunctions {
  /// Utility function to get the duration of a video file.
  static Future<Duration?> getMediaDuration(String filePath) async {
    try {
      final videoPlayerController = VideoPlayerController.file(File(filePath));
      await videoPlayerController.initialize();
      final duration = videoPlayerController.value.duration;
      await videoPlayerController.dispose();
      return duration;
    } catch (e) {
      debugPrint('Error getting media duration: $e');
      return null;
    }
  }

  /// Utility function to get the dimensions of an image file.
  static Future<MediaDimensions?> getMediaDimensions(String filePath) async {
    try {
      final file = File(filePath);
      final image = img.decodeImage(await file.readAsBytes());
      if (image != null) {
        return MediaDimensions(width: image.width, height: image.height);
      }
    } catch (e) {
      debugPrint('Error getting media dimensions: $e');
    }
    return null;
  }

 // static UploadedFileType getFileTypeFromPath(String filePath) {
 //    final extension = filePath.split('.').last.toLowerCase();
 //
 //    const imageExtensions = ['png', 'jpg', 'jpeg', 'gif', 'bmp', 'webp'];
 //    const videoExtensions = ['mp4', 'mov', 'avi', 'mkv', 'flv', 'wmv'];
 //    const documentExtensions = [
 //      'pdf',
 //      'doc',
 //      'docx',
 //      'txt',
 //      'xls',
 //      'xlsx',
 //      'ppt',
 //      'pptx'
 //    ];
 //
 //    if (imageExtensions.contains(extension)) {
 //      return UploadedFileType.image;
 //    } else if (videoExtensions.contains(extension)) {
 //      return UploadedFileType.video;
 //    } else if (documentExtensions.contains(extension)) {
 //      return UploadedFileType.document;
 //    } else {
 //      throw Exception('Unsupported file type for extension: .$extension');
 //    }
 //  }
}

class MediaDimensions {
  final int width;
  final int height;

  MediaDimensions({required this.width, required this.height});
}
