import 'package:flutter/material.dart';
import 'package:last_cc/pages/edit_page.dart';
import 'package:last_cc/widget/buttons.dart';
import 'package:last_cc/widget/textformfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonDetail extends StatefulWidget {
  const PersonDetail({Key? key}) : super(key: key);

  @override
  State<PersonDetail> createState() => _PersonDetailState();
}

class _PersonDetailState extends State<PersonDetail> {
   getUserDetails() async {
     String ?firstname;
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      firstname = prefs.getString("Name");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 00,
        iconTheme: const IconThemeData(color: Color.fromARGB(0, 255, 255, 255)),
        centerTitle: true,
        title: const Text("Profile", style: TextStyle(color: Colors.black)),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Editprofilepage()));
              },
              child: const Text("Edit"))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 10),
          const Center(
              child: CircleAvatar(
            radius: 50,
            child: CircleAvatar(
              radius: 48,
              backgroundColor: Colors.yellow,
            ),
          )),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: Container(
            height: MediaQuery.of(context).size.height,
            color: const Color.fromARGB(255, 255, 255, 255),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text('First Name'),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                          ),
                           const Text(''),
                        ],
                      ),
                      Row(
                        children: [
                          const Text('Surname'),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                          ),
                          const Text('UserName'),
                        ],
                      ),
                      Row(
                        children: [
                          const Text('Name'),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                          ),
                          const Text('UserName'),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Text('Password'),
                const SizedBox(height: 10),
                TextFormFieldWidget(
                  labelText: 'Old Password',
                ),
                const SizedBox(height: 10),
                TextFormFieldWidget(labelText: 'New Password'),
                const SizedBox(height: 10),
                TextFormFieldWidget(labelText: 'Comfirm Password'),
                const SizedBox(height: 10),
                elevatedButton(onpressed: () {}, child: const Text('Update'))
              ]),
            ),
          ))
        ],
      ),
    );
  }
}
