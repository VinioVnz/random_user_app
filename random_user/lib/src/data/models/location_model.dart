import 'package:random_user/src/data/models/cordinates_model.dart';
import 'package:random_user/src/data/models/street_model.dart';
import 'package:random_user/src/data/models/timezone_model.dart';

class LocationModel {
  final StreetModel street;
  final String city;
  final String state;
  final String country;
  final dynamic postcode;
  final CoordinatesModel coordinates;
  final TimezoneModel timezone;

  LocationModel({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.coordinates,
    required this.timezone,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      street: StreetModel.fromJson(json['street']),
      city: json['city'],
      state: json['state'],
      country: json['country'],
      postcode: json['postcode'],
      coordinates: CoordinatesModel.fromJson(json['coordinates']),
      timezone: TimezoneModel.fromJson(json['timezone']),
    );
  }

  Map<String, dynamic> toJson() => {
        'street': street.toJson(),
        'city': city,
        'state': state,
        'country': country,
        'postcode': postcode,
        'coordinates': coordinates.toJson(),
        'timezone': timezone.toJson(),
      };
}
