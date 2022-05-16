import 'package:flutter/material.dart';
import 'package:last_cc/pages/OnbBoardingScreen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const WelcomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blueGrey,
      
        body: Center(
      child: Text('C',style: TextStyle(fontSize: 150,fontWeight: FontWeight.bold,fontFamily: 'Noto Sans CJK SC'),),
    ));
  }
}
