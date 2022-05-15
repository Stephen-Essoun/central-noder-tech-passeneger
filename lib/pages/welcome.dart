// ignore_for_file: prefer_const_constructors

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:last_cc/controller/location_controller.dart';
import 'package:last_cc/widget/textbutton.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widget/buttons.dart';
import 'signUp.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<WelcomePage> {
  final controller = PageController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          children: [
            Container(
              color: Colors.red,
              child: Center(child: Text('Hello Ghana')),
            ),
            Container(
              color: Colors.yellow,
              child: Center(child: Text('Hello Africa')),
            ),
            Container(
              color: Colors.green,
              child: Center(child: Text('Hello World')),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            textButton(
                onPressed: () => controller.jumpToPage(2), child: 'SKIP'),
            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 4,effect: WormEffect(radius: 20,activeDotColor: Colors.amber,paintStyle: PaintingStyle.stroke),
              ),
            ),
            textButton(
                onPressed: () => controller.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn),
                child: 'NEXT')
          ],
        ),
      ),

      //   body: SafeArea(
      //     child: Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 15),
      //       child: Column(mainAxisAlignment: MainAxisAlignment.center,
      //       crossAxisAlignment: CrossAxisAlignment.stretch,
      //           children:  [
      //             Center(child: Text('WELCOME',style: Theme.of(context).textTheme.headline1,)),
      //             const SizedBox(height: 5,),
      //             Center(child: Text('CODA Drive',style: Theme.of(context).textTheme.headline2)),
      //             const SizedBox(height: 10,),
      //             Container(height: MediaQuery.of(context).size.height/3,
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(15),
      //               image: DecorationImage(image: AssetImage('images/cab.jpeg'),fit: BoxFit.cover))),
      //             SizedBox(height: 50,),
      //             elevatedButton(
      //               onpressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp())),
      //             child: const Text('Get Started'))
      //           ],
      //         ),
      //     ),
      //   ),
      // );
    );
  }
}
