import 'package:miniapp_telegram_final/core/services/api_provider.dart';
import 'package:miniapp_telegram_final/data/api/flight_api.dart';
import 'package:miniapp_telegram_final/data/models/flight_model.dart';
import 'package:miniapp_telegram_final/domain/entities/flight_entity.dart';
import 'package:miniapp_telegram_final/domain/repository/flight_repository.dart';

class FlightRepositoryImpl extends FlightRepository {
  late FlightApiClient _flightApiClient;

  FlightRepositoryImpl() {
    // _dio = Dio();
    _flightApiClient = FlightApiClient(DioService.dio!);
  }

  @override
  Future<List<FlightEntity>> getAllFlights() async {
    List<FlightModel> response = await _flightApiClient.flights('b8e48c60');
    try {
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
