import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shipping/controller/api_controller.dart';

class Trackcreen extends StatefulWidget {
  @override
  _TrackcreenState createState() => _TrackcreenState();
}

class _TrackcreenState extends State<Trackcreen> {
  TextEditingController _trackId = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ApiController api = Get.put(ApiController());
    double widthStep = MediaQuery.of(context).size.width;
    double heightStep = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter track Id"),
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
                    height: 450,
                    width: 450,
                    child: Card(
                      elevation: 10.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: heightStep / 200),
                            child: Text(
                              "Enter Track id",
                              style: TextStyle(
                                  fontSize: 50, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          TextFormField(
                            decoration:
                                InputDecoration(hintText: "Enter Track id"),
                            controller: _trackId,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Name';
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
                        .getTrackId(trackId: _trackId.text)
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
            child: map['errorMessage'] != ""
                ? Container(
                    child: Text('Message:${map['errorMessage']}'),
                  )
                : Column(
                    children: [
                      Text("Track Summary:${map['TrackSummary']}"),
                      Text("Details"),
                      
                      for (var data in map['TrackDetail']) Text("$data\n"),
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
