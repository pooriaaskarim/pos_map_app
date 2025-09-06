import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:latlong2/latlong.dart';

import '../../../../../../../data/network/app_http_client.dart';
import '../../../../../../../utils/api_status/entity.failure.dart';
import '../../../../data/network/api_end_points.dart';
import '../model/model.route.dart';
import '../model/view_model.search_location.dart';

class MapWidgetRepository {
  final AppHttpClient _appHttpClient = AppHttpClient();

  Future<Either<FailureEntity, String>> getAddressFor(
    final LatLng location, {
    final String locale = 'fa',
  }) async {
    final result = await _appHttpClient.get(
      ApiEndPoints.getAddress(location: location, locale: locale),
    );

    return result.fold(Left.new, (final r) => Right(r.data['display_name']));
  }

  Future<Either<FailureEntity, List<LocationSearchModel>>> searchLocation(
    final String searchString, {
    final String locale = 'fa',
  }) async {
    final result = await _appHttpClient.get(
      ApiEndPoints.searchLocation(query: searchString, locale: locale),
    );

    return result.fold(Left.new, (final r) {
      final List<LocationSearchModel> list = [];
      if (r.data is List) {
        list.addAll(
          (r.data as List<dynamic>).map(
            (final e) => LocationSearchModel.fromJson(e),
          ),
        );
      } else {
        list.add(LocationSearchModel.fromJson(r.data));
      }
      return Right(list);
    });
  }

  Future<Either<FailureEntity, RouteResponseModel>> getRoute(
    final LatLng startLocation,
    final LatLng endLocation,
  ) async {
    final result = await _appHttpClient.get(
      ApiEndPoints.getRoute(
        startLocation: startLocation,
        endLocation: endLocation,
      ),
    );

    return result.fold(
      Left.new,
      (final r) => Right(RouteResponseModel.fromJson(r.data)),
    );
  }
}
