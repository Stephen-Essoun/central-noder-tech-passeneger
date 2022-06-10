// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:last_cc/pages/flashscreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Splashscreen(),
    // themeMode: ThemeMode.light,

    theme: ThemeData(
        primaryColor: Colors.blue,
        secondaryHeaderColor: Colors.black,
        appBarTheme: AppBarTheme(backgroundColor: Colors.white,foregroundColor: Colors.black),
        scaffoldBackgroundColor: Colors.white,
        errorColor: Colors.red),
  ));
}
