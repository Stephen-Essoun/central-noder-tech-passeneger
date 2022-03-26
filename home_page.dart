// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:last_cc/pages/User.dart';
import 'package:last_cc/pages/map.dart';

import '../controller/location_controller.dart';
import 'drawer.dart';

class Home extends StatefulWidget {
  
   const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

@override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         centerTitle: true,
        title: Container(
          child:Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:const  [
              Text('Online'),
              Icon(Icons.local_taxi_rounded)
            ],
          ),
          height: 30,width: 150,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).primaryColor),
    
        ),
        
         
        actions: [IconButton(onPressed: (){},
         icon:const Icon(Icons.notifications))],
      ),

       drawer: Padding(
         padding: const EdgeInsets.all(8.0),
         child: SafeArea(child: drawer(context: context)),
       ),
        body:MyHomePager()
         );
  }
}   

