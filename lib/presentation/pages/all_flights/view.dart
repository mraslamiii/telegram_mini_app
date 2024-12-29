import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:miniapp_telegram_final/domain/entities/flight_entity.dart';
import 'package:miniapp_telegram_final/presentation/pages/all_flights/logic.dart';
import 'package:miniapp_telegram_final/presentation/pages/all_flights/widgets/flight_card_widget.dart';
import 'package:miniapp_telegram_final/presentation/pages/all_flights/widgets/horiz_date_picker/horiz_date_picker.dart';
import 'package:miniapp_telegram_final/presentation/pages/all_flights/widgets/loading_flight_widget.dart';
import 'package:miniapp_telegram_final/res/app_spacing.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AllFlightsPage extends StatefulWidget {
  const AllFlightsPage({super.key});

  @override
  State<AllFlightsPage> createState() => _AllFlightsPageState();
}

class _AllFlightsPageState extends State<AllFlightsPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllFlightsLogic>(
        builder: (controller) => Scaffold(
              body: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      pinned: true,
                      leading: const Icon(Icons.arrow_back),
                      title: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'مشهد',
                            style: Get.textTheme.titleMedium?.copyWith(
                                color: Get.theme.colorScheme.onPrimary),
                          ),
                          Text(
                            'به',
                            style: Get.textTheme.titleMedium?.copyWith(
                                color: Get.theme.colorScheme.onPrimary),
                          ),
                          Text(
                            'تهران',
                            style: Get.textTheme.titleMedium?.copyWith(
                                color: Get.theme.colorScheme.onPrimary),
                          ),
                        ],
                      ),
                    )
                  ];
                },
                body: controller.obx(
                  (state) => RefreshIndicator(
                    onRefresh: () => controller.getFlights(),
                    child: Obx(() {
                      return CustomScrollView(
                        slivers: [
                          SliverToBoxAdapter(
                            child: HorizDatePicker(
                              dates: controller.extractUniqueDates(state!),
                            ),
                          ),
                          SliverList.builder(
                            itemCount: controller.filterFlightList.value.length,
                            itemBuilder: (context, index) => Container(
                              margin: const EdgeInsets.only(
                                  right: AppSpacing.s24,
                                  left: AppSpacing.s24,
                                  bottom: AppSpacing.s16),
                              child: FlightCardWidget(
                                  flightEntity:
                                      controller.filterFlightList.value[index]),
                            ),
                          )
                        ],
                      )
                          .animate()
                          .fadeIn(duration: AppDuration.standardDuration);
                    }),
                  ),

                  // here you can put your custom loading indicator, but
                  // by default would be Center(child:CircularProgressIndicator())
                  onLoading: Container(
                      margin: const EdgeInsets.only(
                          right: AppSpacing.s24,
                          left: AppSpacing.s24,
                          bottom: AppSpacing.s16),
                      child: LoadingFlightWidget()),
                  onEmpty: const Text('No data found'),

                  onError: (error) => Text('error'),
                ),
              ),
            ));
  }
}
