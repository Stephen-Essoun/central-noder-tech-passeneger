// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:last_cc/pages/Splashscreen.dart';
import 'package:last_cc/pages/signin.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
      theme:ThemeData(
        primaryColor: Colors.blue,
        secondaryHeaderColor: Colors.black,
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.white, foregroundColor: Colors.black),
        scaffoldBackgroundColor: Colors.white,
        errorColor: Colors.red),
    );
  }
}

