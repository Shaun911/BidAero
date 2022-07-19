import 'package:date_time_picker/date_time_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/models/airport.dart';
import 'package:untitled2/pages/homePage.dart';
import 'package:untitled2/firebase_options.dart';
import 'package:untitled2/pages/savedPage.dart';
import 'package:untitled2/pages/searchPage.dart';
import 'package:untitled2/src/widgets.dart';
import 'package:untitled2/src/authentication.dart';
import 'package:untitled2/api_service.dart';
import 'package:intl/intl.dart';
import 'package:untitled2/models/airport.dart';

import '../models/mockend.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DateTime date;
  final departureDateController = TextEditingController();
  final originAirportController = TextEditingController();
  final destinationAirportController = TextEditingController();
  final arrivalDateController = TextEditingController();
  final _formKey = GlobalKey<FormState>(debugLabel: '_HomePageState');
  final _saved = <Mockend>[];

  @override
  void initState() {
    departureDateController.text = "";
    //arrivalDateController.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              const Text('WELCOME',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              SizedBox(width: 15),
              Icon(IconData(0xf02d6, fontFamily: 'MaterialIcons'),
                  size: 20, color: Colors.white)
            ])),
        actions: [
          IconButton(icon: Icon(Icons.list), iconSize: 20, color: Colors.white, onPressed: _pushSavedFlight)
        ],),
      body: SafeArea(
        child: Center(
          child: Container(
            child: Column(
              children: [
                const Header('Search For Flights'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: TextFormField(
                            controller: departureDateController,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.calendar_today,
                                  color: Colors.black),
                              labelText: "Departure Date",
                              hintText: 'Enter your departure date',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Departure Date is not selected";
                              }
                              return null;
                            },
                            readOnly: true,
                            onTap: () async {
                              DateTime? departureDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(DateTime
                                      .now()
                                      .year, DateTime
                                      .now()
                                      .month, 1),
                                  lastDate:
                                  DateTime(DateTime
                                      .now()
                                      .year, DateTime
                                      .now()
                                      .month + 1, 0),
                                  builder: (context, child) {
                                    return Theme(
                                      data: Theme.of(context).copyWith(
                                          colorScheme: ColorScheme.light(
                                              primary: Colors.lightBlue,
                                              onPrimary: Colors.white)),
                                      child: child!,
                                    );
                                  });

                              if (departureDate != null) {
                                date = departureDate;
                                String formattedDate = DateFormat('yyyy-MM-dd')
                                    .format(departureDate);
                                print(formattedDate);
                                setState(() {
                                  departureDateController.text =
                                      formattedDate; //set output date to TextField value.
                                });
                              } else {
                                print('Date is not selected');
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: TextFormField(
                            controller: arrivalDateController,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.calendar_today,
                                  color: Colors.black),
                              labelText: "Arrival Date (Optional)",
                              hintText: 'Enter your arrival date',
                            ),
                            readOnly: true,
                            onTap: () async {
                              DateTime? arrivalDate = await showDatePicker(
                                  context: context,
                                  initialDate: date,
                                  firstDate: date,
                                  lastDate: DateTime(
                                      date.year, date.month + 1, 0),
                                  builder: (context, child) {
                                    return Theme(
                                      data: Theme.of(context).copyWith(
                                          colorScheme: ColorScheme.light(
                                              primary: Colors.lightBlue,
                                              onPrimary: Colors.white)),
                                      child: child!,
                                    );
                                  });
                              if (arrivalDate != null) {
                                String formattedDate = DateFormat('yyyy-MM-dd')
                                    .format(arrivalDate);
                                print(formattedDate);
                                setState(() {
                                  arrivalDateController.text =
                                      formattedDate; //set output date to TextField value.
                                });
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Autocomplete<Airport>(
                            optionsBuilder: (TextEditingValue value) {
                              return airports
                                  .where((airport) =>
                                  airport.city
                                      .toLowerCase()
                                      .startsWith(value.text.toLowerCase()))
                                  .toList();
                            },
                            displayStringForOption: (airport) =>
                            airport.city + ", " + airport.airportCode,
                            fieldViewBuilder: (BuildContext context,
                                TextEditingController ctrl,
                                FocusNode focus,
                                VoidCallback onField) {
                              return TextFormField(
                                controller: ctrl,
                                focusNode: focus,
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.flight_takeoff_rounded,
                                      color: Colors.black),
                                  labelText: 'Origin Airport',
                                  hintText: 'Enter your origin airport code',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Origin airport not valid';
                                  }
                                  return null;
                                },
                              );
                            },
                            onSelected: (airport) {
                              originAirportController.text = airport.city;
                            },
                            optionsViewBuilder: (BuildContext context,
                                AutocompleteOnSelected<Airport> onSelected,
                                Iterable<Airport> options) {
                              return Align(
                                alignment: Alignment.topLeft,
                                child: Material(
                                  child: Container(
                                    width: 450,
                                    color: Colors.lightBlue,
                                    child: ListView.builder(
                                      padding: EdgeInsets.all(10),
                                      itemCount: options.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        final Airport option =
                                        options.elementAt(index);
                                        return GestureDetector(
                                          onTap: () {
                                            onSelected(option);
                                          },
                                          child: ListTile(
                                            title:
                                            Row(
                                              children: [
                                                Text(
                                                    option.city +
                                                        ", " +
                                                        option.country,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18)),
                                                SizedBox(width: 15),
                                                option.flags,
                                              ],
                                            ),
                                            subtitle: Text(
                                                option.name +
                                                    ", " +
                                                    option.airportCode,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15)),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Autocomplete<Airport>(
                            optionsBuilder: (TextEditingValue value) {
                              return airports
                                  .where((airport) =>
                                  airport.city
                                      .toLowerCase()
                                      .startsWith(value.text.toLowerCase()))
                                  .toList();
                            },
                            displayStringForOption: (airport) =>
                            airport.city + ", " + airport.airportCode,
                            fieldViewBuilder: (BuildContext context,
                                TextEditingController ctrl,
                                FocusNode focus,
                                VoidCallback onField) {
                              return TextFormField(
                                controller: ctrl,
                                focusNode: focus,
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.flight_land_rounded,
                                      color: Colors.black),
                                  labelText: 'Destination Airport',
                                  hintText: 'Enter your destination airport code',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Destination airport not valid';
                                  }
                                  return null;
                                },
                              );
                            },
                            onSelected: (airport) {
                              destinationAirportController.text = airport.city;
                            },
                            optionsViewBuilder: (BuildContext context,
                                AutocompleteOnSelected<Airport> onSelected,
                                Iterable<Airport> options) {
                              return Align(
                                alignment: Alignment.topLeft,
                                child: Material(
                                  child: Container(
                                    width: 450,
                                    color: Colors.lightBlue,
                                    child: ListView.builder(
                                      padding: EdgeInsets.all(10),
                                      itemCount: options.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        final Airport option =
                                        options.elementAt(index);
                                        return GestureDetector(
                                          onTap: () {
                                            onSelected(option);
                                          },
                                          child: ListTile(
                                            title:
                                            Row(
                                              children: [
                                                Text(
                                                    option.city +
                                                        ", " +
                                                        option.country,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18)),
                                                SizedBox(width: 15),
                                                option.flags,
                                              ],
                                            ),
                                            subtitle: Text(
                                                option.name +
                                                    ", " +
                                                    option.airportCode,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15)),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const SizedBox(width: 16),
                              ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content:
                                          Text('Searching for flights')),
                                    );
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SearchPage(
                                                    departureDate:
                                                    departureDateController
                                                        .text,
                                                    originAirport:
                                                    originAirportController
                                                        .text,
                                                    destinationAirport:
                                                    destinationAirportController
                                                        .text,
                                                    saved: _saved,
                                                    arrivalDate: arrivalDateController
                                                        .text)));
                                  }
                                },
                                child: const Text('NEXT',
                                    style: TextStyle(color: Colors.white)),
                              ),
                              const SizedBox(width: 30),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
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
                  SavedPage(saved: _saved)));
    }

    }


