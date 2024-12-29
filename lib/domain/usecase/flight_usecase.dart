import 'package:miniapp_telegram_final/data/repository/flight_repository.dart';
import 'package:miniapp_telegram_final/domain/entities/flight_entity.dart';

class FlightUseCase {
  final FlightRepositoryImpl _repo = FlightRepositoryImpl();

  Future<List<FlightEntity>> fetchAllFlights() async {
    return _repo.getAllFlights();
  }
}
