import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniapp_telegram_final/presentation/pages/all_flights/widgets/flight_card_widget.dart';
import 'package:miniapp_telegram_final/presentation/pages/flight_detail/logic.dart';
import 'package:miniapp_telegram_final/res/app_spacing.dart';

class FlightInfo extends GetView<FlightDetailLogic> {
  const FlightInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.s24, vertical: AppSpacing.s24),
      child: Column(
        children: [
          FlightCardWidget(
            flightEntity: controller.flightEntity,
            isShowTicketRemain: false,
          ),
          Container(
            decoration: BoxDecoration(
                color: Get.theme.colorScheme.surface,
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(AppRadius.corner8),
                    bottomLeft: Radius.circular(
                      AppRadius.corner8,
                    ))),
            child: GridView(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s24),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 3 / 1),
                children: [
                  titleFlightWidget(
                      'شماره پرواز', "${controller.flightEntity.flightNumber}"),
                  titleFlightWidget('مدت پرواز', "1 ساعت و ۲۵ دقیقه"),
                  titleFlightWidget(
                      'کلاس', "${controller.flightEntity.flightClass}"),
                  titleFlightWidget('شماره صندلی', "2D"),
                  titleFlightWidget('مدل هواپیما', "Beoing 737"),
                ]),
          ),
        ],
      ),
    );
  }

  Widget titleFlightWidget(String title, String value) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Get.textTheme.bodySmall,
          ),
          Text(value)
        ],
      ),
    );
  }
}
