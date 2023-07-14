import 'package:intl/intl.dart';

class TimeAgoUtils {
  static String convertToAgo(DateTime date) {
    Duration difference = DateTime.now().difference(date);
    print('============================$difference');

    if (difference.inDays >= 8) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(date);
      print('============================$formattedDate');
      return formattedDate.toString();
    } else if ((difference.inDays / 7).floor() >= 1) {
      return 'Last week';
    } else if (difference.inDays >= 2) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays >= 1) {
      return 'Yesterday';
    } else if (difference.inHours >= 1) {
      return '${difference.inHours} hours ago';
    } else if (difference.inMinutes >= 1) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} seconds ago';
    } else {
      return 'Just now';
    }
  }

  static DateTime dateOnly(DateTime date) {
  return DateTime(date.year, date.month, date.day);

}

}