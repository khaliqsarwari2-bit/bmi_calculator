import 'package:flutter/material.dart';

import 'package:bmi_calculator/screens/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: HomeScreen(),
    ),
  );
}
