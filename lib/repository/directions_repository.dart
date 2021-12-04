import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mother_bet/dataProvider/map_data_providers.dart';
import 'package:mother_bet/models/directions.dart';

class DirectionsRepository {
  late MapDataProvider _dataProvider;

  Future<Directions> getDirections(LatLng origin, LatLng destination) async {
    return this._dataProvider.getDirections(origin, destination);
  }
}
