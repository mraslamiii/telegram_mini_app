import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniapp_telegram_final/domain/entities/flight_entity.dart';
import 'package:miniapp_telegram_final/presentation/pages/all_flights/widgets/flight_card_widget.dart';
import 'package:miniapp_telegram_final/res/app_spacing.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoadingFlightWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.s16),
          child: AspectRatio(
            aspectRatio: 16 / 2.5 ,
            child: Skeletonizer(
              enabled: true,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: AppSpacing.s4),
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s24),
                  decoration: BoxDecoration(
                      color: Get.theme.colorScheme.surface,
                      borderRadius: BorderRadius.circular(AppRadius.corner8)),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '-------',
                      ),
                      Text('---------'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.s24),
          child: Column(
            children: [
              CupertinoActivityIndicator(color: Get.theme.colorScheme.primary,),
              SizedBox(height: AppSpacing.s16,),
              Text('در حال جستجوی بلیط')
            ],
          ),
        ),
        Skeletonizer(
          enabled: true,
          child: SizedBox(
            height: 1000,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: 10,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.s12),
                child: FlightCardWidget(
                    flightEntity: FlightEntity(
                        currency: '----',
                        destination: '----',
                        destinationAirport: '-----',
                        id: -1,
                        endTime: '2024-11-4 16:45:00',
                        flightClass: '-------',
                        flightName: '------',
                        flightNumber: '-------',
                        origin: '-------',
                        originAirport: '--------',
                        price: 20000000,
                        remainTickets: 20,
                        startTime: '2024-11-4 16:45:00')),
              ),
            ),
          ),
        )
      ],
    );
  }
}
