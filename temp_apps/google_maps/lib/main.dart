import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

// import 'loction_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Google Maps Demo',
      home: MapSample(),
    );
  }
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  late GoogleMapController _controller;

  TextEditingController _searchController = TextEditingController();

  static final Marker _kGooglePlexMarker = Marker(
    markerId: MarkerId('_kGooglePlex'),
    infoWindow: InfoWindow(title: 'Google Plex'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(37.42796133580664, -122.085749655962),
  );

  static final Marker _kLakeMarker = Marker(
    markerId: MarkerId('_kGooglePlex'),
    infoWindow: InfoWindow(title: 'Lake'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    position: LatLng(37.43296265331129, -122.08832357078792),
  );

  static CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(37.43296265331129, -122.08832357078792), zoom: 14);

  static CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  static Polyline _kPolyLine = Polyline(
      polylineId: PolylineId("_kPolyline"),
      points: [
        LatLng(37.43296265331129, -122.08832357078792),
        LatLng(_kLake.target.latitude, _kLake.target.longitude),
      ],
      width: 5);

  static final Polygon _kPolygon = Polygon(
      polygonId: PolygonId("_kPolyGON"),
      points: [
        LatLng(37.42796133580664, -122.085749655962),
        LatLng(37.43296265331129, -122.08832357078792),
        LatLng(37.435, -122.092),
        LatLng(37.412, -122.092),
      ],
      strokeWidth: 5,
      fillColor: Colors.transparent);

  Location location = new Location();
  bool? _serviceEnabled;
  PermissionStatus? _permissionGranted;
  late double x;
  late double y;

  // LocationData? _locationData;
  // StreamSubscription? _locationSubscription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Google Maps"),
      //   centerTitle: true,
      // ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              mapType: MapType.hybrid,
              // polygons: {_kPolygon},
              polylines: {_kPolyLine},

              // markers: {
              //   _kGooglePlexMarker,
              //   _kLakekeMarker,
              // },
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller = controller;
              },
              onTap: (value) {
                print(value.latitude);
                print(value.longitude);
                setState(() {

                  location.onLocationChanged.listen((event) {
                    x = event.longitude!;
                    y = event.latitude!;
                  });
                  _kPolyLine = Polyline(
                      polylineId: PolylineId("_kPolyline"),
                      points: [
                        LatLng(y, x),
                        LatLng(value.latitude, value.longitude),
                      ],
                      width: 5);
                });
              },
            ),
          ),
          IconButton(
              onPressed: () async {
                _serviceEnabled = await location.serviceEnabled();
                if (!_serviceEnabled!) {
                  _serviceEnabled = await location.requestService();
                  if (!_serviceEnabled!) {
                    return;
                  }
                }
                _permissionGranted = await location.hasPermission();
                if (_permissionGranted == PermissionStatus.denied) {
                  _permissionGranted = await location.requestPermission();
                  if (_permissionGranted != PermissionStatus.granted) {
                    return;
                  }
                }
                location.onLocationChanged.listen((newLocalData) {
                  if (_controller != null) {
                    _controller.animateCamera(CameraUpdate.newCameraPosition(
                        CameraPosition(
                            bearing: 90.8334901395799,
                            target: LatLng(newLocalData.latitude!,
                                newLocalData.longitude!),
                            tilt: 0,
                            zoom: 20)));
                  }
                });
              },
              icon: const Icon(Icons.search)),
        ],
      ),
    );
  }
//
// Future<void> _goToTheLake() async {
//   final GoogleMapController controller = await _controller.future;
//   controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
// }
}
