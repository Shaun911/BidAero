import 'dart:convert';
import 'package:untitled2/models/flight.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/pages/homePage.dart';
import 'package:untitled2/firebase_options.dart';
import 'package:untitled2/pages/savedPage.dart';
import 'package:untitled2/src/widgets.dart';
import 'package:untitled2/src/authentication.dart';
import 'package:untitled2/api_service.dart';
import 'dart:async';

import '../models/mockend.dart';
import 'errorPage.dart';

class SearchPage extends StatefulWidget {
  final String departureDate;
  final String originAirport;
  final String destinationAirport;
  final String? arrivalDate;
  final String? flightNumber;
  final List<Mockend> saved;

  const SearchPage(
      {Key? key,
      required this.departureDate,
      required this.originAirport,
      required this.destinationAirport,
        required this.saved,
      this.arrivalDate,
      this. flightNumber})
      : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  late Timer time;
  late List<Mockend>? _model = [];


  @override
  void initState() {

    super.initState();
    _getData();
  }

  void _getData() async {
    _model = (await ApiService(origin: widget.originAirport,
        destination: widget.destinationAirport,
        departureDate: widget.departureDate,
        arrivalDate: widget.arrivalDate,
    flightNumber: widget.flightNumber).getUsers())!;
    if (_model!.isEmpty) {
      Navigator.pushAndRemoveUntil<void>(context, MaterialPageRoute<void>(
          builder: (BuildContext context) => ErrorPage()),
          ModalRoute.withName("homePage"));
    } else {
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
                Icon(const IconData(0xf54b, fontFamily: 'MaterialIcons'),
                    size: 25, color: Colors.white)
              ])),
        actions: [
          IconButton(icon: Icon(Icons.list), iconSize: 20, color: Colors.white, onPressed: _pushSavedFlight)
        ],),
      body: _model == null ? const Center(child: Text("Flight not found"))
          : _model!.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
        child: Container(
          child: ListView.builder(
              itemCount: _model?.length,
              itemBuilder: (context, index) {
                final alreadySaved = widget.saved.contains(_model![index]);
                return Card(
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              child: Text(
                                  "Flight Number: " +
                                      _model![index].flightNumber,
                                  style: TextStyle(fontSize: 16)),
                              height: 20,
                              width: 200,
                            ),
                            SizedBox(width: 20),
                            SizedBox(
                                child: DecoratedBox(
                                    decoration: BoxDecoration(
                                        color: Colors.blue),
                                    child: Text(
                                        _model![index].originCity,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white))),
                                height: 20,
                                width: 330),
                            SizedBox(
                              height: 20,
                              width: 80,
                              child: Icon(Icons.arrow_forward_rounded,
                                  size: 16, color: Colors.black),
                            ),
                            SizedBox(
                              child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: Colors.blue),
                                  child: Text(
                                      _model![index].destinationCity,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white))),
                              height: 20,
                              width: 330,
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
                                    _model![index].flightStatus,
                                style: TextStyle(fontSize: 16)),
                            height: 20,
                            width: 200,
                          ),
                          SizedBox(width: 20),
                          SizedBox(
                            child: Text("Scheduled Departure",
                                style: TextStyle(fontSize: 16)),
                            height: 20,
                            width: 170,
                          ),
                          SizedBox(
                            width: 20,
                            height: 20,
                          ),
                          SizedBox(
                            child: Text(
                                "Terminal", style: TextStyle(fontSize: 16)),
                            height: 20,
                            width: 80,
                          ), SizedBox(
                            width: 20,
                            height: 20,
                          ),
                          SizedBox(
                            child: Text(
                                "Gate", style: TextStyle(fontSize: 16)),
                            height: 20,
                            width: 80,
                          ),
                          SizedBox(
                            width: 40,
                            height: 20,
                          ),
                          SizedBox(
                              child: Text("Scheduled Arrival",
                                  style: TextStyle(fontSize: 16)),
                              height: 20,
                              width: 170),
                          SizedBox(
                            width: 20,
                            height: 20,
                          ),
                          SizedBox(
                            child: Text(
                                "Terminal", style: TextStyle(fontSize: 16)),
                            height: 20,
                            width: 170,
                          ),
                          IconButton(icon: alreadySaved ? Icon(Icons.favorite) : Icon(Icons.favorite_border), color: alreadySaved ? Colors.red : null, tooltip: alreadySaved ? "Remove from saved" : "Save",
                          onPressed: () {
                            setState(() {
                              if (alreadySaved) {
                                widget.saved.remove(_model![index]);
                              } else {
                                widget.saved.add(_model![index]);
                              }
                            });
                          }
                          )
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
                                _model![index].scheduledDeparture,
                                style: TextStyle(fontSize: 16)),
                            width: 170,
                            height: 20,
                          ),
                          SizedBox(
                            width: 20,
                            height: 20,
                          ),
                          SizedBox(
                            child: Text(_model![index].originAirportTerminal
                                .toString(),
                                style: TextStyle(fontSize: 16)),
                            width: 80,
                            height: 20,
                          ),
                          SizedBox(
                            width: 20,
                            height: 20,
                          ),
                          SizedBox(
                            child: Text(_model![index].originAirportGate,
                                style: TextStyle(fontSize: 16)),
                            width: 80,
                            height: 20,
                          ),
                          SizedBox(
                            width: 40,
                            height: 20,
                          ),
                          SizedBox(
                            child: Text(
                                _model![index].scheduledArrival,
                                style: TextStyle(fontSize: 16)),
                            height: 20,
                            width: 170,
                          ),
                          SizedBox(
                            width: 20,
                            height: 20,
                          ),
                          SizedBox(
                            child: Text(
                                _model![index].destinationAirportTerminal
                                    .toString(),
                                style: TextStyle(fontSize: 16)),
                            width: 80,
                            height: 20,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                );
              }
          ),
        ),
      ),
    );
  }
  void _pushSavedFlight() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                SavedPage(saved: widget.saved)));
  }
}
//