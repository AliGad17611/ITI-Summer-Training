import 'package:e_commerce/helper/shared_prefrence.dart';
import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About Appliication'),
            onTap: () {
              Navigator.pushNamed(context, '/about_app');
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About Developers'),
            onTap: () {
              Navigator.pushNamed(context, '/about_developer');
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              removeUserId();
              Navigator.pop(context, '/login');
            },
          )
        ],
      ),
    );
  }
}
