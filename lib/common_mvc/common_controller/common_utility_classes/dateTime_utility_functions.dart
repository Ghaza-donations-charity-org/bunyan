import 'package:intl/intl.dart';

class DateTimeUtilityFunctions {
  // Utility function that formats a DateTime to a string in the format: 10/09/2024
  static String convertDateToString({required DateTime dateTime}) {
    final month = dateTime.month.toString().padLeft(2, '0');
    final day = dateTime.day.toString().padLeft(2, '0');
    final year = dateTime.year;
    return '$day/$month/$year';
  }

  // Utility function to extract time from DateTime and return as a string (e.g., 14:30)
  static String extractTimeFromDateTime({required DateTime dateTime}) {
    final hour = dateTime.hour.toString().padLeft(2, '0');
    final minute = dateTime.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  // Utility function to convert a string (10/09/2024) to DateTime
  static DateTime parseStringToDateTime({required String dateString}) {
    try {
      return DateFormat('dd/MM/yyyy').parse(dateString);
    } catch (e) {
      throw const FormatException('Invalid date format. Expected format: dd/MM/yyyy');
    }
  }

  // Utility function to parse time (14:30) to DateTime
  static DateTime parseTimeStringToDateTime({required String timeString}) {
    try {
      return DateFormat('HH:mm').parse(timeString);
    } catch (e) {
      throw const FormatException('Invalid time format. Expected format: HH:mm');
    }
  }

  // Utility function to calculate the difference in days between two dates
  static int calculateDateDifference({required DateTime startDate, required DateTime endDate}) {
    return endDate.difference(startDate).inDays;
  }

  // Utility function to calculate the difference in minutes between two times
  static int calculateTimeDifference({required String startTime, required String endTime}) {
    DateTime startDateTime = parseTimeStringToDateTime(timeString: startTime);
    DateTime endDateTime = parseTimeStringToDateTime(timeString: endTime);

    return endDateTime.difference(startDateTime).inHours;
  }

  // Utility function to format DateTime to time string (HH:mm)
  static String formatDateTimeToTimeString({required DateTime dateTime}) {
    return DateFormat('HH:mm').format(dateTime);
  }
}





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


