// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../widget/buttons.dart';
import '../widget/textformfield.dart';
import 'home_page.dart';

class VerifyAccount extends StatelessWidget {
  const VerifyAccount({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(minimum: EdgeInsets.all(15),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(child: const Text('Enter code recieved')),
            SizedBox(height: 5,),
            TextFormFieldWidget(labelText: ''),
            SizedBox(height: 10,),
            elevatedButton(onpressed: 
            ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const Home())),child: const Text('Verify'))
          ],
        ),
      ),
    );
  }
}