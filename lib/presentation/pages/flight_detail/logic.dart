import 'package:get/get.dart';
import 'package:miniapp_telegram_final/domain/entities/flight_entity.dart';
import 'package:miniapp_telegram_final/domain/entities/rule_entity.dart';
import 'package:miniapp_telegram_final/domain/usecase/flight_rule_usecase.dart';

class FlightDetailLogic extends GetxController {
  late FlightEntity flightEntity;
  RxBool isLoading = RxBool(false);
  FlightRulesEntity? data;

  FlightRuleUseCase flightRulesUseCase = FlightRuleUseCase();

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      flightEntity = Get.arguments;
    }
    getRules();
  }

  Future getRules() async {
    isLoading.value = true;
    try {
      var a = await flightRulesUseCase.fetchRules();
      data = a.flightDetails;
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;

      rethrow;
    }
  }
}
