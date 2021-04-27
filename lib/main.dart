import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portal_poc_dashboard/constants.dart';
import 'package:portal_poc_dashboard/screens/dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portal POC (Dashboard)',
      theme: ThemeData(
        //dividerColor: Colors.transparent,
        primarySwatch: Colors.amber,
        textTheme: TextTheme(
          bodyText1: TextStyle(
              fontFamily: GoogleFonts.montserrat(fontWeight: FontWeight.w300)
                  .fontFamily,
              color: kBgDarkColor),
          bodyText2: TextStyle(
              fontFamily: GoogleFonts.montserrat(fontWeight: FontWeight.w300)
                  .fontFamily,
              color: kBgDarkColor),
        ),
      ),
      home: Dashboard(),
    );
  }
}
