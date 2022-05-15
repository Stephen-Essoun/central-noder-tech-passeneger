// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widget/buttons.dart';
import '../widget/textbutton.dart';
import '../widget/textformfield.dart';
import 'logIn.dart';
import 'verify.dart';

// ignore: must_be_immutable
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController firstnameController = TextEditingController();
  TextEditingController secondnameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
          children: [
            Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 60),
                  Center(
                      child: Text(
                    "Welcome,let's get started",
                    style: Theme.of(context).textTheme.headline4,
                  )),
                  SizedBox(height: 20),
                  TextFormFieldWidget(
                      controller: firstnameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'First name is required';
                        }
                        return null;
                      },
                      labelText: 'First name'),
                  SizedBox(
                    height: 20,
                  ),
                   TextFormFieldWidget(
                      controller: secondnameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter sencond name';
                        }
                        return null;
                      },
                      labelText: 'Second Name'),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormFieldWidget(
                      controller: emailController,
                      validator: (value) {
                        if (!value!.contains('@')) {
                          return 'Retype your email';
                        }
                        return null;
                      },
                      labelText: 'Email address'),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormFieldWidget(
                      controller: phoneController,
                      validator: (value) {
                        if (value!.isEmpty || value.length < 10) {
                          return 'Please check your input';
                        }
                        return null;
                      },
                      labelText: 'Phone'),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormFieldWidget(
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.length < 4) {
                          return 'please input a stronge password';
                        }
                        return null;
                      },
                      labelText: 'Password'),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormFieldWidget(
                      controller: confirmController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Comfirm your password';
                        } else if (value != passwordController.text) {
                          return 'password do not match';
                        }
                        return null;
                      },
                      labelText: 'Confirm password'),
                  SizedBox(
                    height: 10,
                  ),
                  elevatedButton(
                      onpressed: () async {
                        final prefs = await SharedPreferences.getInstance();
                        if (_formkey.currentState!.validate()) {
                          prefs.setString('Name', firstnameController.text);
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Enjoy your ride')));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VerifyAccount()));
                        }
                      },
                      child: Text('SignUp')),
                  Center(
                    child: Row(
                      children: [
                        SizedBox(width: 95),
                        const Text('Already have an account?'),
                        textButton(
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LogIn())),
                            child: 'logIn')
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
