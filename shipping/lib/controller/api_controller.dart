import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';

class ApiController extends GetxController {
  String resCity = "";
  String resState = "";
  String resAddress = "";
  String resZipCode4 = "";
  String resZipCode5 = "";
  String resText = "";
  //
  String httplink =
      "https://secure.shippingapis.com/ShippingAPI.dll?API=Verify&XML=";
  String userId = "727LOCKE1033";
  // String url =
  //     """<AddressValidateRequest USERID="727LOCKE1033"><Revision>1</Revision><Address ID="0"><Address1>SUITE K</Address1><Address2>29851 Aventura</Address2><City/><State>CA</State><Zip5>92688</Zip5><Zip4/></Address></AddressValidateRequest>""";

  Future fetchAddress(
      {String city, String address, String state, String zipCode}) async {
    String requestedUrl = """<AddressValidateRequest USERID="$userId"><Address
ID="0"><Address1>$address</Address1>
<Address2></Address2><City>$city</City><State>$state</State><Zip5>$zipCode</Zip5><Zip4></Zip4></Address></AddressValidateRequest>""";
    try {
      final http.Response response = await http.get("$httplink$requestedUrl");
      // print('Response body: ${response.body}');
      // var body = json.decode(response.body);
      // print(json.decode(response.body));
      Xml2Json xml2json = new Xml2Json();

      xml2json.parse(response.body);
      var json =
          xml2json.toParker(); // the only method that worked for my XML type.

      print(json);
      var responsejson = jsonDecode(json);
      print(responsejson);

      resCity =
          responsejson['AddressValidateResponse']['Address']['City'].toString();
      resAddress = responsejson['AddressValidateResponse']['Address']
              ['Address2']
          .toString();
      resState = responsejson['AddressValidateResponse']['Address']['State']
          .toString();
      resZipCode5 =
          responsejson['AddressValidateResponse']['Address']['Zip5'].toString();
      resZipCode4 =
          responsejson['AddressValidateResponse']['Address']['Zip4'].toString();
      resText = responsejson['AddressValidateResponse']['Address']['ReturnText']
          .toString();
      print(
          "city:---${responsejson['AddressValidateResponse']['Address']['City']}");
      print("http request call");
      update();
      // print(response);
    } catch (e) {
      print(e);
    }
  }
}
