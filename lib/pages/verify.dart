// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:last_cc/service/auth.dart';
import '../widget/buttons.dart';
import '../widget/textformfield.dart';
import 'home_page.dart';

AuthService _authService = AuthService();

class VerifyAccount extends StatelessWidget {
  VerifyAccount({Key? key}) : super(key: key);
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(child: const Text('Enter code recieved')),
            SizedBox(
              height: 5,
            ),
            TextFormFieldWidget(labelText: ''),
            SizedBox(
              height: 10,
            ),
            elevatedButton(onpressed: () async {
             _authService.verifyOtpCode(smscode: otpController.text);
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                  (route) => false);
            }, child:
              const Text('Verify'))
          ],
        ),
      ),
    );
  }
}
