import 'package:flutter/material.dart';
import 'package:last_cc/pages/User.dart';

Drawer drawer({context}) {
  return Drawer(
    elevation: 2,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const <Widget>[
         UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.black,
            ),
            accountName: Text('Profile'),
            accountEmail: Text('Profile')),
         DrawerListItems(
          title: 'Profile',
          icon: Icons.person,
          route: PersonDetail(),
        ),
         DrawerListItems(
          title: 'History',
          icon: Icons.history,
          route: null,
        ),
         DrawerListItems(
          title: 'Wallet',
          icon: Icons.money,
          route: null,
        ),
         DrawerListItems(
          title: 'Invite',
          icon: Icons.share,
          route: PersonDetail(),
        ),
         Divider(
          height: 20,
          thickness: 2,
          indent: 5,
          endIndent: 5,
        ),
         DrawerListItems(
          title: 'LogOut',
          icon: Icons.logout,
          route: null,
        ),
      ],
    ),
  );
}

class DrawerListItems extends StatelessWidget {
  const  DrawerListItems({
    required this.icon,
    required this.route,
    required this.title,
    Key? key,
  }) : super(key: key);
  final String title;
  final IconData icon;
  final Widget? route;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (context) => route!));
      },
    );
  }
}
