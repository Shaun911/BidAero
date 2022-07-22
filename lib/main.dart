import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/pages/errorPage.dart';
import 'package:untitled2/pages/homePage.dart';
import 'package:untitled2/pages/savedPage.dart';
import 'package:untitled2/pages/welcomePage.dart';
import 'firebase_options.dart';
import 'package:untitled2/pages/searchPage.dart';
import 'src/authentication.dart';
import 'src/widgets.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ApplicationState(),
      builder: (context, _) => const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BIDAERO',
      theme: ThemeData(
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
          highlightColor: Colors.lightBlue,
        ),
        primarySwatch: Colors.lightBlue,
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: 'welcomePage',
      routes: {
        "welcomePage": (context) => WelcomePage(),
        "homePage": (context) => HomePage(),
        "errorPage": (context) => ErrorPage(),
      },
    );
  }
}
