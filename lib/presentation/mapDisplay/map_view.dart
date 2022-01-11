import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mother_bet/dataProvider/map_data_providers.dart';
import 'package:mother_bet/models/directions.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(37.773972, -122.431297),
    zoom: 11.5,
  );

  Location location = Location();
  late GoogleMapController _mapController;
  dynamic _origin;
  dynamic _destination;
  dynamic _info;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Maps"),
          actions: [
            if (_origin != null)
              TextButton(
                onPressed: () => _mapController.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(target: _origin, zoom: 14, tilt: 50.0),
                  ),
                ),
                style: TextButton.styleFrom(
                  primary: Colors.green,
                  textStyle: const TextStyle(fontWeight: FontWeight.w600),
                ),
                child: const Text("ORIGIN"),
              ),
            if (_destination != null)
              TextButton(
                onPressed: () => _mapController.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(target: _destination, zoom: 14, tilt: 50.0),
                  ),
                ),
                style: TextButton.styleFrom(
                  primary: Colors.blue,
                  textStyle: const TextStyle(fontWeight: FontWeight.w600),
                ),
                child: const Text("ORIGIN"),
              )
          ],
        ),
        body: GoogleMap(
          initialCameraPosition: _initialCameraPosition,
          zoomControlsEnabled: false,
          myLocationEnabled: true,
          onMapCreated: _onMapCreated,
          markers: {
            if (_origin != null) _origin,
            if (_destination != null) _destination
          },
          onLongPress: _addMarker,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.black,
          onPressed: () => _mapController.animateCamera(
              CameraUpdate.newCameraPosition(_initialCameraPosition)),
          child: const Icon(Icons.center_focus_strong),
        ));
  }

  _onMapCreated(GoogleMapController controller) {
    setState(() {
      _mapController = controller;
    });
  }

  _addMarker(LatLng pos) {
    if (_origin == null || (_origin != null && _destination != null)) {
      setState(() {
        _origin = Marker(
          markerId: const MarkerId('origin'),
          infoWindow: const InfoWindow(title: 'Origin'),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          position: pos,
        );
        _destination = null;
        _info = null;
      });
    } else {
      setState(() {
        _destination = Marker(
          markerId: const MarkerId('destination'),
          infoWindow: const InfoWindow(title: 'Destination'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          position: pos,
        );
      });
    }

    // final direcitons = await MapDataProvider
    // .getDirecitons(origin: _origin.position, destination: _destination.position);

    // setState(() => _info = direcitons);
  }

  // _animateToUser() async {
  //   var pos = await location.getLocation();
  //   _mapController.animateCamera(
  //     CameraUpdate.newCameraPosition(CameraPosition(
  //       target: LatLng(pos['latitude'], pos['longitude']),
  //       zoom: 16.0,
  //     )),
  //   );
  // }

}
