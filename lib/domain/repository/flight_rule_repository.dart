
import '../../data/models/rule_model.dart';

abstract class FlightRuleRepository {
  Future<FlightDetail> getFlightRules();
}
