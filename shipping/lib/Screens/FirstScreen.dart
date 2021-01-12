import 'package:flutter/material.dart';
import 'package:shipping/Widgets/List.dart';
import 'package:get/get.dart';
import 'package:shipping/controller/api_controllerUps.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  ApiControllerUps _apiControllerUps = ApiControllerUps();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text("Locker Maps"),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              _apiControllerUps.fetchAddress();
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/logo/logo.jpg"))),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GridView.builder(
            itemCount: ImageList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1.0,
                crossAxisCount: 2,
                crossAxisSpacing: 1.2,
                mainAxisSpacing: 1.0),
            itemBuilder: (context, i) {
              return Card(
                  elevation: 4.0, child: Image.asset(ImageList[i].picName));
            }),
      ),
    );
  }
}
