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

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            const Text('ERROR',
                style: TextStyle(color: Colors.white, fontSize: 20)),
            SizedBox(width: 15),
            Icon(IconData(0xf712, fontFamily: 'MaterialIcons'), size: 20, color: Colors.white)
          ]))),
        body: SafeArea(
        child: Center(
        child: Container(
        child: Text("Flight not found", style: TextStyle(fontSize: 20)),

      ),
    ),
    ),
    );
  }
}

