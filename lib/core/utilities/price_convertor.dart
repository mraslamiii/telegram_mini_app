import 'package:intl/intl.dart';

String formatPrice(int price, {bool showLastZeros = true}) {
  final formatter = NumberFormat("#,###");

  // If showLastZeros is false, remove the last three zeros
  if (!showLastZeros) {
    price = (price ~/ 1000); // Divide by 1000 and drop the remainder
  }

  String formattedPrice = formatter.format(price);

  // Add the appropriate suffix if the last three zeros are removed
  return showLastZeros ? "$formattedPrice" : "$formattedPrice";
}