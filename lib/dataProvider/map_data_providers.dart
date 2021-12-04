import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:mother_bet/.env.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mother_bet/models/directions.dart';

class MapDataProvider {
  // Get Directions
  late Dio _dio;
  Future<Directions> getDirections(LatLng origin, LatLng destination) async {
    final response = await _dio.get(
      baseUrl,
      queryParameters: {
        'origin': '${origin.latitude}, ${origin.longitude}',
        'destination': '${destination.latitude}, ${destination.longitude}',
        'key': googleAPIKey,
      },
    );

    if (response.statusCode == 200) {
      return Directions.fromMap(response.data);
    }
    final err = jsonDecode(response.data);
    throw new Exception(err["message"]);
  }
}
