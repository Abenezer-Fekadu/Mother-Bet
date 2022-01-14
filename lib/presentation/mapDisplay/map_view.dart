import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mother_bet/bloc/foodBloc/foods_bloc.dart';

class MapScreen extends StatefulWidget {
  static const String routeName = '/search';

  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(8.9806, 38.7578),
    zoom: 9,
  );

  Location location = Location();
  late GoogleMapController _mapController;
  dynamic _origin;
  dynamic _destination;
  dynamic _info;

  Set<Marker> markers = HashSet<Marker>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Maps",
          style: TextStyle(color: Color(0XFF2C2C2C), fontSize: 25),
        ),
        actions: [
          // if (_origin != null)
          TextButton(
            onPressed: () => _mapController.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(target: _origin, zoom: 14, tilt: 50.0),
              ),
            ),
            child: const Icon(Icons.search),
          ),
          // if (_destination != null)
          //   TextButton(
          //     onPressed: () => _mapController.animateCamera(
          //       CameraUpdate.newCameraPosition(
          //         CameraPosition(target: _destination, zoom: 14, tilt: 50.0),
          //       ),
          //     ),
          //     style: TextButton.styleFrom(
          //       primary: Colors.blue,
          //       textStyle: const TextStyle(fontWeight: FontWeight.w600),
          //     ),
          //     child: const Text("ORIGIN"),
          //   )
        ],
      ),
      body: BlocBuilder<FoodsBloc, FoodsState>(
        builder: (context, state) {
          if (state is MothersSuccess) {
            final mothers = state.mothers;
            mothers.forEach((mother) => {
                  Marker(
                    markerId: MarkerId(mother.motherId),
                    position: LatLng(mother.location.coordinates[0],
                        mother.location.coordinates[1]), //position of marker
                    infoWindow: InfoWindow(
                      title: mother.name,
                      snippet: mother.motto,
                    ),
                    icon: BitmapDescriptor.defaultMarker,
                    onTap: () => showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return DraggableScrollableSheet(
                            initialChildSize: 0.5,
                            maxChildSize: 1,
                            minChildSize: 0.25,
                            builder: (BuildContext context,
                                ScrollController scrollController) {
                              return Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                child: ListView.builder(
                                  controller: scrollController,
                                  itemCount: 25,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return ListTile(title: Text('Item $index'));
                                  },
                                ),
                              );
                            },
                          );
                        } //Icon for Marker
                        ),
                  )
                });

            return GoogleMap(
              initialCameraPosition: _initialCameraPosition,
              zoomControlsEnabled: false,
              myLocationEnabled: true,
              onMapCreated: _onMapCreated,
              markers: markers,
            );
          }
          return GoogleMap(
            initialCameraPosition: _initialCameraPosition,
            zoomControlsEnabled: false,
            myLocationEnabled: true,
            onMapCreated: _onMapCreated,
            markers: {
              Marker(
                markerId: const MarkerId('origin'),
                infoWindow: const InfoWindow(title: 'Origin'),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueGreen),
                position: const LatLng(8.9806, 38.7578),
                onTap: () => showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return DraggableScrollableSheet(
                        maxChildSize: 0.5,
                        minChildSize: 0.1,
                        builder: (BuildContext context,
                            ScrollController scrollController) {
                          return Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            child: _list(),
                          );
                        },
                      );
                    } //Icon for Marker
                    ),
              )
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.black,
        onPressed: () => _mapController.animateCamera(
            CameraUpdate.newCameraPosition(_initialCameraPosition)),
        child: const Icon(Icons.center_focus_strong),
      ),
    );
  }

  _onMapCreated(GoogleMapController controller) {
    setState(() {
      _mapController = controller;
    });
  }

  Widget _list() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.photo),
          title: Text('Photo'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.music_note),
          title: Text('Music'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.videocam),
          title: Text('Video'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.share),
          title: Text('Share'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
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
  }
}
