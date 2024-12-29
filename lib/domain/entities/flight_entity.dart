class FlightEntity {
  int? id;
  String? flightName;
  String? flightNumber;
  String? flightClass;
  String? flightLogo;
  String? origin;
  String? destination;
  String? originAirport;
  String? destinationAirport;
  String? startTime;
  String? endTime;
  int? remainTickets;
  int? price;
  String? currency;

  FlightEntity(
      {this.id,
      this.flightName,
      this.flightNumber,
      this.flightClass,
      this.flightLogo,
      this.origin,
      this.destination,
      this.originAirport,
      this.destinationAirport,
      this.startTime,
      this.endTime,
      this.remainTickets,
      this.price,
      this.currency});
}
