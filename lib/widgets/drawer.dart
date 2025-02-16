
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 16.0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("John Doe"),
            accountEmail: Text("john.doe@example.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: Colors.blue),
            ),
          ),
          ListTile(
            title: Text("Settings"),
            onTap: () {},
          ),
          ListTile(
            title: Text("Profile"),
            onTap: () {},
          ),
          ListTile(
            title: Text("Help"),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            title: Text("Logout"),
            onTap: () {
              // Handle logout
            },
          ),
        ],
      ),
    );
  }
}