import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import '../../common_view/app_constants/app_images.dart';

class ImageUtilityFunctions {
  static ImageProvider<Object> getImage(String? imageUrl) {
    if (imageUrl == null || imageUrl.isEmpty) {
      return const AssetImage(AppImages.noImage);
    }

    ImageProvider<Object> imageProvider;

    if (imageUrl.startsWith('http') || imageUrl.startsWith('HTTP')) {
      imageProvider = CachedNetworkImageProvider(imageUrl);
    } else if (imageUrl.toLowerCase().endsWith('.svg')) {
      imageProvider = Svg(imageUrl);
    } else {
      imageProvider = AssetImage(imageUrl);
    }
    return imageProvider;
  }
}

