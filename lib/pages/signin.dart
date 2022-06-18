// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:last_cc/pages/verify.dart';
import 'package:last_cc/service/auth.dart';
import '../widget/buttons.dart';
import '../widget/textbutton.dart';
import '../widget/textformfield.dart';
import 'signUp.dart';

AuthService _authService = AuthService();

// ignore: must_be_immutable
class LogIn extends StatelessWidget {
  LogIn({Key? key}) : super(key: key);
  final formkey = GlobalKey<FormState>();
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            minimum: const EdgeInsets.all(15),
            child: Center(
                child: Form(
              key: formkey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                        child: Text(
                      'Welcome Back',
                      style: Theme.of(context).textTheme.headline4,
                    )),
                    const SizedBox(
                      height: 50,
                    ),
                    Center(
                        child: Text(
                      'Login to your account',
                      style: Theme.of(context).textTheme.headline6,
                    )),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormFieldWidget(
                        textInputType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "No phone number input";
                          } else if (value.length < 10 || value.length > 13) {
                            return 'Please check your input';
                          }
                          return null;
                        },
                        controller: phonenumberController,
                        labelText: 'Phone'),
                    const SizedBox(
                      height: 15,
                    ),
                    Visibility(
                      visible: false,
                      child: TextFormFieldWidget(
                          textInputType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "No password entered";
                            }
                            return null;
                          },
                          controller: passwordController,
                          labelText: 'password'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    elevatedButton(
                        child: const Text('LogIn'),
                        onpressed: (() {
                          if (formkey.currentState!.validate()) {
                            _authService.verifyNumber(phone: phonenumberController.text);
                           
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>  VerifyAccount()));
                          }
                        })),
                    Center(
                      key: key,
                      child: Row(
                        children: [
                          const SizedBox(width: 95),
                          const Text("Don't have an account?"),
                          textButton(
                              onPressed: () => Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignUp()),
                                  (route) => false),
                              child: 'SignUp')
                        ],
                      ),
                    )
                  ]),
            ))));
  }
}
