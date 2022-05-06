// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:last_cc/controller/location_controller.dart';
import 'drawer.dart';
import 'map.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  LocationHandler locationHandler = LocationHandler();

  @override
  initState() {
    locationHandler.determinePosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [Text('Online'), Icon(Icons.local_taxi_rounded)],
          ),
          height: 30,
          width: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).primaryColor),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_active_outlined))
        ],
      ),
      drawer: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(child: drawer(context: context)),
      ),
      body: MyHomePage(),
      
    );
  }
}