import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/pages/homePage.dart';

import '../models/mockend.dart';

class SavedPage extends StatefulWidget {
  final List<Mockend> saved;
  const SavedPage({Key? key, required this.saved}) : super(key: key);

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                const Text('SAVED FLIGHTS',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                SizedBox(width: 15),
                Icon(Icons.save_alt_rounded,
                    size: 20, color: Colors.white)
              ])),
        ),
        body: SafeArea(
        child: Container(
        child: ListView.builder(
          itemCount: widget.saved.length,
            itemBuilder: (BuildContext context, index) {
            return Dismissible(key: UniqueKey(), direction: DismissDirection.endToStart,
onDismissed: (_) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
        content:
        Text('Deleted')),
  );
              setState((){
                widget.saved.removeAt(index);
    });
    },
    child:  Card(
              child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              child: Text("Flight Number: " + widget.saved[index].flightNumber,
                                  style: TextStyle(fontSize: 16)),
                              height: 20,
                              width: 200,
                            ),
                            SizedBox(width: 20),
                            SizedBox(
                                child: DecoratedBox(
                                    decoration:
                                        BoxDecoration(color: Colors.blue),
                                    child: Text(widget.saved[index].originCity,
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
                                  decoration: BoxDecoration(color: Colors.blue),
                                  child: Text(widget.saved[index].destinationCity,
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
                            child: Text("Flight Status: " +widget.saved[index].flightStatus,
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
                            child: Text("Terminal",
                                style: TextStyle(fontSize: 16)),
                            height: 20,
                            width: 80,
                          ),
                          SizedBox(
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
                            child: Text("Terminal",
                                style: TextStyle(fontSize: 16)),
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
                            child: Text(widget.saved[index].scheduledDeparture,
                                style: TextStyle(fontSize: 16)),
                            width: 170,
                            height: 20,
                          ),
                          SizedBox(
                            width: 20,
                            height: 20,
                          ),
                          SizedBox(
                            child: Text(widget.saved[index].originAirportTerminal.toString(),
                                style: TextStyle(fontSize: 16)),
                            width: 80,
                            height: 20,
                          ),
                          SizedBox(
                            width: 20,
                            height: 20,
                          ),
                          SizedBox(
                            child: Text(widget.saved[index].originAirportGate,
                                style: TextStyle(fontSize: 16)),
                            width: 80,
                            height: 20,
                          ),
                          SizedBox(
                            width: 40,
                            height: 20,
                          ),
                          SizedBox(
                            child: Text(widget.saved[index].scheduledArrival,
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
                                widget.saved[index].destinationAirportTerminal.toString(),
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
                  )),

                  background: Container(
                  color: Colors.red,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              alignment: Alignment.centerRight,
              child: const Icon(
              Icons.delete,
              color: Colors.white,
              )
                  )
            );
                })))
    );
  }
}
