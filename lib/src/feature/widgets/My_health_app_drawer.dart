import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/feature/screens/age_screen.dart';
import 'package:go_router/go_router.dart';

class MyHealthAppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text('My health app'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            tileColor: Color(0xFF005a50),
            title: Text(
              'Home',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              context.go('/');
            },
          ),
          ListTile(
            tileColor: Color(0xFFFFFFAC),
            title: Text(
              'BMI_Calculator',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              context.go('/bmi');
            },
          ),
          ListTile(
            tileColor: Color(0xFF692d4f),
            title: Text(
              'Age_Calculator',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              context.go('/age');
            },
          ),
          ListTile(
            tileColor: Color(
              0xFFb81118,
            ),
            title: Text(
              'Zodiac_Calculator',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              context.go('/zodiac');
            },
          ),
        ],
      ),
    );
  }
}
