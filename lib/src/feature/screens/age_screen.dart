import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/feature/widgets/My_health_app_drawer.dart';
import 'package:flutter_application_1/src/routes/my_health_app_router.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/feature/widgets/My_health_app_drawer.dart';

class AgeScreen extends StatefulWidget {
  @override
  _AgeScreenState createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {
  DateTime? _selectDate;
  int? _age;

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        _selectDate = pickedDate;
        _age = _calculateAge(pickedDate);
      });
    });
  }

  int _calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;

    if (currentDate.month < birthDate.month ||
        (currentDate.month == birthDate.month &&
            currentDate.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 194, 238, 181),
      drawer: MyHealthAppDrawer(),
      appBar: AppBar(
        title: Text('Age Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Age Screen',
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: _presentDatePicker,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF595596),
              ),
              child: Text(
                  _selectDate == null
                      ? 'Select your birth date'
                      : 'Change your birth date: ${_selectDate!.toIso8601String().substring(0, 10)}',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            ),
            if (_age != null)
              Text('You are $_age years old', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
