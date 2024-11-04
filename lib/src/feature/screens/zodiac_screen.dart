import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/feature/screens/age_screen.dart';
import 'package:flutter_application_1/src/feature/widgets/My_health_app_drawer.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ZodiacScreen extends StatefulWidget {
  @override
  _ZodiacScreenState createState() => _ZodiacScreenState();
}

class _ZodiacScreenState extends State<ZodiacScreen> {
  final TextEditingController _nameController = TextEditingController();
  DateTime? _selectedDate;
  String? _zodiacSign;

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        _selectedDate = pickedDate;
        _zodiacSign = _calculateZodiacSign(pickedDate);
      });
    });
  }

  String _calculateZodiacSign(DateTime birthDate) {
    final int day = birthDate.day;
    final int month = birthDate.month;

    if ((month == 1 && day >= 20) || (month == 2 && day <= 18))
      return "Aquarius";
    if ((month == 2 && day >= 19) || (month == 3 && day <= 20)) return "Pisces";
    if ((month == 3 && day >= 21) || (month == 4 && day <= 19)) return "Aries";
    if ((month == 4 && day >= 20) || (month == 5 && day <= 20)) return "Taurus";
    if ((month == 5 && day >= 21) || (month == 6 && day <= 20)) return "Gemini";
    if ((month == 6 && day >= 21) || (month == 7 && day <= 22)) return "Cancer";
    if ((month == 7 && day >= 23) || (month == 8 && day <= 22)) return "Leo";
    if ((month == 8 && day >= 23) || (month == 9 && day <= 22)) return "Virgo";
    if ((month == 9 && day >= 23) || (month == 10 && day <= 22)) return "Libra";
    if ((month == 10 && day >= 23) || (month == 11 && day <= 21))
      return "Scorpio";
    if ((month == 11 && day >= 22) || (month == 12 && day <= 21))
      return "Sagittarius";
    if ((month == 12 && day >= 22) || (month == 1 && day <= 19))
      return "Capricorn";

    return "Unknown";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 200, 230),
      drawer: MyHealthAppDrawer(),
      appBar: AppBar(
        title: Text('Zodiac Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Zodiac Calculator',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Enter your name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _presentDatePicker,
              child: Text(_selectedDate == null
                  ? 'Select your birth date'
                  : 'Change your birth date'),
            ),
            SizedBox(height: 20),
            if (_zodiacSign != null)
              Text(
                'Hello ${_nameController.text}, your zodiac sign is $_zodiacSign!',
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.go('/age');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF005a50),
              ),
              child: Text('Go from zodiac to age screen',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
