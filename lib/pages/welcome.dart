// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:last_cc/controller/location_controller.dart';

import '../widget/buttons.dart';
import 'signUp.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({ Key? key }) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<WelcomePage> {

  GetUserGeoLocationController _geoLocationController=GetUserGeoLocationController();
  @override
  void initState() {
  _geoLocationController.determinePosition();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
              children:  [
                Center(child: Text('WELCOME',style: Theme.of(context).textTheme.headline1,)),
                const SizedBox(height: 5,),
                Center(child: Text('CODA Drive',style: Theme.of(context).textTheme.headline2)),
                const SizedBox(height: 5,),
                Container(height: MediaQuery.of(context).size.height/2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(image: AssetImage('images/cab.jpeg'),fit: BoxFit.cover))),
                SizedBox(height: 50,),
                elevatedButton(
                  onpressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp())),
                child: const Text('Get Started'))
              ],
            ),
        ),
      ),
    );
  }
}