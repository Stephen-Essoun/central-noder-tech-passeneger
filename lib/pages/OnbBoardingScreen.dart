// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:last_cc/pages/signin.dart';
import 'package:last_cc/widget/textbutton.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<WelcomePage> {
  final controller = PageController();
  bool isLastPage = false;
  int? pages;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget buildPage(
          {required Color color,
          required String title,
          required String subtitle,
          required String assetImage}) =>
      Container(
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              assetImage,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title.toUpperCase(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(fontSize: 20, color: Colors.yellow),
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.only(bottom: 80),
          child: PageView(
            onPageChanged: (index) {
              setState(() {
                isLastPage = index == 2;
                pages = index;
              });
            },
            controller: controller,
            children: [
              buildPage(
                color: Colors.pink.shade300,
                assetImage: 'images/aby1.png',
                title: 'Aboboyaa',
                subtitle:
                    '   You have the access\n to order for ABOBOYAA\n   to pick up your goods',
              ),
              buildPage(
                color: Colors.pink.shade300,
                assetImage: 'images/pra1.jpg',
                title: 'Pragya',
                subtitle: 'Do you want to explore with low cost?\n              Just book for Pragyea.',
              ),
              buildPage(
                color: Colors.pink.shade300,
                assetImage: 'images/cd1.png',
                title: 'CODA cab',
                subtitle: 'Welcome',
              ),
            ],
          ),
        ),
        bottomSheet: isLastPage
            ? SizedBox(
              height: 80,width:900,
                child: Center(child: textButton(onPressed: (){
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LogIn()), (route) => false);
                }, child: 'Get Started',style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue)) 
                )))
              
            : Container(
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
                        count: 3,
                        effect: WormEffect(
                            radius: 20,
                            activeDotColor: Colors.amber,
                            paintStyle: PaintingStyle.stroke),
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
      ),
    );
  }
}
