
// import 'credentials.dart';
import 'package:mapbox_search/mapbox_search.dart';

// ignore: constant_identifier_names
const MAPBOX_KEY = 'pk.eyJ1IjoiMDU0NDUxMTU4MSIsImEiOiJjbDFlbjRjcmkwdDJ3M2RwM243OW9peHhsIn0.5NnXTVBG0rlfBnDV8UDDoA';

  Future<void> main() async {
  String apiKey = MAPBOX_KEY; //Set up a test api key before running

  await geoCoding(apiKey).catchError(print);
  await placesSearch(apiKey).catchError(print);
}

///Reverse GeoCoding sample call
Future geoCoding(String apiKey) async {
  var geoCodingService = ReverseGeoCoding(
    apiKey: apiKey,
    country: "BR",
    limit: 5,
  );

  var addresses = await geoCodingService.getAddress(Location(
    lat: 5.53,
    lng:  -1.67,
  ));

  print(addresses);
}

///Places search sample call
Future placesSearch(String apiKey) async {
  var placesService = PlacesSearch(
  apiKey:
'https://api.mapbox.com/geocoding/v5/mapbox.places/-1.297333516395355,5.153654338222793.json?limit=1&types=place%2Cpostcode%2Caddress&access_token=pk.eyJ1IjoiMDU0NDUxMTU4MSIsImEiOiJjbDFlbjRjcmkwdDJ3M2RwM243OW9peHhsIn0.5NnXTVBG0rlfBnDV8UDDoA',
    country: "GH",
    limit: 5,
  );

  var places = await placesService.getPlaces(
    "patio",
    location: Location(
      lat: 5.1,
      lng:  -1.67,
    ),
  );

  print(places);
}