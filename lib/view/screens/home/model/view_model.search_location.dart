class LocationSearchModel {
  LocationSearchModel({
    required this.placeId,
    required this.licence,
    required this.osmType,
    required this.osmId,
    required this.lat,
    required this.lon,
    required this.locationClass,
    required this.type,
    required this.placeRank,
    required this.importance,
    required this.addressType,
    required this.name,
    required this.displayName,
  });

  factory LocationSearchModel.fromJson(final Map<String, dynamic> json) =>
      LocationSearchModel(
        placeId: json['place_id'],
        licence: json['licence'],
        osmType: json['osm_type'],
        osmId: json['osm_id'],
        lat: json['lat'],
        lon: json['lon'],
        locationClass: json['class'],
        type: json['type'],
        placeRank: json['place_rank'],
        importance: json['importance'],
        addressType: json['addresstype'],
        name: json['name'],
        displayName: json['display_name'],
      );

  final num placeId;
  final String? licence;
  final String? osmType;
  final num? osmId;
  final String lat;
  final String lon;
  final String? locationClass;
  final String? type;
  final num? placeRank;
  final num? importance;
  final String? addressType;
  final String name;
  final String displayName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['place_id'] = placeId;
    map['licence'] = licence;
    map['osm_type'] = osmType;
    map['osm_id'] = osmId;
    map['lat'] = lat;
    map['lon'] = lon;
    map['class'] = locationClass;
    map['type'] = type;
    map['place_rank'] = placeRank;
    map['importance'] = importance;
    map['addresstype'] = addressType;
    map['name'] = name;
    map['display_name'] = displayName;
    return map;
  }
}
