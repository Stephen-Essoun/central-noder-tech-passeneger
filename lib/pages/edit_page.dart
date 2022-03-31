import 'package:flutter/material.dart';
import 'package:last_cc/widget/textformfield.dart';

class Editprofilepage extends StatefulWidget {
  const Editprofilepage({ Key? key }) : super(key: key);

  @override
  State<Editprofilepage> createState() => _EditprofilepageState();
}

class _EditprofilepageState extends State<Editprofilepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,title:const Text('Edit your details',style: TextStyle(color: Colors.black),),
        actions:[IconButton(onPressed: (){}, icon:const Icon(Icons.done),focusColor:Colors.amberAccent,)]
      ),

      body: ListView(children: [
        TextFormFieldWidget(),
        const SizedBox(height: 10,),
        TextFormFieldWidget(),
        const SizedBox(height: 10,),
        TextFormFieldWidget(),
        const SizedBox(height: 10,),
        TextFormFieldWidget(),
      ],),
    );
  }
}