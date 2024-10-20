import 'dart:io';
import 'dart:ui' as ui;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'dart:typed_data';

import 'package:intl/intl.dart';

class UtilityFunctions {
//----------------------------------------------------------------------------//
//A function to handle all types of images given image url (asset, network, base64, and svg image formats)

  static Widget getImage(String imageUrl,
      {double? width,
      double? height,
      BoxFit fit = BoxFit.contain,
      Color? color}) {
    if (imageUrl.startsWith('assets/')) {
      return Image.asset(
        imageUrl,
        width: width,
        height: height,
        fit: fit,
        color: color,
      );
    } else if (imageUrl.startsWith('data:image/svg+xml;base64,')) {
      // Handle base64-encoded SVG images
      String base64Svg =
          imageUrl.replaceFirst('data:image/svg+xml;base64,', '');
      Uint8List bytes = base64Decode(base64Svg);
      String decodedSvg = utf8.decode(bytes);

      return SvgPicture.string(
        decodedSvg,
        width: width,
        height: height,
        color: color,
      );
    } else if (imageUrl.startsWith('data:image/')) {
      // Handle other base64 images (e.g., PNG, JPEG)
      List<String> parts = imageUrl.split(',');
      if (parts.length == 2) {
        String mimeType = parts[0];
        String base64String = parts[1];

        return Image.memory(
          const Base64Decoder().convert(base64String),
          width: width,
          height: height,
          fit: fit,
          color: color,
        );
      }
    } else {
      return Image.network(
        imageUrl,
        width: width,
        height: height,
        fit: fit,
        color: color,
        errorBuilder:
            (BuildContext context, Object exception, StackTrace? stackTrace) {
          return Image.asset(
            'assets/images/no_image.png',
            color: Colors.white,
            width: width,
            height: height,
            fit: fit,
          );
        },
      );
    }
    return Image.asset(
      'assets/images/no_image.png',
      color: Colors.white,
      width: width,
      height: height,
      fit: fit,
    );
  }

//----------------------------------------------------------------------------//

  //----------------------------------------------------------------------------//
//Utility function that takes a DataTime and returns a formatted string, example: 10/09/2024

  static String formatDateToWrittenString({required DateTime dateTime}) {
    //final weekday = DateFormat('EEE').format(dateTime);
    final month = DateFormat('MMM').format(dateTime);
    final day = DateFormat('ddd').format(dateTime);
    final year = DateFormat('yyyy').format(dateTime);

    final monthShort = month.substring(0, 3);

    return '$day/$monthShort/$year';
  }

//----------------------------------------------------------------------------//


  //----------------------------------------------------------------------------//
//Utility function that takes the start and end date of a given booking, and returns a list of the booked/subscribed dates

  List<DateTime> fromStartAndEndDateToListOfDates(
      {required DateTime startDate, required DateTime endDate}) {
    List<DateTime> list = [];

      list.add(startDate);
      for (var i = 0; i < endDate.difference(startDate).inDays - 1; i++) {
        list.add(list.last.add(const Duration(days: 1)));
      }

      list.add(endDate);

    return list;
  }

//----------------------------------------------------------------------------//

// //----------------------------------------------------------------------------//
// //Utility function that takes a DataTime and returns a formatted string, example: Tuesday, 10 Oct, 2023
//
//   static String formatDateToWrittenString({required DateTime dateTime, bool includeWeekday = false}) {
//     final weekday = DateFormat('EEE').format(dateTime);
//     final month = DateFormat('MMM').format(dateTime);
//     final day = DateFormat('ddd').format(dateTime);
//     final year = DateFormat('yyyy').format(dateTime);
//
//     final monthShort = month.substring(0, 3);
//
//     return '$weekday, $monthShort $day, $year';
//   }
//
// //----------------------------------------------------------------------------//

//----------------------------------------------------------------------------//
//Utility function that takes a DataTime and returns a formatted time, example: 6:30 PM

  static String formatTime({required DateTime dateTime}) {
    final hour = DateFormat('h').format(dateTime);
    final minute = DateFormat('mm').format(dateTime);
    final ampm = DateFormat('a').format(dateTime);

    return '$hour:$minute $ampm';
  }
//----------------------------------------------------------------------------//

//----------------------------------------------------------------------------//

  static String getIdOfCurrentUser() => FirebaseAuth.instance.currentUser!.uid;

  static Future<File> saveImageToFile(ui.Image image, String fileName) async {
    // Get the temporary directory using path_provider
    Directory tempDir = await getTemporaryDirectory();

    // Construct the file path
    String filePath = '${tempDir.path}/$fileName';

    // Convert ui.Image to ByteData
    ByteData? byteData =
        await image.toByteData(format: ui.ImageByteFormat.rawRgba);
    Uint8List rawBytes = byteData!.buffer.asUint8List();

    // Save as JPEG
    File imageFile = File(filePath);
    await imageFile.writeAsBytes(rawBytes);

    return imageFile;
  }

}
