import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/pages/homePage.dart';

import '../models/mockend.dart';

class SavedPage extends StatefulWidget {
  final Set<Mockend> saved;
  const SavedPage({Key? key,
  required this.saved}) : super(key: key);

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {

  @override
  Widget build(BuildContext context) {
    final tiles = widget.saved.map(
          (pair) {
            return Card(
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Text(
                              "Flight Number: " +
                                  pair.flightNumber,
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
                                    pair.originCity,
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white))),
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
                                  pair.destinationCity,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white))),
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
                                pair.flightStatus,
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
                        child: Text("Gate", style: TextStyle(fontSize: 16)),
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
                            pair.scheduledDeparture,
                            style: TextStyle(fontSize: 16)),
                        width: 170,
                        height: 20,
                      ),
                      SizedBox(
                        width: 20,
                        height: 20,
                      ),
                      SizedBox(
                        child: Text(pair.originAirportTerminal
                            .toString(), style: TextStyle(fontSize: 16)),
                        width: 80,
                        height: 20,
                      ),
                      SizedBox(
                        width: 20,
                        height: 20,
                      ),
                      SizedBox(
                        child: Text(pair.originAirportGate,
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
                            pair.scheduledArrival,
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
                            pair.destinationAirportTerminal
                                .toString(), style: TextStyle(fontSize: 16)),
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
    );

    final divided = tiles.isNotEmpty
        ? ListTile.divideTiles(
      context: context,
      tiles: tiles,
    ).toList()
        : <Widget>[];

    return Scaffold(
      appBar: AppBar(
        title: Text("Saved Flights"),
      ),
            body: ListView(children: divided),
            );
        }
  }

