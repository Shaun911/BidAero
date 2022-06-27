/*import 'package:untitled2/models/airport.dart';

class AirportLookup {
  AirportLookup({required this.airports});
  final List<Airport> airports;

  Airport searchIata(String iata) {
    return airports.firstWhere((airport) => airport.iata == iata);
  }

  List<Airport> searchString(String string) {
    string = string.toLowerCase();
    final matching = airports.where((airport) {
      final iata = airport.iata ?? '';
      return iata.toLowerCase() == string ||
          airport.name.toLowerCase() == string ||
          airport.city.toLowerCase() == string ||
          airport.country.toLowerCase() == string;
    }).toList();
    // found exact matches
    if (matching.length > 0) {
      return matching;
    }
    // search again with less strict criteria
    return airports.where((airport) {
      final iata = airport.iata ?? '';
      return iata.toLowerCase().contains(string) ||
          airport.name.toLowerCase().contains(string) ||
          airport.city.toLowerCase().contains(string) ||
          airport.country.toLowerCase().contains(string);
    }).toList();
  }
}*/