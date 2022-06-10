// ignore_for_file: non_constant_identifier_names

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
  late TextEditingController first_nameController = TextEditingController();
  late TextEditingController sur_nameController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  String? first_name;
  String? sur_name;
  String? firstname;
  String? surname;

  getUserDetails() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      firstname = prefs.getString("firstname");
      surname = prefs.getString("surname");
      first_name == firstname;
      sur_name == surname;
    });
  }

  @override
  void initState() {
    getUserDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              elevation: 00,
              title: Text(
                "Profile",
                style: Theme.of(context).textTheme.headline5,
              ),
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
            body: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              reverse: true,
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Form(
                    key: _formkey,
                    child: Column(children: [
                      const SizedBox(height: 10),
                      Center(
                          child: CircleAvatar(
                        radius: 50,
                        child: CircleAvatar(
                          child: Text(
                            firstname![0],
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          radius: 48,
                          backgroundColor: Colors.grey,
                        ),
                      )),
                      const SizedBox(
                        height: 10,
                      ),
                      ListTile(
                        leading: Text(
                          'First Name:',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        trailing: Text(
                          '$firstname',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      ListTile(
                        leading: Text(
                          ' Surname:',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        trailing: Text(
                          '$surname',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      ListTile(
                        leading: Text(
                          ' Email:',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        trailing: Text(
                          'not yet in',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      const SizedBox(height: 25),
                      Text(
                        'Edit Profile',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 10),
                      TextFormFieldWidget(
                        labelText: 'First Name',
                        controller: first_nameController,
                      ),
                      const SizedBox(height: 10),
                      TextFormFieldWidget(
                        labelText: 'Surname',
                        controller: sur_nameController,
                      ),
                      const SizedBox(height: 10),
                      TextFormFieldWidget(labelText: 'Email Address'),
                      const SizedBox(height: 10),
                      elevatedButton(
                          child: const Text('Update'),
                          onpressed: () async {
                            final prefs = await SharedPreferences.getInstance();

                            if (_formkey.currentState!.validate()) {
                              prefs.setString(
                                'firstname',
                                first_nameController.text,
                              );
                              prefs.setString(
                                  'surname', sur_nameController.text);
                              prefs.reload();
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Profile edited')));
                            }
                          })
                    ]),
                  )),
            )));
  }
}
