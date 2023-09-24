import 'package:flutter/material.dart';

import '../screens/settings_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Theme.of(context).primaryColorDark,
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Agba Cook',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 32),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          ListTile(
            leading: Icon(
              Icons.restaurant,
              size: 30,
            ),
            title: Text(
              'Meal',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'RobotoCondensed'),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          SizedBox(
            height: 5,
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 30,
            ),
            title: Text(
              'Settings',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'RobotoCondensed'),
            ),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(SettingsScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
