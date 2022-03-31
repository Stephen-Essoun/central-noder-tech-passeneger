// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../widget/buttons.dart';
import '../widget/textbutton.dart';
import '../widget/textformfield.dart';
import 'logIn.dart';
import 'verify.dart';

// ignore: must_be_immutable
class SignUp extends StatelessWidget {
  SignUp({ Key? key }) : super(key: key);
final _formkey = GlobalKey<FormState>();
TextEditingController nameController=TextEditingController();
TextEditingController emailController=TextEditingController();
TextEditingController phoneController=TextEditingController();
TextEditingController passwordController=TextEditingController();
TextEditingController confirmController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        key: key,
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 25,horizontal: 15),
          children:  
            [Form(
              key: _formkey,
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                 SizedBox(height: 60),
                Center(child: Text("Welcome,let's get started",style:Theme.of(context).textTheme.headline4,)),
                 SizedBox(height: 20),
                 TextFormFieldWidget(
                 controller: nameController,
                 validator: (value){
                     if(value!.isEmpty) {
                       return 'Input full name';
                     }return null;
                 },
                 labelText: 'Full name'),
      
                 SizedBox(height: 20,),
                 TextFormFieldWidget(
                   controller:emailController,
                   validator: (value){
                     if(!value!.contains('@')) {
                       return 'Retype your email';
                     }return null;
                   },
                   labelText: 'Email address'),
      
                 SizedBox(height: 20,),
                 TextFormFieldWidget(
                 controller: phoneController,
                  validator:(value){
                    if(value!.isEmpty || value.length<10){
                      return 'Please check your input';
                    }
                    return null;
                  },labelText: 'Phone'),
      
                 SizedBox(height: 20,),
                 TextFormFieldWidget(
                   controller: passwordController,
                   validator: (value){
                     if(value == null || value.length<4){
                       return 'please input a stronge password';
                     }return null;
                   },
                   labelText: 'Password'),
      
                 SizedBox(height: 20,),
                 TextFormFieldWidget(
                   controller: confirmController,
                   validator: (value){
                     if(value!.isEmpty){
                       return 'Comfirm password';
                     }else if(!value.contains('$passwordController.text')){
                       return 'password do not match';
                     }
                     return null;
                       },
                   labelText: 'Confirm password'),
      
                 SizedBox(height: 10,),
                 elevatedButton(onpressed: (){
                   if(_formkey.currentState!.validate()){
                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Enjoy your ride')));
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>VerifyAccount()));
                   }
                 },
                 child: Text('SignUp')),
                  
                Center(key: key,
                  child: Row(
                    children: [
                      SizedBox(width: 95),
                    const Text('Already have an account?'),
                    textButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>LogIn())), child:const Text('logIn'))
                  ],),
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