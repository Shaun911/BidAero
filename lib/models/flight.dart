import 'dart:convert';

Flight flightFromJson(String str) => Flight.fromJson(json.decode(str));

String flightToJson(Flight data) => json.encode(data.toJson());

class Flight {
  Flight({
    required this.status,
    required this.code,
    required this.data,
  });

  String status;
  String code;
  Data data;

  factory Flight.fromJson(Map<String, dynamic> json) => Flight(
    status: json["status"],
    code: json["code"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.status,
    required this.code,
    required this.message,
    required this.response,
  });

  String status;
  String code;
  String message;
  Response response;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    status: json["status"],
    code: json["code"],
    message: json["message"],
    response: Response.fromJson(json["response"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "message": message,
    "response": response.toJson(),
  };
}

class Response {
  Response({
    required this.origin,
    required this.destination,
    required this.numberOfFlights,
    required this.flights,
  });

  Destination origin;
  Destination destination;
  int numberOfFlights;
  List<FlightElement> flights;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    origin: Destination.fromJson(json["origin"]),
    destination: Destination.fromJson(json["destination"]),
    numberOfFlights: json["numberOfFlights"],
    flights: List<FlightElement>.from(json["flights"].map((x) => FlightElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "origin": origin.toJson(),
    "destination": destination.toJson(),
    "numberOfFlights": numberOfFlights,
    "flights": List<dynamic>.from(flights.map((x) => x.toJson())),
  };
}

class Destination {
  Destination({
    required this.airportCode,
    required this.airportName,
    required this.cityCode,
    required this.cityName,
  });

  String airportCode;
  String airportName;
  String cityCode;
  String cityName;

  factory Destination.fromJson(Map<String, dynamic> json) => Destination(
    airportCode: json["airportCode"],
    airportName: json["airportName"],
    cityCode: json["cityCode"],
    cityName: json["cityName"],
  );

  Map<String, dynamic> toJson() => {
    "airportCode": airportCode,
    "airportName": airportName,
    "cityCode": cityCode,
    "cityName": cityName,
  };
}

class FlightElement {
  FlightElement({
    required this.origin,
    required this.destination,
    required this.numberOfStops,
    required this.legs,
  });

  Destination origin;
  Destination destination;
  int numberOfStops;
  List<Leg> legs;

  factory FlightElement.fromJson(Map<String, dynamic> json) => FlightElement(
    origin: Destination.fromJson(json["origin"]),
    destination: Destination.fromJson(json["destination"]),
    numberOfStops: json["numberOfStops"],
    legs: List<Leg>.from(json["legs"].map((x) => Leg.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "origin": origin.toJson(),
    "destination": destination.toJson(),
    "numberOfStops": numberOfStops,
    "legs": List<dynamic>.from(legs.map((x) => x.toJson())),
  };
}

class Leg {
  Leg({
    required this.flightNumber,
    required this.operatingAirlineCode,
    required this.operatingAirlineName,
    required this.marketingAirlineCode,
    required this.marketingAirlineName,
    required this.isFlightRenumbered,
    required this.isFlightRerouted,
    required this.flightStatus,
    required this.origin,
    required this.destination,
    required this.scheduledDepartureTime,
    required this.scheduledArrivalTime,
    required this.provisionalEtd,
  });

  String flightNumber;
  String operatingAirlineCode;
  String operatingAirlineName;
  String marketingAirlineCode;
  String marketingAirlineName;
  bool isFlightRenumbered;
  bool isFlightRerouted;
  String flightStatus;
  Destination origin;
  Destination destination;
  String scheduledDepartureTime;
  String scheduledArrivalTime;
  bool provisionalEtd;

  factory Leg.fromJson(Map<String, dynamic> json) => Leg(
    flightNumber: json["flightNumber"],
    operatingAirlineCode: json["operatingAirlineCode"],
    operatingAirlineName: json["operatingAirlineName"],
    marketingAirlineCode: json["marketingAirlineCode"],
    marketingAirlineName: json["marketingAirlineName"],
    isFlightRenumbered: json["isFlightRenumbered"],
    isFlightRerouted: json["isFlightRerouted"],
    flightStatus: json["flightStatus"],
    origin: Destination.fromJson(json["origin"]),
    destination: Destination.fromJson(json["destination"]),
    scheduledDepartureTime: json["scheduledDepartureTime"],
    scheduledArrivalTime: json["scheduledArrivalTime"],
    provisionalEtd: json["provisionalEtd"],
  );

  Map<String, dynamic> toJson() => {
    "flightNumber": flightNumber,
    "operatingAirlineCode": operatingAirlineCode,
    "operatingAirlineName": operatingAirlineName,
    "marketingAirlineCode": marketingAirlineCode,
    "marketingAirlineName": marketingAirlineName,
    "isFlightRenumbered": isFlightRenumbered,
    "isFlightRerouted": isFlightRerouted,
    "flightStatus": flightStatus,
    "origin": origin.toJson(),
    "destination": destination.toJson(),
    "scheduledDepartureTime": scheduledDepartureTime,
    "scheduledArrivalTime": scheduledArrivalTime,
    "provisionalEtd": provisionalEtd,
  };
}
