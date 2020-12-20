import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shipping/Screens/third_screen.dart';
import 'package:shipping/controller/api_controller.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  TextEditingController zipOrigin = TextEditingController();
  TextEditingController zipDestination = TextEditingController();
  TextEditingController pounds = TextEditingController();
  TextEditingController ounce = TextEditingController();
  TextEditingController container = TextEditingController();
  TextEditingController width = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController length = TextEditingController();
  // TextEditingController _address2To = TextEditingController();
  // TextEditingController _cityTo = TextEditingController();
  // TextEditingController _zipCodeTo = TextEditingController();
  // TextEditingController _stateTo = TextEditingController();

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
            width: widthStep,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: heightStep / 3000),
                  child: Container(
                    height: 600,
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
                            decoration: InputDecoration(hintText: "Zip Origin"),
                            controller: zipOrigin,
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
                            decoration:
                                InputDecoration(hintText: "Zip Destination"),
                            controller: zipDestination,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'City';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(hintText: "Pounds"),
                            controller: pounds,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Address';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(hintText: "Ounce"),
                            controller: ounce,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Address';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(hintText: "Container"),
                            controller: container,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'State';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(hintText: "Width"),
                            controller: width,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Zip Code';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(hintText: "length"),
                            controller: length,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Zip Code';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(hintText: "height"),
                            controller: height,
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
                    api.getCalculated(
                        container: container.text,
                        height: height.text,
                        length: length.text,
                        ounce: ounce.text,
                        pounds: pounds.text,
                        width: width.text,
                        zipOrigin: zipOrigin.text,
                        zipDestination: zipDestination.text);
                    // .then((value) => diaLog(context, value));
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

diaLog(context, map) {
  showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text("Confirm Address"),
          content: Container(
            height: 400,
            child
                // : map['errorMessage'] != ""
                //     ? Container(
                //         child: Text('Message:${map['errorMessage']}'),
                //       )
                : Column(
              children: [
                for (var data in map['ServiceList']) Text("${data['Price']}")
                // Text("City:${map['City']}"),
                // Text("Address:${map['Address']}"),
                // Text("Address2:${map['Address2']}"),
                // Text("State:${map['State']}"),
                // Text("ZipCode5:${map['ZipCode5']}"),
                // Text("ZipCode4:${map['ZipCode4']}"),
                // Text("Message:${map['Text']}")
              ],
            ),
          ),
          actions: [
            RaisedButton(
              onPressed: () {
                Get.back();
              },
              child: Text("Confirmed"),
            ),
          ],
        );
      });
}
