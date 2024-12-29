import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniapp_telegram_final/presentation/pages/all_flights/widgets/flight_card_widget.dart';
import 'package:miniapp_telegram_final/presentation/pages/flight_detail/logic.dart';
import 'package:miniapp_telegram_final/res/app_spacing.dart';

class FlightRules extends GetView<FlightDetailLogic> {
  const FlightRules({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.s24, vertical: AppSpacing.s24),
      child: ListView(
        children: [
          _buildSection(
            "قوانین استرداد",
            controller.data?.refundPolicy?.entries.map((e) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        bottom: AppSpacing.s12,
                        right: AppSpacing.s24,
                        left: AppSpacing.s24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Text(
                          e.value,
                          style: Get.textTheme.bodySmall,
                        )),
                        Text("${e.key}%",
                            style: Get.textTheme.bodySmall
                                ?.copyWith(color: Get.theme.colorScheme.error)),
                      ],
                    ),
                  );
                }).toList() ??
                [],
          ),
          const SizedBox(
            height: AppSpacing.s24,
          ),
          _buildSection("بار مجاز", [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                      "بار چمدان: ${controller.data?.allowedBaggage?.checkedWeight ?? ""}"),
                  const SizedBox(
                    height: AppSpacing.s8,
                  ),
                  Text(
                    controller.data?.allowedBaggage?.checkedNote ?? "",
                    style: Get.textTheme.bodySmall,
                  ),
                  const SizedBox(
                    height: AppSpacing.s8,
                  ),
                  Text(
                      "کیف دستی: ${controller.data?.allowedBaggage?.carryOnWeight ?? ""}"),
                  const SizedBox(
                    height: AppSpacing.s8,
                  ),
                  Text(controller.data?.allowedBaggage?.carryOnNote ?? "",
                      style: Get.textTheme.bodySmall),
                  const SizedBox(
                    height: AppSpacing.s8,
                  ),
                  Text(controller.data?.allowedBaggage?.additionalFees ?? ""),
                ],
              ),
            )
          ]),
          const SizedBox(
            height: AppSpacing.s24,
          ),
          _buildSection("شرایط پرواز", [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s24),
              child: Column(
                children: [
                  Text(
                      "زمان حضور: ${controller.data?.flightConditions?.boardingTime ?? ""}"),
                  const SizedBox(
                    height: AppSpacing.s8,
                  ),
                  Text(
                      "نیاز به کارت شناسایی: ${controller.data?.flightConditions?.passportRequirement ?? ""}"),   const SizedBox(
                    height: AppSpacing.s8,
                  ),
                  Text(
                      "خدمات ویژه: ${controller.data?.flightConditions?.specialServices ?? ""}"),
                  const SizedBox(
                    height: AppSpacing.s8,
                  ),
                  Text(
                      "سیاست لغو: ${controller.data?.flightConditions?.cancellationPolicy ?? ""}"),
                ],
              ),
            ),
          ]),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> content) {
    return ExpansionTile(
      visualDensity: VisualDensity.standard,
      childrenPadding: const EdgeInsets.only(bottom: AppSpacing.s16),
      collapsedBackgroundColor: Get.theme.colorScheme.surface,
      collapsedIconColor: Get.theme.colorScheme.onSurface,
      iconColor: Get.theme.colorScheme.onSurface,
      expandedAlignment: Alignment.centerRight,
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.corner8)),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.corner8)),
      backgroundColor: Get.theme.colorScheme.surface,
      title: Text(
        title,
        style: Get.textTheme.titleSmall,
        textAlign: TextAlign.start,
      ),
      children: content,
    );
  }
}
