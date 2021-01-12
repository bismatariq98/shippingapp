import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shipping/Screens/trackPage.dart';

import 'SecondScreen.dart';
import 'calculator_page.dart';

class Options extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select options"),
      ),
      body: Container(
        child: Column(
          children: [
            RaisedButton(
              onPressed: () {
                Get.to(SecondScreen());
              },
              child: Text("validate Address"),
            ),
            RaisedButton(
              onPressed: () {
                Get.to(Trackcreen());
              },
              child: Text("Track Package"),
            ),
            RaisedButton(
              onPressed: () {
                Get.to(CalculatorPage());
              },
              child: Text("Price Calculator"),
            )
          ],
        ),
      ),
    );
  }
}
