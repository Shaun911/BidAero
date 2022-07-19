import 'dart:developer';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:http/http.dart';
import 'package:untitled2/constants.dart';

import 'package:untitled2/pages/homePage.dart';
import 'package:untitled2/models/flight.dart';

import 'models/mockend.dart';

class ApiService {

  String origin;
  String destination;
  String departureDate;
  String? arrivalDate;

  ApiService({required this.origin, required this.destination, required this.departureDate, this.arrivalDate});

  Future<List<Mockend>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + "originCity_contains=$origin&destinationCity_contains=$destination&scheduledDeparture_contains=$departureDate&scheduledArrival_contains=$arrivalDate");
      print(url);
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<Mockend> _model = mockendFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}

