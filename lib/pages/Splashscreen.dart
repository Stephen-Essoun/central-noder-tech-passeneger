


import 'package:flutter/material.dart';

import 'OnbBoardingScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(seconds: 10), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) =>const WelcomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 168, 168, 70),
          image: DecorationImage(
              image: AssetImage('images/yenko.png'), fit: BoxFit.none)),
    );
  }
}
