import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'src/locations.dart' as locations;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GoogleMapController mapController;
  final Map<String, Marker> _markers = {};
  final LatLng _center = const LatLng(-17.373787, -66.156706);

  // void _onMapCreated(GoogleMapController controller) {
  //   setState(() {
  //     mapController = controller;
  //   });
  // }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    final googleOffices = await locations.getGoogleOffices();
    setState(() {
      _markers.clear();
      for (final office in googleOffices.offices) {
        final marker = Marker(
          markerId: MarkerId(office.name.toString()),
          position: LatLng(office.lat, office.lng),
          infoWindow: InfoWindow(
            title: office.name,
            snippet: office.address,
          ),
          icon: BitmapDescriptor.defaultMarker,
        );
        _markers[office.name] = marker;
      }
    });
  }

  // Set<Marker> myMarker() {
  //   setState(() {
  //     _markers.add(
  //       Marker(
  //         markerId: MarkerId(_center.toString()),
  //         position: _center,
  //         infoWindow: InfoWindow(
  //           title: 'Historical City',
  //           snippet: '5 start rating',
  //         ),
  //         icon: BitmapDescriptor.defaultMarker,
  //       ),
  //     );
  //   });
  //   return _markers;
  // }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Google Office Locations'),
          backgroundColor: Colors.green[700],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 2.0,
                ),
                // markers: this.myMarker(),
                markers: _markers.values.toSet(),
                mapType: MapType.normal,
                onMapCreated: _onMapCreated,
              ),
            )
          ],
        ),
      ),
    );
  }
}
