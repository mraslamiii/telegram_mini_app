import 'package:miniapp_telegram_final/core/services/api_provider.dart';
import 'package:miniapp_telegram_final/data/api/flight_api.dart';
import 'package:miniapp_telegram_final/data/api/rule_api.dart';
import 'package:miniapp_telegram_final/data/models/flight_model.dart';
import 'package:miniapp_telegram_final/data/models/rule_model.dart';
import 'package:miniapp_telegram_final/domain/entities/flight_entity.dart';
import 'package:miniapp_telegram_final/domain/entities/rule_entity.dart';
import 'package:miniapp_telegram_final/domain/repository/flight_repository.dart';
import 'package:miniapp_telegram_final/domain/repository/flight_rule_repository.dart';
import 'package:miniapp_telegram_final/presentation/pages/flight_detail/pages/flight_rule.dart';

class FlightRuleRepositoryImpl extends FlightRuleRepository {
  late RuleApiClient _flightApiClient;

  FlightRuleRepositoryImpl() {
    // _dio = Dio();
    _flightApiClient = RuleApiClient(DioService.dio!);
  }

  @override
  Future<FlightDetail> getFlightRules() async {
    FlightDetail response = await _flightApiClient.rules('b8e48c60');
    try {
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
