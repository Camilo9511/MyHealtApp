import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/feature/screens/age_screen.dart';
import 'package:flutter_application_1/src/feature/widgets/My_health_app_drawer.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 187, 246, 229),
      drawer: MyHealthAppDrawer(),
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Home_Screen',
              style: TextStyle(fontSize: 20),
            ),

            ElevatedButton(
              onPressed: () {
                context.go('/zodiac');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0c8127),
              ),
              child: Text('go from to zodiac screen',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            ), //elevatedButton
          ],
        ),
      ),
    );
  }
}
