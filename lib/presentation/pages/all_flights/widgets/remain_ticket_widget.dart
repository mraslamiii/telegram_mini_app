import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniapp_telegram_final/domain/entities/flight_entity.dart';
import 'package:miniapp_telegram_final/res/app_spacing.dart';

class RemainTicketWidget extends StatelessWidget {
  final FlightEntity flightEntity;

  const RemainTicketWidget({super.key, required this.flightEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.s8, vertical: AppSpacing.s4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.corner16),
          color: remainTicketColor(flightEntity.remainTickets ?? 0)),
      child: Row(
        children: [
          Icon(
            Icons.airplane_ticket_outlined,
            color: remainTextTicketColor(flightEntity.remainTickets ?? 0),
          ),
          const SizedBox(width: AppSpacing.s4,),
          Text.rich(
            TextSpan(
                text: "${flightEntity.remainTickets} ",
                children: const [TextSpan(text: 'بلیط مانده ')]),
            style: Get.textTheme.bodyMedium?.copyWith(
                color: remainTextTicketColor(flightEntity.remainTickets ?? 0)),
          )
        ],
      ),
    );
  }
}

Color remainTicketColor(int remainTicket) {
  if (remainTicket >= 15) {
    return Get.theme.colorScheme.outline.withOpacity(0.2);
  } else {
    return Get.theme.colorScheme.error.withOpacity(0.2);
  }
}

Color remainTextTicketColor(int remainTicket) {
  if (remainTicket >= 15) {
    return Get.theme.colorScheme.outlineVariant;
  } else {
    return Get.theme.colorScheme.error;
  }
}
