import 'package:get/get.dart';

import 'package:intl/intl.dart';
import 'package:miniapp_telegram_final/domain/entities/flight_entity.dart';
import 'package:miniapp_telegram_final/domain/usecase/flight_usecase.dart';

import '../../../core/utilities/time_convertor.dart';

class AllFlightsLogic extends GetxController
    with StateMixin<List<FlightEntity>> {
  FlightUseCase flightUseCase = FlightUseCase();

  RxList filterFlightList = RxList();
  RxString dateSelected = RxString('');
  List minPriceList = [];

  @override
  void onInit() {
    super.onInit();
    getFlights();
  }

  Future getFlights() async {
    change([], status: RxStatus.loading());

    try {
      var data = await flightUseCase.fetchAllFlights();
      change(data, status: RxStatus.success());
      changeFilterList(state![0].startTime ?? '');
      minPriceList = getMinPriceForEachDay(state!);
    } catch (e) {
      RxStatus.error();

      rethrow;
    }
  }

  // Function to filter flights by date
  List<FlightEntity> filterFlightsByDate(
      List<FlightEntity> flights, String date) {
    DateTime targetDate = DateFormat("yyyy-MM-d").parse(date);
    return flights.where((flight) {
      String startTime = flight.startTime ?? '';
      DateTime flightDate = DateFormat("yyyy-MM-dd HH:mm:ss").parse(startTime);
      // Compare the date part of the start time
      return flightDate.year == targetDate.year &&
          flightDate.month == targetDate.month &&
          flightDate.day == targetDate.day;
    }).toList();
  }

  changeFilterList(String date) {
    filterFlightList.value = filterFlightsByDate(state!, date);

    dateSelected.value = formatDateString(date);
  }

  List<int> getMinPriceForEachDay(List<FlightEntity> flights) {
    Map<String, List<int>> datePriceMap = {};

    for (var flight in flights) {
      String startTime = flight.startTime ?? '';
      int price = flight.price ?? 0;

      // Extract date part without time
      DateTime dateTime = DateFormat("yyyy-MM-d HH:mm:ss").parse(startTime);
      String dateStr = DateFormat("yyyy-MM-d").format(dateTime);

      // Add price to the list of prices for that specific date
      if (datePriceMap.containsKey(dateStr)) {
        datePriceMap[dateStr]?.add(price);
      } else {
        datePriceMap[dateStr] = [price];
      }
    }

    // for each date, find the minimum price
    List<int> minPrices = [];
    datePriceMap.forEach((date, prices) {
      // Get the minimum price for each date
      int minPrice = prices.reduce((a, b) => a < b ? a : b);
      minPrices.add(minPrice);
    });

    return minPrices;
  }

  List<String> extractUniqueDates(List<FlightEntity> flights) {
    // Set to store unique date strings
    Set<String> uniqueDatesSet = {};

    // Loop through each flight and extract the date part
    for (var flight in flights) {
      String startTime = flight.startTime ?? '';
      // Parse the date and time
      DateTime dateTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(startTime);
      // Format as 'yyyy-MM-d' to remove leading zero in the day
      String formattedDate = DateFormat("yyyy-MM-d").format(dateTime);

      // Get the day of the week (e.g., Monday, Tuesday, etc.)
      String dayOfWeek = DateFormat('EEEE').format(dateTime);

      // Combine the formatted date with the day of the week
      String uniqueDateWithWeekday = "$formattedDate ($dayOfWeek)";

      // Add to the set to ensure uniqueness
      uniqueDatesSet.add(uniqueDateWithWeekday);
    }

    // Convert the set back to a list and return
    return uniqueDatesSet.toList();
  }
}
