import 'package:miniapp_telegram_final/data/repository/flight_repository.dart';
import 'package:miniapp_telegram_final/data/repository/flight_rule_repository.dart';
import 'package:miniapp_telegram_final/domain/entities/flight_entity.dart';
import 'package:miniapp_telegram_final/domain/entities/rule_entity.dart';
import 'package:miniapp_telegram_final/domain/repository/flight_rule_repository.dart';

import '../../data/models/rule_model.dart';

class FlightRuleUseCase {
  final FlightRuleRepository _repo = FlightRuleRepositoryImpl();

  Future<FlightDetail> fetchRules() async {
    return _repo.getFlightRules();
  }
}
