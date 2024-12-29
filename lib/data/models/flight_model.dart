import 'package:miniapp_telegram_final/domain/entities/flight_entity.dart';



class FlightModel extends FlightEntity {
  FlightModel(
      {super.id,
      super.flightName,
      super.flightNumber,
      super.flightClass,
      super.flightLogo,
      super.origin,
      String? destination,
      String? originAirpor,
      super.destinationAirport,
      super.startTime,
      super.endTime,
      super.remainTickets,
      super.price,
      super.currency})
      : super(originAirport: originAirpor);

  FlightModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    flightName = json['flightName'];
    flightNumber = json['flightNumber'];
    flightClass = json['flightClass'];
    flightLogo = json['flightLogo'];
    origin = json['origin'];
    destination = json['destination'];
    originAirport = json['originAirport'];
    destinationAirport = json['destinationAirport'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    remainTickets = json['remainTickets'];
    price = json['price'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['flightName'] = this.flightName;
    data['flightNumber'] = this.flightNumber;
    data['flightClass'] = this.flightClass;
    data['flightLogo'] = this.flightLogo;
    data['origin'] = this.origin;
    data['destination'] = this.destination;
    data['originAirport'] = this.originAirport;
    data['destinationAirport'] = this.destinationAirport;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['remainTickets'] = this.remainTickets;
    data['price'] = this.price;
    data['currency'] = this.currency;
    return data;
  }
}
