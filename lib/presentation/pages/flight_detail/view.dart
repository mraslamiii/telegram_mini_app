import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniapp_telegram_final/presentation/pages/flight_detail/pages/flight_info.dart';
import 'package:miniapp_telegram_final/presentation/pages/flight_detail/pages/flight_rule.dart';
import 'package:miniapp_telegram_final/res/app_spacing.dart';

import '../../widgets/price.dart';
import 'logic.dart';

class FlightDetailPage extends StatefulWidget {
  const FlightDetailPage({super.key});

  @override
  State<FlightDetailPage> createState() => _FlightDetailPageState();
}

class _FlightDetailPageState extends State<FlightDetailPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FlightDetailLogic>(builder: (logic) {
      return DefaultTabController(
        length: 2,
        child: Scaffold(
          bottomNavigationBar: Container(
            padding: const EdgeInsets.symmetric(
                vertical: AppSpacing.s24, horizontal: AppSpacing.s24),
            height:Get.height / 6,
            color: Get.theme.colorScheme.surface,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "مجموع قابل پرداخت",
                          style: Get.textTheme.titleSmall,
                        ),
                        Text(
                          "برای یک مسافر",
                          style: Get.textTheme.bodySmall,
                        )
                      ],
                    ),
                    PriceWidget(flightEntity: logic.flightEntity)

                  ],
                ),
                const SizedBox(height: AppSpacing.s8,),
                SizedBox(
                  width: Get.width,
                  child: FilledButton(onPressed: () {

                  }, child: const Text('انتخاب بلیط')),
                )
              ],
            ),
          ),
          appBar: AppBar(
            bottom: const TabBar(tabs: [
              Tab(
                child: Text('اطلاعات پرواز'),
              ),
              Tab(
                child: Text("قوانین"),
              )
            ]),
            leading: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.arrow_back)),
            iconTheme: IconThemeData(color: Get.theme.colorScheme.onSurface),
            backgroundColor: Get.theme.colorScheme.surface,
            automaticallyImplyLeading: true,
            title: const Text('جزئیات پرواز'),
          ),
          body: const TabBarView(children: [
            FlightInfo(),
            FlightRules(),
          ]),
        ),
      );
    });
  }
}
