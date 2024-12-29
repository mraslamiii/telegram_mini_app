import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniapp_telegram_final/core/routes/app_pages.dart';
import 'package:miniapp_telegram_final/core/utilities/time_convertor.dart';
import 'package:miniapp_telegram_final/domain/entities/flight_entity.dart';
import 'package:miniapp_telegram_final/presentation/pages/all_flights/widgets/remain_ticket_widget.dart';
import 'package:miniapp_telegram_final/presentation/widgets/price.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../res/app_spacing.dart';
import 'flight_animation.dart';
import 'flight_class_widget.dart';

class FlightCardWidget extends StatelessWidget {
  final FlightEntity flightEntity;
  final bool? isShowTicketRemain;

  const FlightCardWidget(
      {super.key, required this.flightEntity, this.isShowTicketRemain = true});

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap: () =>
          Get.toNamed(Routes.flightDetailPage, arguments: flightEntity),
      child: Container(
        decoration: BoxDecoration(
            color: Get.theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(AppRadius.corner8)),
        padding: const EdgeInsets.symmetric(
          vertical: AppSpacing.s8,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s16),
              child: Row(
                children: [
                  flightEntity.flightLogo != null &&
                          flightEntity.flightLogo!.isNotEmpty
                      ? CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage:
                              NetworkImage(flightEntity.flightLogo ?? ''),
                        )
                      : CircleAvatar(
                          backgroundColor: Colors.grey.shade200,
                        ),
                  const SizedBox(
                    width: AppSpacing.s4,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        flightEntity.flightName ?? '',
                        style: Get.textTheme.bodyMedium,
                      ),
                      const SizedBox(
                        height: AppSpacing.s4,
                      ),
                      Text(
                        flightEntity.flightNumber ?? '',
                        style: Get.textTheme.bodySmall,
                      ),
                    ],
                  ),
                  const Spacer(),
                  FlightClassWidget(
                    flightEntity: flightEntity,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: AppSpacing.s16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s16),
              child: Row(
                children: [
                  Text(
                    extractHour(flightEntity.startTime ?? '') ?? '',
                    style: Get.textTheme.titleLarge,
                  ),
                  const SizedBox(
                    width: AppSpacing.s4,
                  ),
                  Text(
                    flightEntity.origin ?? '',
                    style: Get.textTheme.bodyMedium,
                  ),
                  const Expanded(child: FlightAnimationWidget()),
                  Text(
                    extractHour(flightEntity.endTime ?? '') ?? '',
                    style: Get.textTheme.titleLarge,
                  ),
                  const SizedBox(
                    width: AppSpacing.s4,
                  ),
                  Text(
                    flightEntity.destination ?? '',
                    style: Get.textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: AppSpacing.s8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s16),
              child: Row(
                children: [
                  Text(
                    flightEntity.originAirport ?? '',
                    style: Get.textTheme.bodySmall,
                  ),
                  const Spacer(),
                  Text(
                    flightEntity.destinationAirport ?? '',
                    style: Get.textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: AppSpacing.s8,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RotatedBox(
                  quarterTurns: 3,
                  child: Container(
                    height: 10,
                    width: 20,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                        color: context.theme.scaffoldBackgroundColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(100.0),
                          topRight: Radius.circular(100.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppSpacing.s4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: buildDashWidgets(context, 200),
                    ),
                  ),
                ),
                RotatedBox(
                  quarterTurns: 5,
                  child: Container(
                    height: 10,
                    width: 20,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                        color: context.theme.scaffoldBackgroundColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(100.0),
                          topRight: Radius.circular(100.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: AppSpacing.s8,
            ),
            if (isShowTicketRemain ?? true)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s16),
                child: Row(
                  children: [
                    RemainTicketWidget(
                      flightEntity: flightEntity,
                    ),
                    const Spacer(),
                    PriceWidget(flightEntity: flightEntity)
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
