import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shipping/Screens/FirstScreen.dart';
import 'package:shipping/Screens/SecondScreen.dart';
import 'package:shipping/Screens/calculator_page.dart';
import 'package:shipping/Screens/trackPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // home: FirstScreen(),
      home: CalculatorPage(),
    );
  }
}
