import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:miniapp_telegram_final/core/utilities/price_convertor.dart';
import 'package:miniapp_telegram_final/presentation/pages/all_flights/logic.dart';
import 'package:miniapp_telegram_final/res/app_spacing.dart';

import '../../../../../core/utilities/time_convertor.dart';

class HorizDatePicker extends GetView<AllFlightsLogic> {
  final List<String> dates;

  const HorizDatePicker({super.key, required this.dates});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.s16),
      child: AspectRatio(
        aspectRatio: 16 / 2.1,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s16),
          scrollDirection: Axis.horizontal,
          itemCount: dates.length,
          itemBuilder: (context, index) => controller.status.isLoading
              ? Container()
              : Obx(() {
                  return GestureDetector(
                    onTap: () => controller.changeFilterList(dates[index]),
                    child: Container(
                      margin:
                          const EdgeInsets.symmetric(horizontal: AppSpacing.s4),
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.s24),
                      decoration: BoxDecoration(
                          color: controller.dateSelected.value == dates[index]
                              ? Get.theme.colorScheme.primary
                              : Get.theme.colorScheme.surface,
                          borderRadius:
                              BorderRadius.circular(AppRadius.corner8)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            convertToShamsi(dates[index] ?? ''),
                            style: Get.textTheme.bodyMedium?.copyWith(
                                color: controller.dateSelected.value ==
                                        dates[index]
                                    ? Get.theme.colorScheme.onPrimary
                                    : Get.theme.colorScheme.onSurface),
                          ),
                          Text(
                            formatPrice(controller.minPriceList[index] ?? 0,
                                showLastZeros: false),
                            style: Get.textTheme.bodyMedium?.copyWith(
                                color: controller.dateSelected.value ==
                                        dates[index]
                                    ? Get.theme.colorScheme.onPrimary
                                    : Get.theme.colorScheme.onSurface),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
        ),
      ),
    );
  }
}
