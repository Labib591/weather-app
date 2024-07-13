import 'package:flutter/material.dart';
import 'package:weather_app/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        canvasColor: Colors.white70,
        textTheme: GoogleFonts.adventProTextTheme(),
      ),
    );
  }

}