import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:last_cc/widget/textformfield.dart';
import 'package:latlong2/latlong.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
  
}

class _MyHomePageState extends State<MyHomePage> {
  final SolidController _controller = SolidController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  builder: (ctx) =>
                      const FlutterLogo(duration: Duration(milliseconds: 500)),
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
        bottomSheet: SolidBottomSheet(
            controller: _controller,
            draggableBody: true,
            headerBar: Container(
              height: 40,
              color: Colors.blueAccent,
              child: const Center(child: Text('Click to Book a ride')),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Hello Joe'),
                    TextFormFieldWidget(),
                    TextFormFieldWidget()
                  ],
                ),
              ),
            )));
  }
}
