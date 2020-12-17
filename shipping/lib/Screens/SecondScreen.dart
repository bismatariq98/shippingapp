import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shipping/Screens/third_screen.dart';
import 'package:shipping/controller/api_controller.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  TextEditingController _nameFrom = TextEditingController();
  TextEditingController _addressFrom = TextEditingController();
  TextEditingController _cityFrom = TextEditingController();
  TextEditingController _zipCodeFrom = TextEditingController();
  TextEditingController _stateFrom = TextEditingController();
  TextEditingController _nameTo = TextEditingController();
  TextEditingController _addressTo = TextEditingController();
  TextEditingController _cityTo = TextEditingController();
  TextEditingController _zipCodeTo = TextEditingController();
  TextEditingController _stateTo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ApiController api = Get.put(ApiController());
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
                    height: 350,
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
                          TextFormField(
                            decoration: InputDecoration(hintText: "City"),
                            controller: _cityFrom,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'City';
                              }
                              return null;
                            },
                          ),
                          // SizedBox(
                          //   height: 30,
                          // ),
                          TextFormField(
                            decoration: InputDecoration(hintText: "Address"),
                            controller: _addressFrom,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Address';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(hintText: "State"),
                            controller: _stateFrom,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'State';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(hintText: "Zip Code"),
                            controller: _zipCodeFrom,
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
                    height: 350,
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
                            controller: _nameTo,
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
                            decoration: InputDecoration(hintText: "city"),
                            controller: _cityTo,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'City';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(hintText: "Address"),
                            controller: _addressTo,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Address';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(hintText: "State"),
                            controller: _stateTo,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'State';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(hintText: "Zip Code"),
                            controller: _zipCodeTo,
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
                RaisedButton(
                  onPressed: () {
                    //code here
                    api
                        .fetchAddress(
                            address: _addressFrom.text,
                            city: _cityFrom.text,
                            state: _stateFrom.text,
                            zipCode: _zipCodeFrom.text)
                        .then((value) => Get.to(ThirdScreen()));
                  },
                  child: Text("Validate"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
