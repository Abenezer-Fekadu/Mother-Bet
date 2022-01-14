import 'package:mother_bet/models/food.dart';

class Mother {
  final String motherId;
  final Location location;
  final String name;
  final String phone;
  final String moto;
  final Food foods;

  Mother(this.motherId, this.location, this.name, this.phone, this.moto,
      this.foods);

  factory Mother.fromJson(Map<String, dynamic> json) {
    return Mother(
      json['_id'] as String,
      json['location'] as Location,
      json['name'] as String,
      json['phone'] as String,
      json['moto'] as String,
      json['foods'] as Food,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': motherId,
      'location': location,
      'name': name,
      'phone': phone,
      'moto': moto,
      'foods': foods
    };
  }
}

class Location {
  final String type;
  final List<dynamic> coordinates;
  Location(
    this.type,
    this.coordinates,
  );
  factory Location.fromJson(Map<String, dynamic> json) =>
      Location(json["type"], json["coordinates"]);

  Map<String, dynamic> toJson() => {
        "type": type,
        "coordinates": coordinates,
      };
}
