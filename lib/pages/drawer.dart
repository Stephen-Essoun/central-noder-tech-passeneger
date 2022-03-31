import 'package:flutter/material.dart';
import 'package:last_cc/pages/User.dart';
import 'package:last_cc/pages/logIn.dart';

Drawer drawer({context}){
 
  return Drawer(
    elevation: 2,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(crossAxisAlignment:  CrossAxisAlignment.start,
        children:  <Widget> [
          const UserAccountsDrawerHeader(
            currentAccountPicture:CircleAvatar(
              radius: 50,
              backgroundColor: Colors.black,
              ) ,
            accountName: Text('Profile'),
           accountEmail: Text('Profile')),
        gesture(context:context,
        child: Row(children:const [Icon(Icons.person),
        SizedBox(width: 10,),Text('Profile')]),
        page:const PersonDetail()), 
        const SizedBox(height: 10,),
        gesture(context:context,
        child: Row(children:const [Icon(Icons.history),
        SizedBox(width: 10,),Text('History')]),
        page:null),
        const SizedBox(height: 10,),
         gesture(context:context,
        child: Row(children:const [Icon(Icons.money),
        SizedBox(width: 10,),Text('Wallet')]),
        page:null),
        const SizedBox(height: 10,),
         gesture(context:context,
        child: Row(children:const [Icon(Icons.share),
        SizedBox(width: 10,),Text('Invite')]),
        page:null),
        const Divider(height: 20,thickness: 2,indent: 5,endIndent: 5,), gesture(context:context,
        child: Row(children:const [Icon(Icons.logout),
        SizedBox(width: 10,),Text('LogOut')]),
        page:LogIn()),
           
          ],),
    ),
  );
}

GestureDetector gesture({context,page,child}) {
  return GestureDetector(
            onTap: (){Navigator.push(context,
             MaterialPageRoute(builder: ((context) => page)));},
            child: child);
}