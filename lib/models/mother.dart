class Mother {
  final String motherId;
  final List<String> location;
  final String name;
  final String phone;
  final String moto;

  Mother(this.motherId, this.location, this.name, this.phone, this.moto);

  factory Mother.fromJson(Map<String, dynamic> json) {
    return Mother(
      json['mother_id'] as String,
      json['location'] as List<String>,
      json['name'] as String,
      json['phone'] as String,
      json['moto'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mother_id': motherId,
      'location': location,
      'name': name,
      'phone': phone,
      'moto': moto
    };
  }
}
