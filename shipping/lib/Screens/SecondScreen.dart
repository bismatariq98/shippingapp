import 'package:shipping/main.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _nameFrom = TextEditingController();
    TextEditingController _addressFrom = TextEditingController();
    TextEditingController _cityFrom = TextEditingController();
    TextEditingController _zipCodeFrom = TextEditingController();
    TextEditingController _stateFrom = TextEditingController();
    double widthStep = MediaQuery.of(context).size.width;
    double heightStep = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Form"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: heightStep,
            width: widthStep,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: heightStep / 3000),
                  child: Container(
                    height: 300,
                    width: 450,
                    child: Card(
                      elevation: 10.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: heightStep / 200),
                            child: Text(
                              "From",
                              style: TextStyle(
                                  fontSize: 50, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          TextFormField(
                            decoration: InputDecoration(hintText: "Name"),
                            controller: _nameFrom,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Name';
                              }
                              return null;
                            },
                          ),
                          // SizedBox(
                          //   height: 30,
                          // ),
                          TextFormField(
                            decoration: InputDecoration(hintText: "Address"),
                            controller: _nameFrom,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Address';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(hintText: "State"),
                            controller: _nameFrom,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'State';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(hintText: "Zip Code"),
                            controller: _nameFrom,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Zip Code';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: heightStep / 3000),
                  child: Container(
                    height: 300,
                    width: 450,
                    child: Card(
                      elevation: 10.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: heightStep / 200),
                            child: Text(
                              "To",
                              style: TextStyle(
                                  fontSize: 50, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          TextFormField(
                            decoration: InputDecoration(hintText: "Name"),
                            controller: _nameFrom,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Name';
                              }
                              return null;
                            },
                          ),
                          // SizedBox(
                          //   height: 30,
                          // ),
                          TextFormField(
                            decoration: InputDecoration(hintText: "Address"),
                            controller: _nameFrom,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Address';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(hintText: "State"),
                            controller: _nameFrom,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'State';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(hintText: "Zip Code"),
                            controller: _nameFrom,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Zip Code';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
