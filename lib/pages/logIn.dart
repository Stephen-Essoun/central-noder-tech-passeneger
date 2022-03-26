
import 'package:flutter/material.dart';
import 'package:last_cc/pages/home_page.dart';

import '../widget/buttons.dart';
import '../widget/textbutton.dart';
import '../widget/textformfield.dart';
import 'map.dart';
import 'signUp.dart';

class LogIn extends StatelessWidget {
   LogIn({ Key? key }) : super(key: key);
final formkey=GlobalKey<FormState>();
TextEditingController phoneController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(minimum: const EdgeInsets.all(15),
        child: Center(
        child:
         Form(
           key: formkey,
           child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [ 
            Center(child: Text('Welcome Back',style: Theme.of(context).textTheme.headline4,)),
            const SizedBox(height: 50,),
            const Center(child: Text('Login to your account')),
            const SizedBox(height: 10,),
           TextFormFieldWidget(
             validator: (value){
               if(value!.isEmpty){
                 return "Check your phone number";
               }return null;
             },
             controller: phoneController,
             labelText: 'Phone'),
            elevatedButton(child:const Text('LogIn'),onpressed: ((){
              if(formkey.currentState!.validate()){
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('processing')));
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const Home()));
              }
            Row(children: [
              const Text('Already have an account?'),
              textButton(
                onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUp())), child: const Text('SignUp'))
            ],);
            })
         ),
            ]),
    ))));
  }
}