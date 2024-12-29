class FlightRulesEntity {
  final Map<String, String>? refundPolicy;
  final AllowedBaggageEntity? allowedBaggage;
  final FlightConditionsEntity? flightConditions;

  FlightRulesEntity({
    this.refundPolicy,
    this.allowedBaggage,
    this.flightConditions,
  });
}

class AllowedBaggageEntity {
  final String? checkedWeight;
  final String? checkedNote;
  final String? carryOnWeight;
  final String? carryOnDimensions;
  final String? carryOnNote;
  final String? additionalFees;

  AllowedBaggageEntity({
    this.checkedWeight,
    this.checkedNote,
    this.carryOnWeight,
    this.carryOnDimensions,
    this.carryOnNote,
    this.additionalFees,
  });
}

class FlightConditionsEntity {
  final String? boardingTime;
  final String? passportRequirement;
  final String? specialServices;
  final String? cancellationPolicy;

  FlightConditionsEntity({
    this.boardingTime,
    this.passportRequirement,
    this.specialServices,
    this.cancellationPolicy,
  });
}
