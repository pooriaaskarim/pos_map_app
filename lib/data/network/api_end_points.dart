import 'package:latlong2/latlong.dart';

class ApiEndPoints {
  const ApiEndPoints._();

  static const String osmTileProvider =
      'https://tile.openstreetmap.org/{z}/{x}/{y}.png';
  static String searchLocation({
    required final String query,
    final String locale = 'fa',
  }) =>
      'https://nominatim.openstreetmap.org/search?q=$query&format=json&accept-language=$locale';
  static String getAddress({
    required final LatLng location,
    final String locale = 'fa',
  }) =>
      'https://nominatim.openstreetmap.org/reverse?accept-language=$locale&format=json&lat=${location.latitude}&lon=${location.longitude}&addressdetails=1';

  static String getRoute({
    required final LatLng startLocation,
    required final LatLng endLocation,
  }) =>
      'https://router.project-osrm.org/route/v1/driving/${startLocation.latitude},${startLocation.longitude};${endLocation.latitude},${endLocation.longitude}?overview=full&geometries=geojson&steps=false';
}
