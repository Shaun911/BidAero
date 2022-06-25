import 'dart:math';

import 'package:flutter/foundation.dart';


class LocationCoordinate2D {
  LocationCoordinate2D({required this.latitude, required this.longitude});
  final double latitude;
  final double longitude;

  @override
  String toString() {
    return "($latitude, $longitude)";
  }
}

class Airport{
  Airport({
    required this.name,
    required this.city,
    required this.country,
    this.iata,
    this.icao,
    required this.location,
  });
  //int airportID
  final String name;
  final String city;
  final String country;
  final String? iata;
  final String? icao;
  final LocationCoordinate2D location;


  factory Airport.fromLine(String line) {
    final components = line.split(",");
    if (components.length < 8) {

    }
    String name = components[1];
    String city = components[2];
    String country = components[3];
    String? iata = components[4];
    if (iata == '\\N') { // placeholder for missing iata code
      iata = null;
    }
    String icao = components[5];
    try {
      double latitude = double.parse(components[6]);
      double longitude = double.parse(components[7]);
      final location = LocationCoordinate2D(
          latitude: latitude, longitude: longitude);
      return Airport(
        name: name,
        city: city,
        country: country,
        iata: iata,
        icao: icao,
        location: location,
      );
    } catch (e) {
      try {
        // sometimes, components[6] is a String and the lat-long are stored
        // at index 7 and 8
        double latitude = double.parse(components[7]);
        double longitude = double.parse(components[8]);
        final location = LocationCoordinate2D(
            latitude: latitude, longitude: longitude);
        return Airport(
          name: name,
          city: city,
          country: country,
          iata: iata,
          location: location,
        );
      } catch (e) {
        throw(e);
      }
    }
  }
  // All fields are escaped with double quotes. This method deals with them


  @override
  String toString() {
    return "($iata, $icao) -> $name, $city, $country, ${location.toString()}";
  }
}