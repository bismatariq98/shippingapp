import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shipping/controller/api_controller.dart';

class ThirdScreen extends StatefulWidget {
  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  ApiController api = Get.put(ApiController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("city: ${api.resCity}"),
              Text("address: ${api.resAddress}"),
              Text("State: ${api.resState}"),
              Text("Zipcode 4: ${api.resZipCode4}"),
              Text("Zip code 5: ${api.resZipCode5}"),
              Text("Message: ${api.resText}"),
            ],
          ),
        ),
      ),
    );
  }
}
