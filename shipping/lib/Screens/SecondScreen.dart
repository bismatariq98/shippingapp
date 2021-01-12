import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shipping/Screens/third_screen.dart';
import 'package:shipping/controller/api_controller.dart';
import 'package:shipping/controller/api_controllerUps.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  TextEditingController _nameFrom = TextEditingController();
  TextEditingController _addressFrom = TextEditingController();
  TextEditingController _address2From = TextEditingController();
  TextEditingController _cityFrom = TextEditingController();
  TextEditingController _zipCodeFrom = TextEditingController();
  TextEditingController _stateFrom = TextEditingController();
  TextEditingController _nameTo = TextEditingController();
  TextEditingController _addressTo = TextEditingController();
  TextEditingController _address2To = TextEditingController();
  TextEditingController _cityTo = TextEditingController();
  TextEditingController _zipCodeTo = TextEditingController();
  TextEditingController _stateTo = TextEditingController();
  TextEditingController _regionTo = TextEditingController();
  TextEditingController _politicaldivision1To = TextEditingController();
  TextEditingController _politicaldivision2To = TextEditingController();
  TextEditingController _postcodeprimarylowTo = TextEditingController();
  TextEditingController _postcodeextendedlowTo = TextEditingController();
  TextEditingController _countrycodeto = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ApiControllerUps api = Get.put(ApiControllerUps());
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
            height: 700,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Padding(
                //   padding: EdgeInsets.only(left: heightStep / 3000),
                //   child: Container(
                //     height: 400,
                //     width: 450,
                //     child: Card(
                //       elevation: 10.0,
                //       child: Column(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                // Padding(
                //   padding: EdgeInsets.only(left: heightStep / 200),
                //   child: Text(
                //     "From",
                //     style: TextStyle(
                //         fontSize: 50, fontWeight: FontWeight.bold),
                //     textAlign: TextAlign.center,
                //   ),
                // ),
                // TextFormField(
                //   decoration: InputDecoration(hintText: "Name"),
                //   controller: _nameFrom,
                //   validator: (String value) {
                //     if (value.isEmpty) {
                //       return 'Name';
                //     }
                //     return null;
                //   },
                // ),
                // TextFormField(
                //   decoration: InputDecoration(hintText: "City"),
                //   controller: _cityFrom,
                //   validator: (String value) {
                //     if (value.isEmpty) {
                //       return 'City';
                //     }
                //     return null;
                //   },
                // ),
                // // SizedBox(
                // //   height: 30,
                // // ),
                // TextFormField(
                //   decoration: InputDecoration(hintText: "Address"),
                //   controller: _addressFrom,
                //   validator: (String value) {
                //     if (value.isEmpty) {
                //       return 'Address';
                //     }
                //     return null;
                //   },
                // ),
                // TextFormField(
                //   decoration: InputDecoration(hintText: "Address 2"),
                //   controller: _address2From,
                //   validator: (String value) {
                //     if (value.isEmpty) {
                //       return 'Address ';
                //     }
                //     return null;
                //   },
                // ),
                // TextFormField(
                //   decoration: InputDecoration(hintText: "State"),
                //   controller: _stateFrom,
                //   validator: (String value) {
                //     if (value.isEmpty) {
                //       return 'State';
                //     }
                //     return null;
                //   },
                // ),
                // TextFormField(
                //   decoration: InputDecoration(hintText: "Zip Code"),
                //   controller: _zipCodeFrom,
                //   validator: (String value) {
                //     if (value.isEmpty) {
                //       return 'Zip Code';
                //     }
                //     return null;
                //   },
                // ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                Padding(
                  padding: EdgeInsets.only(left: heightStep / 3000),
                  child: Container(
                    // height: 450,
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
                          // TextFormField(
                          //   decoration: InputDecoration(hintText: "city"),
                          //   controller: _cityTo,
                          //   validator: (String value) {
                          //     if (value.isEmpty) {
                          //       return 'City';
                          //     }
                          //     return null;
                          //   },
                          // ),
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
                          // TextFormField(
                          //   decoration: InputDecoration(hintText: "Address 2"),
                          //   controller: _address2To,
                          //   validator: (String value) {
                          //     if (value.isEmpty) {
                          //       return 'Address';
                          //     }
                          //     return null;
                          //   },
                          // ),
                          // String city,
                          // String address,
                          // String region,
                          // String politicaldivision1,
                          // String politicaldivision2,
                          // String postcodeprimarylow,
                          // String postcodeextendedlow,
                          // String countrycode,
                          TextFormField(
                            decoration: InputDecoration(hintText: "Region"),
                            controller: _regionTo,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'region';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                hintText: "Political Division 1"),
                            controller: _politicaldivision1To,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'politicaldivision1';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                hintText: "Political Divison 2"),
                            controller: _politicaldivision2To,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'politicaldivision2';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                hintText: "Post Code Primary Low"),
                            controller: _postcodeprimarylowTo,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'postcodeprimarylow';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                hintText: "Post Code Extended Low"),
                            controller: _postcodeextendedlowTo,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'postcodeextendedlow';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration:
                                InputDecoration(hintText: "CountryCode"),
                            controller: _countrycodeto,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'countrycode';
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
                          address: _addressTo.text,
                          region: _regionTo.text,
                          politicaldivision1: _politicaldivision1To.text,
                          politicaldivision2: _politicaldivision2To.text,
                          postcodeprimarylow: _postcodeprimarylowTo.text,
                          postcodeextendedlow: _postcodeextendedlowTo.text,
                          countrycode: _countrycodeto.text,
                        )
                        .then((value) => diaLog(context, value));
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
            child:
                //  map['errorMessage'] != ""
                //     ? Container(
                //         child: Text('Message:${map['errorMessage']}'),
                //         // child: Text("jjjk"),
                //       )
                //     :
                Column(
              children: [
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
