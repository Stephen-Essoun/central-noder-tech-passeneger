
import 'package:flutter/material.dart';
import 'package:last_cc/pages/home_page.dart';

import '../widget/buttons.dart';
import '../widget/textbutton.dart';
import '../widget/textformfield.dart';
import 'map.dart';
import 'signUp.dart';

// ignore: must_be_immutable
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
             textInputType: TextInputType.number,
             validator: (value){
               if(value!.isEmpty){
                 return "Check your phone number";
               }else if(value.length<10 || value.length>12 ){
                 return 'Please check your input';
               }
               return null;
             },
             controller: phoneController,
             labelText: 'Phone'),
             const SizedBox(height: 10,),
            elevatedButton(child:const Text('LogIn'),onpressed: ((){
              if(formkey.currentState!.validate()){
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('processing')));
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const Home()));
              }
            })
         ),
         Center(key: key,
                  child: Row(
                    children: [
                     const SizedBox(width: 95),
                    const Text('Already have an account?'),
                    textButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp())), child:const Text('SignUp'))
                  ],),
                )
            ]),
    ))));
  }
}