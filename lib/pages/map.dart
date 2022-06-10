import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:last_cc/widget/textbutton.dart';
import 'package:last_cc/widget/textformfield.dart';
import 'package:latlong2/latlong.dart';
// import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final SolidController _controller = SolidController();
  final TextEditingController _whereto = TextEditingController();

  // final spinkit = SpinKitFadingCircle(
  //   itemBuilder: (BuildContext context, int index) {
  //     return DecoratedBox(
  //       decoration: BoxDecoration(
  //         color: index.isEven ? Colors.blue : Colors.yellow,
  //       ),
  //     );
  //   },
  // );

  bool selected = false;
  dynamic color = Colors.lime;
  final isDraggedUp = false;
  final recentlocations = [];
  String? userName;
  getUserDetails() async {
    final prefs = await SharedPreferences.getInstance();
    recentlocations.add(_whereto);

    setState(() {
      userName = prefs.getString("firstname");
    });
  }

  @override
  initState() {
    getUserDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: FlutterMap(
            options: MapOptions(
              center: LatLng(-1.297333516395355, 5.153654338222793),
              zoom: 13.0,
            ),
            layers: [
              TileLayerOptions(
                urlTemplate:
                    "https://api.mapbox.com/styles/v1/0544511581/cl1eo8j3b003u14lq78dnur0s/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiMDU0NDUxMTU4MSIsImEiOiJjbDFlbjRjcmkwdDJ3M2RwM243OW9peHhsIn0.5NnXTVBG0rlfBnDV8UDDoA",
                additionalOptions: {
                  "accessToken":
                      "pk.eyJ1IjoiMDU0NDUxMTU4MSIsImEiOiJjbDFlbjRjcmkwdDJ3M2RwM243OW9peHhsIn0.5NnXTVBG0rlfBnDV8UDDoA",
                  'id': 'mapbox.satellite',
                },
                attributionBuilder: (_) {
                  return const Text("Central Noder Tech");
                },
              ),
              MarkerLayerOptions(
                markers: [
                  Marker(
                    width: 25.0,
                    height: 25.0,
                    point: LatLng(-1.297333516395355, 5.153654338222793),
                    builder: (ctx) => const FlutterLogo(
                        duration: Duration(milliseconds: 500)),
                  ),
                ],
              ),
            ],
          ),
          floatingActionButton: Stack(
            children: [
              FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => widget));
                },
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                child: const Icon(
                  Icons.location_searching,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          bottomSheet: SingleChildScrollView(
            child: SolidBottomSheet(
                minHeight: 250,
                controller: _controller,
                draggableBody: true,
                headerBar: Container(
                  height: 0,
                ),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            'Hello  $userName!',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text('Where to?',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormFieldWidget(labelText: 'Current location'),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormFieldWidget(
                            controller: _whereto, labelText: 'Where to?'),
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Select the automobile to use',
                          ),
                        ),
                        _buildChips()
                      ],
                    ),
                  ),
                )),
          )),
    );
  }

  int? _selectedIndex;
  final List<String> _options = ['CODA', 'Pragyea', 'Aboboyaa'];
  Widget _buildChips() {
    List<Widget> chips = [];

    for (int i = 0; i < _options.length; i++) {
      ChoiceChip choiceChip = ChoiceChip(
        selected: _selectedIndex == i,
        label: Text(_options[i], style: const TextStyle(color: Colors.white)),
        avatar:const FlutterLogo(),
        elevation: 10,
        pressElevation: 5,
        shadowColor: const Color.fromARGB(255, 37, 46, 45),
        backgroundColor: Colors.black54,
        selectedColor: Colors.blue,
        onSelected: (bool selected) {
          showModalBottomSheet(
              elevation: 10,
              context: context,
              builder: (context) => Container(
                    height: 55,
                    margin: const EdgeInsets.all(10),
                    child: SingleChildScrollView(
                      child: Column(children: [
                        Text('You Chose ${_options[i]} for your trip?'),
                        textButton(
                            onPressed: () {
                             Navigator.pop(context);
                            },
                            child: 'Confirm')
                      ]),
                    ),
                  ));
          setState(() {
            if (selected) {
              _selectedIndex = i;
            }
          });
        },
      );

      chips.add(Padding(
          padding: EdgeInsets.symmetric(horizontal: 10), child: choiceChip));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: chips,
    );
  }
}
