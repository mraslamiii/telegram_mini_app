import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniapp_telegram_final/res/app_spacing.dart';

class FlightAnimationWidget extends StatefulWidget {
  const FlightAnimationWidget({super.key});

  @override
  _FlightAnimationWidgetState createState() => _FlightAnimationWidgetState();
}

class _FlightAnimationWidgetState extends State<FlightAnimationWidget>
    with TickerProviderStateMixin {
  late AnimationController _dotController;

  @override
  void initState() {
    super.initState();

    // Animation controller for the blue dots' shadow
    _dotController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true); // repeat animation back and forth

    // Animation controller for the plane's movement
  }

  @override
  void dispose() {
    _dotController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s8),
        child: Row(
          children: [
            AnimatedBuilder(
              animation: _dotController,
              builder: (context, child) {
                return Container(
                  width: 5,
                  height: 5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Get.theme.colorScheme.primary,
                    boxShadow: [
                      BoxShadow(
                        color: Get.theme.colorScheme.primary
                            .withOpacity(_dotController.value * 0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                );
              },
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s4),
                child: SizedBox(
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        bottom: 0,
                        top: 0,
                        right: 0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: buildDashWidgets(context, 200),
                        ),
                      ),
                      Center(
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: Icon(
                            Icons.airplanemode_active,
                            size: 20,
                            color: Get.theme.colorScheme.primary,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            AnimatedBuilder(
              animation: _dotController,
              builder: (context, child) {
                return Container(
                  width: 5,
                  height: 5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Get.theme.colorScheme.primary,
                    boxShadow: [
                      BoxShadow(
                        color: Get.theme.colorScheme.primary
                            .withOpacity(_dotController.value * 0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                      )
                    ],
                  ),
                );
              },
            ),

            // Airplane in the middle
          ],
        ),
      ),
    );
  }
}

List<Widget> buildDashWidgets(BuildContext context, double boxWidth) {
  double dashWidth = 10;
  double spaceWidth = 0;

  int dashCount = (boxWidth / (dashWidth + spaceWidth)).floor();

  return List.generate(
    dashCount,
    (index) => Flexible(
      child: dashWidget(context),
    ),
  );
}

Widget dashWidget(BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 2),
    height: 1,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(
        AppRadius.corner16,
      ),
      color: Get.theme.colorScheme.outline,
    ),
  );
}
