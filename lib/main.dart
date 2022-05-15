// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:last_cc/pages/flashscreen.dart';
import 'pages/welcome.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:Splashscreen(),
    // themeMode: ThemeMode.light,

    theme: ThemeData(
      primaryColor: const Color(0xff3d6dfe),
      secondaryHeaderColor: Color.fromARGB(255, 7, 0, 0),
      scaffoldBackgroundColor: const Color(0xfff7f8fa),
      errorColor: Color.fromARGB(255, 255, 0, 0),
      appBarTheme: const AppBarTheme(
          color: Color(0xfff7f8fa),
          elevation: 5,
          actionsIconTheme: IconThemeData(color: Color.fromARGB(255, 0, 0, 0))),
      textTheme: TextTheme(
        headline1: const TextStyle(fontFamily: 'AverialAa', fontSize: 30),
        headline2: const TextStyle(fontFamily: 'AverialAa', fontSize: 20),
        headline3: const TextStyle(fontFamily: 'AverialAa', fontSize: 10),
        headline4: const TextStyle(
            fontFamily: 'Oxygen', fontSize: 25, fontWeight: FontWeight.bold),
      ),
    ),
  ));
}
