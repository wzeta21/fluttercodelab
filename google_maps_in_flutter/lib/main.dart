import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GoogleMapController mapController;
  final Set<Marker> _markers = new Set<Marker>();
  final LatLng _center = const LatLng(-17.373787, -66.156706);

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Maps With Marker'),
          backgroundColor: Colors.green[700],
        ),
        // body: GoogleMap(
        //   onMapCreated: _onMapCreated,
        //   initialCameraPosition: CameraPosition(target: _center, zoom: 11.0),
        // ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 11.0,
                ),
                markers: this.myMarker(),
                mapType: MapType.normal,
                onMapCreated: _onMapCreated,
              ),
            )
          ],
        ),
      ),
    );
  }

  Set<Marker> myMarker() {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId(_center.toString()),
          position: _center,
          infoWindow: InfoWindow(
            title: 'Historical City',
            snippet: '5 start rating',
          ),
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
    });
    return _markers;
  }
}
