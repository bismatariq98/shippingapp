import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';

class ApiControllerUps extends GetxController {
  String resCity = "";
  String resState = "";
  String resAddress = "";
  String resZipCode4 = "";
  String resZipCode5 = "";
  String resText = "";
  String errorMessage = "";
  //
  Map<String, dynamic> addressMap = {};
  String httplink = "https://onlinetools.ups.com/ups.app/xml/XAV";
  String rateHttplink = "https://onlinetools.ups.com/ups.app/xml/Rate";
  String userId = "Merganmomar";
  String password = "M421516718\$m";
  String liscence = "8D917391E2AEC895";
  Future fetchAddress({
    String address,
    String region,
    String politicaldivision1,
    String politicaldivision2,
    String postcodeprimarylow,
    String postcodeextendedlow,
    String countrycode,
  }) async {
    print(password);
    String requestedUrl =
        """ <?xml version="1.0" ?> <AccessRequest xml:lang='en-US'> <AccessLicenseNumber>$liscence</AccessLicenseNumber> <UserId>$userId</UserId> <Password>$password</Password> </AccessRequest> <?xml version="1.0" ?> <AddressValidationRequest xml:lang='en-US'> <Request> <TransactionReference> <CustomerContext>Your Customer Context</CustomerContext> </TransactionReference> <RequestAction>XAV</RequestAction> <RequestOption>1</RequestOption> </Request> <AddressKeyFormat> <AddressLine>$address</AddressLine> <Region>$region</Region> <PoliticalDivision2>$politicaldivision2</PoliticalDivision2> <PoliticalDivision1>$politicaldivision1</PoliticalDivision1> <PostcodePrimaryLow>$postcodeprimarylow</PostcodePrimaryLow> <PostcodeExtendedLow>$postcodeextendedlow</PostcodeExtendedLow> <CountryCode>$countrycode</CountryCode> </AddressKeyFormat> </AddressValidationRequest> """;
    // """<?xml version="1.0" ?> <AccessRequest xml:lang='en-US'> <AccessLicenseNumber>$liscence</AccessLicenseNumber><UserId>$userId</UserId> <Password>$password</Password> </AccessRequest> <?xml version="1.0" ?> <AddressValidationRequest xml:lang='en-US'> <Request> <TransactionReference> <CustomerContext>Your Customer Context</CustomerContext> </TransactionReference> <RequestAction>AV</RequestAction> </Request> <Address> <City>Alpharetta</City> <StateProvinceCode>GA</StateProvinceCode> <PostalCode>30005</PostalCode> <CountryCode>US</CountryCode> </Address> </AddressValidationRequest> """;

    try {
      final http.Response response = await http.post(
        "$httplink",
        headers: <String, String>{
          "Content-Type": "application/xml",
        },
        body: requestedUrl,
      );

      Xml2Json xml2json = new Xml2Json();

      xml2json.parse(response.body);
      var json =
          xml2json.toParker(); // the only method that worked for my XML type.

      print(json);
      var responsejson = jsonDecode(json);
      print(responsejson);
      // print("city is below--------");
      // print(responsejson['AddressValidationResponse']['AddressValidationResult']
      //     ['Address']['City']);
      Map<String, dynamic> addressList = {
        "Address": responsejson['AddressValidationResponse']['AddressKeyFormat']
            ['AddressLine'],
        "Region": responsejson['AddressValidationResponse']['AddressKeyFormat']
            ['Region'],
        "PoliticalDivision2": responsejson['AddressValidationResponse']
            ['AddressKeyFormat']['PoliticalDivision2'],
        "PoliticalDivision1": responsejson['AddressValidationResponse']
            ['AddressKeyFormat']['PoliticalDivision1'],
        "PostcodePrimaryLow": responsejson['AddressValidationResponse']
            ['AddressKeyFormat']['PostcodePrimaryLow'],
        "CountryCode": responsejson['AddressValidationResponse']
            ['AddressKeyFormat']['CountryCode'],
      };
      update();
      return addressList;

      // Map<String, dynamic> addressMap =
      // {
      //   "errorMessage":
      //       responsejson['AddressValidateResponse']['Address']['Error'] == null
      //           ? ""
      //           : responsejson['AddressValidateResponse']['Address']['Error']
      //               ['Description'],
      //   "City": responsejson['AddressValidateResponse']['Address']['City']
      //       .toString(),
      //   "Address": responsejson['AddressValidateResponse']['Address']['Address']
      //       .toString(),
      //   "Address2": responsejson['AddressValidateResponse']['Address']
      //           ['Address2']
      //       .toString(),
      //   "State": responsejson['AddressValidateResponse']['Address']['State']
      //       .toString(),
      //   "ZipCode5": responsejson['AddressValidateResponse']['Address']['Zip5']
      //       .toString(),
      //   "ZipCode4": responsejson['AddressValidateResponse']['Address']['Zip4']
      //       .toString(),
      //   "Text": responsejson['AddressValidateResponse']['Address']['ReturnText']
      //       .toString(),
      // };
      // resCity =
      //     responsejson['AddressValidateResponse']['Address']['City'].toString();
      // resAddress = responsejson['AddressValidateResponse']['Address']
      //         ['Address2']
      //     .toString();
      // resState = responsejson['AddressValidateResponse']['Address']['State']
      //     .toString();
      // resZipCode5 =
      //     responsejson['AddressValidateResponse']['Address']['Zip5'].toString();
      // resZipCode4 =
      //     responsejson['AddressValidateResponse']['Address']['Zip4'].toString();
      // resText = responsejson['AddressValidateResponse']['Address']['ReturnText']
      //     .toString();
      // print(
      //     "city:---${responsejson['AddressValidateResponse']['Address']['City']}");
      // print("http request call");
      // update();
      // return addressMap;
    } catch (e) {
      print(e);
    }
  }

  Future pricing({String name, String address}) async {
    String requestedUrl = """
   <?xml version="1.0"?>
<AccessRequest xml:lang="en-US">
	<AccessLicenseNumber>8D917391E2AEC895</AccessLicenseNumber>
	<UserId>Merganmomar</UserId>
	<Password>M421516718\$m</Password>
</AccessRequest>
<?xml version="1.0"?>
<RatingServiceSelectionRequest xml:lang="en-US">
	<Request>
		<TransactionReference>
			<CustomerContext>Your Customer Context</CustomerContext>
		</TransactionReference>
		<RequestAction>Rate</RequestAction>
		<RequestOption>Rate</RequestOption>
	</Request>
	<Shipment>
		<Shipper>
			<Name>Shipper Name</Name>
			<AttentionName>Shipper Attention Name</AttentionName>
			<PhoneNumber>1234567890</PhoneNumber>
		
			
			<Address>
				<AddressLine1>Address Line 1</AddressLine1>
				<City>California</City>
				<StateProvinceCode></StateProvinceCode>
				<PostalCode>93551</PostalCode>
				<CountryCode>US</CountryCode>
			</Address>
		</Shipper>
		<ShipTo>
			<CompanyName>Ship To Company Name</CompanyName>
			<AttentionName>Ship To Attention Name</AttentionName>
			<PhoneNumber>1234567890</PhoneNumber>
			
			<Address>
				<AddressLine1>Address Line 1</AddressLine1>
				<City></City>
				<StateProvinceCode></StateProvinceCode>
				<PostalCode>93551</PostalCode>
				<CountryCode>US</CountryCode>
			</Address>
		</ShipTo>
		<ShipFrom>
			<CompanyName>Ship From Company Name</CompanyName>
			<AttentionName>Ship From Attention Name</AttentionName>
			<PhoneNumber>1234567890</PhoneNumber>
			
			<Address>
				<AddressLine1> </AddressLine1>
				<City></City>
				<StateProvinceCode></StateProvinceCode>
				<PostalCode>93551</PostalCode>
				<CountryCode></CountryCode>
			</Address>
		</ShipFrom>
		<Service>
			<Code>59</Code>
			<Description>2nd Day Air AM</Description>
		</Service>
		<Package>
			<PackagingType>
				<Code>02</Code>
				<Description>UPS Package</Description>
			</PackagingType>
			<PackageWeight>
				<UnitOfMeasurement>
					<Code>LBS</Code>
				</UnitOfMeasurement>
				<Weight>5</Weight>
			</PackageWeight>
			<Dimensions>
				<Length>10</Length>
				<Width>5</Width>
				<Height>7</Height>
			</Dimensions>
		</Package>
	</Shipment>
</RatingServiceSelectionRequest> 
   """;

    try {
      final http.Response response = await http.post(
        "$rateHttplink",
        headers: <String, String>{
          "Content-Type": "application/xml",
        },
        body: requestedUrl,
      );

      Xml2Json xml2json = new Xml2Json();

      xml2json.parse(response.body);
      var json =
          xml2json.toParker(); // the only method that worked for my XML type.

      print(json);
      var responsejson = jsonDecode(json);
      print(responsejson);
      // print("city is below--------");
      // print(responsejson['AddressValidationResponse']['AddressValidationResult']
      //     ['Address']['City']);
      Map<String, dynamic> addressList = {};
      update();
      return addressList;
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
