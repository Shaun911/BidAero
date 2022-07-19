import 'dart:convert';

List<Mockend> mockendFromJson(String str) => List<Mockend>.from(json.decode(str).map((x) => Mockend.fromJson(x)));

String mockendToJson(List<Mockend> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Mockend {
  Mockend({
    required this.destinationAirportTerminal,
    required this.destinationCity,
    required this.flightNumber,
    required this.flightStatus,
    required this.id,
    required this.originAirportGate,
    required this.originAirportTerminal,
    required this.originCity,
    required this.scheduledArrival,
    required this.scheduledDeparture,
  });

  int destinationAirportTerminal;
  String destinationCity;
  String flightNumber;
  String flightStatus;
  int id;
  String originAirportGate;
  int originAirportTerminal;
  String originCity;
  String scheduledArrival;
  String scheduledDeparture;

  factory Mockend.fromJson(Map<String, dynamic> json) => Mockend(
    destinationAirportTerminal: json["destinationAirportTerminal"],
    destinationCity: json["destinationCity"],
    flightNumber: json["flightNumber"],
    flightStatus: json["flightStatus"],
    id: json["id"],
    originAirportGate: json["originAirportGate"],
    originAirportTerminal: json["originAirportTerminal"],
    originCity: json["originCity"],
    scheduledArrival: json["scheduledArrival"],
    scheduledDeparture: json["scheduledDeparture"],
  );

  Map<String, dynamic> toJson() => {
    "destinationAirportTerminal": destinationAirportTerminal,
    "destinationCity": destinationCity,
    "flightNumber": flightNumber,
    "flightStatus": flightStatus,
    "id": id,
    "originAirportGate": originAirportGate,
    "originAirportTerminal": originAirportTerminal,
    "originCity": originCity,
    "scheduledArrival": scheduledArrival,
    "scheduledDeparture": scheduledDeparture,
  };
}
