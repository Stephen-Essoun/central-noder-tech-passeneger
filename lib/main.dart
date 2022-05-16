// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:last_cc/pages/flashscreen.dart';
import 'pages/OnbBoardingScreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Splashscreen(),
    // themeMode: ThemeMode.light,

    theme: ThemeData(
        primaryColor: Colors.blue,
        secondaryHeaderColor: Colors.yellow,
        errorColor: Colors.red),
  ));
}
