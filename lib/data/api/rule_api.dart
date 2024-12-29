import 'package:miniapp_telegram_final/core/constant/api_endpoint.dart';
import 'package:miniapp_telegram_final/data/models/flight_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

import '../models/rule_model.dart';

part 'rule_api.g.dart';

@RestApi(baseUrl: ApiEndpoint.baseUrl)
abstract class RuleApiClient {
  factory RuleApiClient(Dio dio, {String baseUrl}) = _RuleApiClient;

  @GET(ApiEndpoint.rule)
  Future<FlightDetail> rules(@Query('key') String key);
}
