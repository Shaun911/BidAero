// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:untitled2/api_service.dart';

import 'package:untitled2/main.dart';
import 'package:untitled2/models/mockend.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    List<Mockend>? expected = [Mockend(destinationAirportTerminal: 1, destinationCity: "Bangkok, BKK", flightNumber: "SQ64", flightStatus: 'Arrived', id: 15, originAirportGate: 'A3', originAirportTerminal: 1, originCity: 'Singapore, SIN', scheduledArrival: '2022-07-16  12:00', scheduledDeparture: '2022-07-15  08:00'),
    Mockend(destinationAirportTerminal: 1, destinationCity: 'Bangkok, BKK', flightNumber: 'SQ112', flightStatus: 'Departed', id: 35, originAirportGate: 'C6', originAirportTerminal: 1, originCity: 'Singapore, SIN', scheduledArrival: '2022-07-16  16:00', scheduledDeparture: '2022-07-15  14:00')];

    List<Mockend>?  actual = await (ApiService(origin: "Singapore", destination: "Bangkok", departureDate: '2022-07-15').getUsers());
    print(actual);
    print(expected);

    print(expected == actual);
  });
}

