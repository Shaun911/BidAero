import 'package:date_time_picker/date_time_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/pages/homePage.dart';
import 'package:untitled2/firebase_options.dart';
import 'package:untitled2/pages/searchPage.dart';
import 'package:untitled2/src/widgets.dart';
import 'package:untitled2/src/authentication.dart';
import 'package:untitled2/api_service.dart';
import 'package:intl/intl.dart';
import 'package:untitled2/models/flight.dart';

/*class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            const Text('WELCOME',
                style: TextStyle(color: Colors.white, fontSize: 20)),
            SizedBox(width: 15),
            Icon(IconData(0xf02d6, fontFamily: 'MaterialIcons'), size: 20, color: Colors.white)
          ]))),
      body: SafeArea(
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Text("how are you"), Text("fuck off"),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "a");
                    },
                    child: Text("Next"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

*/
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

  @override
  void initState() {
    departureDateController.text = "";
    arrivalDateController.text = "";
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
              ]))),
      body: SafeArea(
        child: Center(
          child: Container(
            child: Column(
              children: [
                const Header('Search Flights'),
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
                                  firstDate: DateTime.now()
                                      .subtract(Duration(days: 3)),
                                  lastDate:
                                      DateTime.now().add(Duration(days: 3)),
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
                                  lastDate: date.add(Duration(days: 1)),
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
                          child: TextFormField(
                            controller: originAirportController,
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
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: TextFormField(
                            controller: destinationAirportController,
                            decoration: const InputDecoration(
                              icon:
                                  Icon(Icons.flight_land_rounded, color: Colors.black),
                              labelText: "Destination Aiport",
                              hintText: 'Enter your destination airport code ',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Destination airport not valid';
                              }
                              return null;
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
                                          content: Text('Searching for flights')),
                                    );
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SearchPage(
                                                departureDate:
                                                    departureDateController
                                                        .text,
                                                originAirport:
                                                    originAirportController
                                                        .text,
                                                destinationAirport:
                                                    destinationAirportController
                                                        .text,
                                                arrivalDate:
                                                    arrivalDateController
                                                        .text)));
                                  }
                                },
                                child: const Text('NEXT', style: TextStyle(color: Colors.white)),
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
}
