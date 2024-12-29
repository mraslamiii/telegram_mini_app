import 'package:intl/intl.dart';
import 'package:shamsi_date/shamsi_date.dart';

String extractHour(String dateTimeString) {
  if (dateTimeString.contains(" ")) {
    List<String> dateParts = dateTimeString.split(" ");
    List<String> date = dateParts[0].split("-");

    String correctedDate =
        "${date[0]}-${date[1].padLeft(2, '0')}-${date[2].padLeft(2, '0')} ${dateParts[1]}";

    DateTime dateTime = DateTime.parse(correctedDate);

    String hour =
        dateTime.hour.toString().padLeft(2, '0');
    String minute =
        dateTime.minute.toString().padLeft(2, '0');

    return "$hour:$minute";
  } else {
    throw FormatException("Invalid date format");
  }
}

String convertToShamsi(String dateTimeString) {
  // Split the input string into date and time parts
  List<String> parts = dateTimeString.split(' ');
  String datePart = parts[0];

  // Split the date part into year, month, and day
  List<String> dateSegments = datePart.split('-');
  String year = dateSegments[0];
  String month =
      dateSegments[1].padLeft(2, '0'); // Ensure two digits for the month
  String day = dateSegments[2].padLeft(2, '0'); // Ensure two digits for the day

  // Create a properly formatted DateTime string
  String formattedDateTime = '$year-$month-${day}';

  // Parse the formatted string into a DateTime object
  DateTime dateTime = DateTime.parse(formattedDateTime);

  // Convert the Gregorian date to Jalali (Shamsi) date
  final Jalali jalali = Jalali.fromDateTime(dateTime);

  // Return the formatted Shamsi date (day and month only)
  return '${jalali.day} ${jalali.formatter.mN}';
}

String formatDateString(String dateStr) {
  try {
    // Try parsing the date with time part
    DateTime dateTime = DateFormat("yyyy-MM-d HH:mm:ss").parse(dateStr);

    // Format the date to "yyyy-MM-d"
    String formattedDate = DateFormat("yyyy-MM-d").format(dateTime);

    // Get the weekday name (e.g., Monday)
    String weekday = DateFormat("EEEE").format(dateTime);

    // Combine them into the final format "yyyy-MM-d (Weekday)"
    return "$formattedDate ($weekday)";
  } catch (e) {
    // If no time is provided, just return the date in "yyyy-MM-d" format
    DateTime dateTime = DateFormat("yyyy-MM-d").parse(dateStr);
    String formattedDate = DateFormat("yyyy-MM-d").format(dateTime);
    String weekday = DateFormat("EEEE").format(dateTime);
    return "$formattedDate ($weekday)";
  }
}