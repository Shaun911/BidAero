import 'dart:developer';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:http/http.dart';
import 'package:untitled2/constants.dart';

import 'package:untitled2/pages/homePage.dart';
import 'package:untitled2/models/flight.dart';

class ApiService {
  Map<String, String> requestHeaders;
  String data;
  ApiService({required this.requestHeaders, required this.data});

  Future<Flight?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl);
      var response = await post(url, headers: requestHeaders, body: data);
      if (response.statusCode == 200) {
        Flight _model = flightFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}

