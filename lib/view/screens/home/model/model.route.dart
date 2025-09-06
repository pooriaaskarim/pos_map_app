class RouteResponseModel {
  RouteResponseModel({
    required this.code,
    required this.routes,
    required this.waypoints,
  });

  factory RouteResponseModel.fromJson(final Map<String, dynamic> json) =>
      RouteResponseModel(
        code: json['code'],
        routes: (json['routes'] as List)
            .map((final e) => RouteModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        waypoints: (json['waypoints'] as List)
            .map((final e) => WaypointModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  final String code;
  final List<RouteModel> routes;
  final List<WaypointModel> waypoints;

  Map<String, dynamic> toJson() => {
    'code': code,
    'routes': routes.map((final e) => e.toJson()).toList(),
    'waypoints': waypoints.map((final e) => e.toJson()).toList(),
  };
}

class RouteModel {
  RouteModel({
    required this.legs,
    required this.weightName,
    required this.geometry,
    required this.weight,
    required this.duration,
    required this.distance,
  });

  factory RouteModel.fromJson(final Map<String, dynamic> json) => RouteModel(
    legs: (json['legs'] as List)
        .map((final e) => LegModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    weightName: json['weight_name'],
    geometry: GeometryModel.fromJson(json['geometry'] as Map<String, dynamic>),
    weight: (json['weight'] as num).toDouble(),
    duration: (json['duration'] as num).toDouble(),
    distance: (json['distance'] as num).toDouble(),
  );

  final List<LegModel> legs;
  final String weightName;
  final GeometryModel geometry;
  final double weight;
  final double duration;
  final double distance;

  Map<String, dynamic> toJson() => {
    'legs': legs.map((final e) => e.toJson()).toList(),
    'weight_name': weightName,
    'geometry': geometry.toJson(),
    'weight': weight,
    'duration': duration,
    'distance': distance,
  };
}

class LegModel {
  LegModel({
    required this.steps,
    required this.weight,
    required this.summary,
    required this.duration,
    required this.distance,
  });

  factory LegModel.fromJson(final Map<String, dynamic> json) => LegModel(
    steps: (json['steps'] as List)
        .map((final e) => StepModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    weight: (json['weight'] as num).toDouble(),
    summary: json['summary'] ?? '',
    duration: (json['duration'] as num).toDouble(),
    distance: (json['distance'] as num).toDouble(),
  );

  final List<StepModel> steps;
  final double weight;
  final String summary;
  final double duration;
  final double distance;

  Map<String, dynamic> toJson() => {
    'steps': steps.map((final e) => e.toJson()).toList(),
    'weight': weight,
    'summary': summary,
    'duration': duration,
    'distance': distance,
  };
}

class StepModel {
  StepModel({
    required this.geometry,
    required this.maneuver,
    required this.mode,
    required this.drivingSide,
    required this.name,
    required this.intersections,
    required this.weight,
    required this.duration,
    required this.distance,
  });

  factory StepModel.fromJson(final Map<String, dynamic> json) => StepModel(
    geometry: json['geometry'],
    maneuver: ManeuverModel.fromJson(json['maneuver'] as Map<String, dynamic>),
    mode: json['mode'],
    drivingSide: json['driving_side'],
    name: json['name'],
    intersections: (json['intersections'] as List)
        .map((final e) => IntersectionModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    weight: (json['weight'] as num).toDouble(),
    duration: (json['duration'] as num).toDouble(),
    distance: (json['distance'] as num).toDouble(),
  );

  final String geometry;
  final ManeuverModel maneuver;
  final String mode;
  final String drivingSide;
  final String name;
  final List<IntersectionModel> intersections;
  final double weight;
  final double duration;
  final double distance;

  Map<String, dynamic> toJson() => {
    'geometry': geometry,
    'maneuver': maneuver.toJson(),
    'mode': mode,
    'driving_side': drivingSide,
    'name': name,
    'intersections': intersections.map((final e) => e.toJson()).toList(),
    'weight': weight,
    'duration': duration,
    'distance': distance,
  };
}

class ManeuverModel {
  ManeuverModel({
    required this.bearingAfter,
    required this.bearingBefore,
    required this.location,
    required this.type,
    this.modifier,
  });

  factory ManeuverModel.fromJson(final Map<String, dynamic> json) =>
      ManeuverModel(
        bearingAfter: json['bearing_after'] as int,
        bearingBefore: json['bearing_before'] as int,
        location: (json['location'] as List)
            .map((final e) => (e as num).toDouble())
            .toList(),
        modifier: json['modifier'],
        type: json['type'],
      );

  final int bearingAfter;
  final int bearingBefore;
  final List<double> location;
  final String? modifier;
  final String type;

  Map<String, dynamic> toJson() => {
    'bearing_after': bearingAfter,
    'bearing_before': bearingBefore,
    'location': location,
    'modifier': modifier,
    'type': type,
  };
}

class IntersectionModel {
  IntersectionModel({
    this.bearings,
    this.lanes,
    this.outIndex,
    this.inIndex,
    this.entry,
    this.location,
    this.classes,
  });

  factory IntersectionModel.fromJson(final Map<String, dynamic> json) =>
      IntersectionModel(
        bearings: (json['bearings'] as List?)?.cast<int>(),
        lanes: (json['lanes'] as List?)
            ?.map((final e) => LaneModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        outIndex: json['out'] as int?,
        inIndex: json['in'] as int?,
        entry: (json['entry'] as List?)?.cast<String>(),
        location: (json['location'] as List?)
            ?.map((final e) => (e as num).toDouble())
            .toList(),
        classes: (json['classes'] as List?)?.cast<String>(),
      );

  final List<int>? bearings;
  final List<LaneModel>? lanes;
  final int? outIndex;
  final int? inIndex;
  final List<String>? entry;
  final List<double>? location;
  final List<String>? classes;

  Map<String, dynamic> toJson() => {
    'bearings': bearings,
    'lanes': lanes?.map((final e) => e.toJson()).toList(),
    'out': outIndex,
    'in': inIndex,
    'entry': entry,
    'location': location,
    'classes': classes,
  };
}

class LaneModel {
  LaneModel({required this.indications, required this.valid});

  factory LaneModel.fromJson(final Map<String, dynamic> json) => LaneModel(
    indications: (json['indications'] as List).cast<String>(),
    valid: json['valid'],
  );

  final List<String> indications;
  final String valid;

  Map<String, dynamic> toJson() => {'indications': indications, 'valid': valid};
}

class WaypointModel {
  WaypointModel({
    required this.hint,
    required this.location,
    required this.name,
    required this.distance,
  });

  factory WaypointModel.fromJson(final Map<String, dynamic> json) =>
      WaypointModel(
        hint: json['hint'],
        location: (json['location'] as List)
            .map((final e) => (e as num).toDouble())
            .toList(),
        name: json['name'],
        distance: (json['distance'] as num).toDouble(),
      );

  final String hint;
  final List<double> location;
  final String name;
  final double distance;

  Map<String, dynamic> toJson() => {
    'hint': hint,
    'location': location,
    'name': name,
    'distance': distance,
  };
}

class GeometryModel {
  GeometryModel({required this.coordinates, required this.type});

  factory GeometryModel.fromJson(final Map<String, dynamic> json) =>
      GeometryModel(
        coordinates: (json['coordinates'] as List)
            .map(
              (final e) => (e as List<dynamic>)
                  .map((final v) => (v as num).toDouble())
                  .toList(),
            )
            .toList(),
        type: json['type'] as String,
      );

  final List<List<double>> coordinates;
  final String type;

  Map<String, dynamic> toJson() => {
    'coordinates': coordinates.map((final e) => e).toList(),
    'type': type,
  };
}
