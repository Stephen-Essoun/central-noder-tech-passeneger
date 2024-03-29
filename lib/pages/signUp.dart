// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:last_cc/service/auth.dart';
import 'package:last_cc/service/database.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widget/buttons.dart';
import '../widget/textbutton.dart';
import '../widget/textformfield.dart';
import 'signin.dart';
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

  TextEditingController surnameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmController = TextEditingController();

  DbService dbService = DbService();

  AuthService authService = AuthService();

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
                    "Welcome",
                    style: Theme.of(context).textTheme.headline6,
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
                      controller: surnameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter second name';
                        }
                        return null;
                      },
                      labelText: 'Surname'),
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
                          dbService.updateUser(
                              firstname: firstnameController.text,
                              surname: surnameController.text,
                              email: emailController.text,
                              phoneNumber: phoneController.text);
                              authService.verifyNumber(phone: phoneController.text);

                          prefs.setString(
                            'firstname',
                            firstnameController.text,
                          );
                          prefs.setString('surname', surnameController.text);
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
