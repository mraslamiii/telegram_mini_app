import 'package:get/get.dart';
import 'package:miniapp_telegram_final/presentation/pages/all_flights/binding.dart';
import 'package:miniapp_telegram_final/presentation/pages/all_flights/view.dart';
import 'package:miniapp_telegram_final/presentation/pages/flight_detail/binding.dart';
import 'package:miniapp_telegram_final/presentation/pages/flight_detail/view.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = Routes.flightsPage;

  static final routes = [
    GetPage(
        name: Routes.flightsPage,
        page: () => const AllFlightsPage(),
        binding: AllFlightsBinding()),
    GetPage(
        name: Routes.flightDetailPage,
        page: () => const FlightDetailPage(),
        binding: FlightDetailBinding()),
  ];
}
