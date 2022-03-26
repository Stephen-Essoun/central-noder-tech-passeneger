import 'package:flutter/material.dart';
import 'package:last_cc/widget/buttons.dart';
import 'package:last_cc/widget/textformfield.dart';
class PersonDetail extends StatefulWidget {
  const PersonDetail({ Key? key }) : super(key: key);

  @override
  State<PersonDetail> createState() => _PersonDetailState();
}

class _PersonDetailState extends State<PersonDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 00,
      iconTheme: const IconThemeData(color: Color.fromARGB(0, 255, 255, 255)) ,
      centerTitle: true,
      title:const Text("Profile",style: TextStyle(color: Colors.black)),
      actions: [TextButton(onPressed: (){}, 
      child:const Text("Edit"))],),

      body: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment:CrossAxisAlignment.stretch,
        children: [
         const  SizedBox(height: 10),
        const Center(child: CircleAvatar(radius: 50,
        child: CircleAvatar(radius: 48,backgroundColor: Colors.yellow,),)),
        const SizedBox(height: 10,),
        Expanded(
          child: Container(height:MediaQuery.of(context).size.height,
            color: Color.fromARGB(255, 255, 255, 255),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children:  [
                const ListTile(leading:Text('Name'),trailing: Padding(
                  padding: EdgeInsets.only(right: 60),
                  child: Text('Erasmus Farron'),
                ),),
                const SizedBox(height:10),
                const Text('Password'),
                const SizedBox(height:10),
                TextFormFieldWidget(labelText: 'Old Password',),
                const SizedBox(height:10),
                TextFormFieldWidget(labelText: 'New Password'),
                const SizedBox(height:10),
                TextFormFieldWidget(labelText: 'Comfirm Password'),
                const SizedBox(height:10),
                elevatedButton(onpressed: (){},child:const Text('Update'))
              ]),
            ),
            )
        )
      ],),
    );
  }
}