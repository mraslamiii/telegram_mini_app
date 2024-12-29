import 'package:miniapp_telegram_final/domain/entities/flight_entity.dart';

abstract class FlightRepository {
  Future<List<FlightEntity>> getAllFlights();
}
