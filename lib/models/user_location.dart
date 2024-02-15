class UserLocation {
  final String city;
  final String state;
  final String country;
  final String postcode;
  final LocationStreet street;
  final LocationCorrdinate corrdinate;

  final LocationTimezoneCorrdinate timezone;
  UserLocation({
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.street,
    required this.corrdinate,
    required this.timezone,
  });
  factory UserLocation.fromMap(Map<String, dynamic> json) {
    // ignore: non_constant_identifier_names
    final Coordinates = LocationCorrdinate.fromMap(json['coordinates']);
    final street = LocationStreet.formMap(json['street']);
    final timezone = LocationTimezoneCorrdinate.fromMap(json['timezone']);
    return UserLocation(
        state: json['state'],
        country: json['country'],
        city: json['city'],
        postcode: json['postcode'].toString(),
        street: street,
        corrdinate: Coordinates,
        timezone: timezone);
  }
}

class LocationStreet {
  final int number;
  final String name;
  LocationStreet({
    required this.name,
    required this.number,
  });
  factory LocationStreet.formMap(Map<String, dynamic> json) {
    return LocationStreet(name: json['name'], number: json['number']);
  }
}

class LocationCorrdinate {
  final String latitude;
  final String longitude;
  LocationCorrdinate({required this.latitude, required this.longitude});
  factory LocationCorrdinate.fromMap(Map<String, dynamic> json) {
    return LocationCorrdinate(
        latitude: json['latitude'], longitude: json['longitude']);
  }
}

class LocationTimezoneCorrdinate {
  final String offset;
  final String description;
  LocationTimezoneCorrdinate({required this.offset, required this.description});
  factory LocationTimezoneCorrdinate.fromMap(Map<String, dynamic> json) {
    return LocationTimezoneCorrdinate(
        offset: json['offset'], description: json['description']);
  }
}
