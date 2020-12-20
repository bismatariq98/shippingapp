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
  String errorMessage = "";
  //
  Map<String, dynamic> addressMap = {};
  String httplink = "https://secure.shippingapis.com/ShippingAPI.dll?API=";
  String userId = "727LOCKE1033";

  Future fetchAddress(
      {String city,
      String address,
      String address2,
      String state,
      String zipCode}) async {
    String requestedUrl =
        """<Verify&XML=AddressValidateRequest USERID="$userId"><Address
ID="0"><Address1>$address</Address1>
<Address2>$address2</Address2><City>$city</City><State>$state</State><Zip5>$zipCode</Zip5><Zip4></Zip4></Address></AddressValidateRequest>""";
    try {
      final http.Response response = await http.get("$httplink$requestedUrl");

      Xml2Json xml2json = new Xml2Json();

      xml2json.parse(response.body);
      var json =
          xml2json.toParker(); // the only method that worked for my XML type.

      print(json);
      var responsejson = jsonDecode(json);
      print(responsejson);

      Map<String, dynamic> addressMap = {
        "errorMessage":
            responsejson['AddressValidateResponse']['Address']['Error'] == null
                ? ""
                : responsejson['AddressValidateResponse']['Address']['Error']
                    ['Description'],
        "City": responsejson['AddressValidateResponse']['Address']['City']
            .toString(),
        "Address": responsejson['AddressValidateResponse']['Address']['Address']
            .toString(),
        "Address2": responsejson['AddressValidateResponse']['Address']
                ['Address2']
            .toString(),
        "State": responsejson['AddressValidateResponse']['Address']['State']
            .toString(),
        "ZipCode5": responsejson['AddressValidateResponse']['Address']['Zip5']
            .toString(),
        "ZipCode4": responsejson['AddressValidateResponse']['Address']['Zip4']
            .toString(),
        "Text": responsejson['AddressValidateResponse']['Address']['ReturnText']
            .toString(),
      };
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
      return addressMap;
    } catch (e) {
      print(e);
    }
  }

  Future getTrackId({String trackId}) async {
    String requestedUrl = """TrackV2
&XML=<TrackRequest USERID="$userId">
<TrackID ID="$trackId"></TrackID></TrackRequest>""";
    try {
      final http.Response response = await http.get("$httplink$requestedUrl");

      Xml2Json xml2json = new Xml2Json();

      xml2json.parse(response.body);
      var json = xml2json.toParker();

      print(json);
      var responsejson = jsonDecode(json);
      print(responsejson);

      print(responsejson['TrackResponse']['TrackInfo']['Error']);
      Map<String, dynamic> addressMap = {
        "errorMessage":
            responsejson['TrackResponse']['TrackInfo']['Error'] == null
                ? ""
                : responsejson['TrackResponse']['TrackInfo']['Error']
                    ['Description'],
        "TrackSummary": responsejson['TrackResponse']['TrackInfo']
                ['TrackSummary']
            .toString(),
        "TrackDetail":
            responsejson['TrackResponse']['TrackInfo']['TrackDetail'] == null
                ? []
                : responsejson['TrackResponse']['TrackInfo']['TrackDetail']
      };

      print("http request call");
      update();
      return addressMap;
    } catch (e) {
      print(e);
    }
  }

  Future getCalculated(
      {String zipOrigin,
      String zipDestination,
      String pounds,
      String ounce,
      String container,
      String width,
      String length,
      String height}) async {
    String requestedUrl =
        """RateV4&XML=<RateV4Request USERID="$userId"><Revision>2</Revision><Package ID="0"><Service>PRIORITY</Service><ZipOrigination>22201</ZipOrigination><ZipDestination>26301</ZipDestination><Pounds>8</Pounds><Ounces>2</Ounces><Container></Container><Width></Width><Length></Length><Height></Height><Girth></Girth><Machinable>TRUE</Machinable></Package></RateV4Request>
""";
    try {
      final http.Response response = await http.get("$httplink$requestedUrl");

      Xml2Json xml2json = new Xml2Json();

      xml2json.parse(response.body);
      var json = xml2json.toParker();

      print(json);
      var responsejson = jsonDecode(json);
      print(responsejson);

      // print(responsejson['TrackResponse']['TrackInfo']['Error']);
      Map<String, dynamic> priceMap = {
        // "errorMessage":
        //     responsejson['TrackResponse']['TrackInfo']['Error'] == null
        //         ? ""
        //         : responsejson['TrackResponse']['TrackInfo']['Error']
        //             ['Description'],
        "ServiceList": responsejson['RateV4Response']['Package']['Postage']
            ['SpecialServices']
      };

      print("http request call");
      update();
      return priceMap;
    } catch (e) {
      print(e);
    }
  }
}
