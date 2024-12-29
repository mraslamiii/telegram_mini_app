import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:miniapp_telegram_final/domain/entities/flight_entity.dart';
import 'package:miniapp_telegram_final/res/app_spacing.dart';
import 'package:miniapp_telegram_final/res/colors/light_color.dart';

class FlightClassWidget extends StatelessWidget {
  final FlightEntity flightEntity;

  const FlightClassWidget({super.key, required this.flightEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.s8, vertical: AppSpacing.s4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.corner16),
          color: classColor(flightEntity.flightClass ?? '')),
      child: Text(
        flightEntity.flightClass ?? '',
        style: Get.textTheme.bodySmall
            ?.copyWith(color: textClassColor(flightEntity.flightClass ?? '')),
      ),
    );
  }
}

/// Returns a Color based on the provided flight class.
///
/// This function takes a flight class as input (e.g., "اکونومی", "بیزینس")
/// and returns a specific Color associated with that class.
/// - "اکونومی" returns a blue color (0xff6366F1).
/// - "بیزینس" returns an orange color (0xfff97316).
///
/// If the flight class is not one of the above, the function doesn't return anything.
Color classColor(String flightClass) {
  switch (flightClass) {
    case "اکونومی":
      return LightColor.agentColor.withOpacity(0.1); // Blue for Economy class
    case "بیزینس":
      return LightColor.warningColor.withOpacity(0.1); // Blue for Economy class
    default:
      // You can optionally add a default color here, if needed
      return LightColor.agentColor.withOpacity(0.1); // Blue for Economy class
  }
}

Color textClassColor(String flightClass) {
  switch (flightClass) {
    case "اکونومی":
      return LightColor.agentColor; // Blue for Economy class
    case "بیزینس":
      return LightColor.warningColor; // Blue for Economy class
    default:
      // You can optionally add a default color here, if needed
      return LightColor.agentColor; // Blue for Economy class
  }
}

