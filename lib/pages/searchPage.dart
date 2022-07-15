import 'dart:convert';
import 'package:untitled2/models/flight.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/pages/homePage.dart';
import 'package:untitled2/firebase_options.dart';
import 'package:untitled2/src/widgets.dart';
import 'package:untitled2/src/authentication.dart';
import 'package:untitled2/api_service.dart';
import 'dart:async';

import 'errorPage.dart';

class SearchPage extends StatefulWidget {
  final String departureDate;
  final String originAirport;
  final String destinationAirport;
  final String? arrivalDate;

  const SearchPage(
      {Key? key,
      required this.departureDate,
      required this.originAirport,
      required this.destinationAirport,
      this.arrivalDate})
      : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late Flight? _userModel;
  late Timer time;
  List<FlightElement>? _model = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'api_key': 'eqj6v6bn8sabeud6geype2w7',
      'x-csl-client-uuid': 'dddddddddd'
    };

    final data = jsonEncode({
      "scheduledDepartureDate": widget.departureDate,
      "scheduledArrivalDate": widget.arrivalDate,
      "originAirportCode": widget.originAirport,
      "destinationAirportCode": widget.destinationAirport
    });

    _userModel = (await ApiService(requestHeaders: requestHeaders, data: data)
        .getUsers());
    if (_userModel == null) {
      Navigator.pushAndRemoveUntil<void>(context, MaterialPageRoute<void>(builder: (BuildContext context) => ErrorPage()), ModalRoute.withName("homePage"));
    } else {
      _model = _userModel!.data.response.flights;
      Future.delayed(const Duration(seconds: 1)).then((value) =>
          setState(() {}));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                const Text('RESULTS',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                SizedBox(width: 15),
                Icon(IconData(0xf54b, fontFamily: 'MaterialIcons'),
                    size: 25, color: Colors.white)
              ]))),
      body: _model == null ? const Center(child: Text("Flight not found"))
      : _model!.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Container(
                child: ListView.builder(
                  itemCount: _model?.length,
                  itemBuilder: (context, index) {
                    print(_model?.length);
                    print(_userModel!.data.response.numberOfFlights);
                    return Card(
                      child: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  child: Text(
                                      "Flight Number: " +
                                          _model![index]
                                              .legs[0]
                                              .operatingAirlineCode +
                                          _model![index].legs[0].flightNumber,
                                      style: TextStyle(fontSize: 16)),
                                  height: 20,
                                  width: 200,
                                ),
                                SizedBox(width: 20),
                                SizedBox(
                                    child: Text(
                                        _model![index].origin.cityName +
                                            ", " +
                                            _model![index].origin.airportCode,
                                        style: TextStyle(fontSize: 16)),
                                    height: 20,
                                    width: 150),
                                SizedBox(
                                  height: 20,
                                  width: 80,
                                  child: Icon(Icons.arrow_forward_rounded,
                                      size: 16, color: Colors.black),
                                ),
                                SizedBox(
                                  child: Text(
                                      _model![index].destination.cityName +
                                          ", " +
                                          _model![index]
                                              .destination
                                              .airportCode,
                                      style: TextStyle(fontSize: 16)),
                                  height: 20,
                                  width: 200,
                                ),
                              ]),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                child: Text(
                                    "Flight Status: " +
                                        _model![index].legs[0].flightStatus,
                                    style: TextStyle(fontSize: 16)),
                                height: 20,
                                width: 200,
                              ),
                              SizedBox(width: 20),
                              SizedBox(
                                child: Text("Scheduled Departure",
                                    style: TextStyle(fontSize: 16)),
                                height: 20,
                                width: 200,
                              ),
                              SizedBox(
                                width: 30,
                                height: 20,
                              ),
                              SizedBox(
                                  child: Text("Scheduled Arrival",
                                      style: TextStyle(fontSize: 16)),
                                  height: 20,
                                  width: 200),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                                width: 220,
                              ),
                              SizedBox(
                                child: Text(
                                    _model![index]
                                        .legs[0]
                                        .scheduledDepartureTime.replaceFirst("T", " "),
                                    style: TextStyle(fontSize: 16)),
                                width: 200,
                                height: 20,
                              ),
                              SizedBox(
                                width: 30,
                                height: 20,
                              ),
                              SizedBox(
                                child: Text(
                                    _model![index].legs[0].scheduledArrivalTime.replaceFirst("T", " "),
                                    style: TextStyle(fontSize: 16)),
                                height: 20,
                                width: 200,
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
    );
  }
}

