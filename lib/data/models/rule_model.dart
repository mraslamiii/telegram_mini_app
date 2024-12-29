import '../../domain/entities/rule_entity.dart';

class FlightDetail {
  FlightRulesModel? flightDetails;

  FlightDetail({this.flightDetails});

  factory FlightDetail.fromJson(Map<String, dynamic> json) {
    return FlightDetail(
      flightDetails: json['flightDetails'] != null
          ? FlightRulesModel.fromJson(json['flightDetails'])
          : null,
    );
  }
}

class FlightRulesModel extends FlightRulesEntity {
  FlightRulesModel(
      {super.allowedBaggage, super.flightConditions, super.refundPolicy});

  /// Factory constructor for creating a model from JSON
  factory FlightRulesModel.fromJson(Map<String, dynamic> json) {
    return FlightRulesModel(
      refundPolicy: Map<String, String>.from(json['refundPolicy'] ?? {}),
      allowedBaggage: json['allowedBaggage'] != null
          ? AllowedBaggageModel.fromJson(json['allowedBaggage'])
          : null,
      flightConditions: json['flightConditions'] != null
          ? FlightConditionsModel.fromJson(json['flightConditions'])
          : null,
    );
  }
}

class AllowedBaggageModel extends AllowedBaggageEntity {
  AllowedBaggageModel({
    super.checkedWeight,
    super.checkedNote,
    super.carryOnWeight,
    super.carryOnDimensions,
    super.carryOnNote,
    super.additionalFees,
  });

  factory AllowedBaggageModel.fromJson(Map<String, dynamic> json) {
    return AllowedBaggageModel(
      checkedWeight: json['checkedBaggage']['weight'],
      checkedNote: json['checkedBaggage']['note'],
      carryOnWeight: json['carryOnBaggage']['weight'],
      carryOnDimensions: json['carryOnBaggage']['dimensions'],
      carryOnNote: json['carryOnBaggage']['note'],
      additionalFees: json['additionalFees'],
    );
  }
}

class FlightConditionsModel extends FlightConditionsEntity {
  FlightConditionsModel({
    super.boardingTime,
    super.passportRequirement,
    super.specialServices,
    super.cancellationPolicy,
  });

  factory FlightConditionsModel.fromJson(Map<String, dynamic> json) {
    return FlightConditionsModel(
      boardingTime: json['boardingTime'],
      passportRequirement: json['passportRequirement'],
      specialServices: json['specialServices'],
      cancellationPolicy: json['cancellationPolicy'],
    );
  }
}
