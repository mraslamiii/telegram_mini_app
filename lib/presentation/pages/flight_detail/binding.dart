import 'package:get/get.dart';

import 'logic.dart';

class FlightDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FlightDetailLogic());
  }
}