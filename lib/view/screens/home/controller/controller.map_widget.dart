import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../../../../utils/api_status/api_status.dart';
import '../../../../utils/api_status/entity.failure.dart';
import '../model/model.route.dart';
import '../model/model.route.dart';
import '../model/view_model.search_location.dart';
import '../repository/repository.map_widget.dart';
import '../views/dialogs/dialog.request_location_permissions.dart';

class MapWidgetController extends GetxController {
  MapWidgetController({required final MapWidgetRepository repository})
    : _repository = repository;
  final MapWidgetRepository _repository;

  final mapController = MapController();

  final RxBool isFullScreen = false.obs;

  void toggleFullScreen() {
    isFullScreen.value = !isFullScreen.value;
  }

  @override
  void onInit() {
    super.onInit();
    retrieveUserLocation();
    startLocation.stream.listen((final selectedStartLocation) {
      if (selectedStartLocation != null) {
        getStartAddress();
        getRoute();
      } else {
        getStartAddressStatus.value = const ApiStatus.idle();
      }
    });
    endLocation.stream.listen((final selectedEndLocation) {
      if (selectedEndLocation != null) {
        getEndAddress();
        getRoute();
      } else {
        getEndAddressStatus.value = const ApiStatus.idle();
      }
    });
  }

  final Rxn<LatLng> startLocation = Rxn();

  final Rxn<LatLng> endLocation = Rxn();
  final Rxn<LatLng> userLocation = Rxn();
  final defaultZoom = 15.0;
  final LatLng defaultLocation = const LatLng(29.6100, 52.5425);

  RxBool isRetrievingUserLocation = false.obs;
  Future<void> retrieveUserLocation() async {
    final permissionStatus = await Permission.location.status;
    if (!permissionStatus.isGranted) {
      final agreedToRequest = await showDialog<bool?>(
        context: Get.context!,
        builder: (final context) => const RequestLocationPermissionsDialog(),
      );
      if (agreedToRequest ?? false) {
        final acquiredPermission = await Permission.location.request();
        if (!acquiredPermission.isGranted) {
          mapController.move(defaultLocation, defaultZoom);
          return;
        } else {
          await retrieveUserLocation();
        }
      }
    } else {
      isRetrievingUserLocation.value = true;
      final usersPosition = await Geolocator.getCurrentPosition(
        locationSettings: AndroidSettings(accuracy: LocationAccuracy.best),
      );
      userLocation.value = LatLng(
        usersPosition.latitude,
        usersPosition.longitude,
      );
      mapController.move(userLocation.value!, defaultZoom);
      isRetrievingUserLocation.value = false;
    }
  }

  final Rx<ApiStatus<String>> getStartAddressStatus =
      const ApiStatus<String>.idle().obs;
  final Rx<ApiStatus<String>> getEndAddressStatus =
      const ApiStatus<String>.idle().obs;

  Future<void> getStartAddress() async {
    getStartAddressStatus.value = const ApiStatus.loading();
    final failureOrResult = await _getAddressFor(startLocation.value!);
    failureOrResult.fold(
      (final l) {
        getStartAddressStatus.value = ApiStatus.failure(l);
      },
      (final r) {
        getStartAddressStatus.value = ApiStatus.success(r);
      },
    );
  }

  Future<void> getEndAddress() async {
    getEndAddressStatus.value = const ApiStatus.loading();
    final failureOrResult = await _getAddressFor(endLocation.value!);
    failureOrResult.fold(
      (final l) {
        getEndAddressStatus.value = ApiStatus.failure(l);
      },
      (final r) {
        getEndAddressStatus.value = ApiStatus.success(r);
      },
    );
  }

  Future<Either<FailureEntity, String>> _getAddressFor(
    final LatLng location, {
    final String locale = 'fa',
  }) => _repository.getAddressFor(location, locale: locale);

  final Rx<ApiStatus<RouteResponseModel>> getRouteStatus =
      const ApiStatus<RouteResponseModel>.idle().obs;
  Future<void> getRoute() async {
    if (startLocation.value == null || endLocation.value == null) {
      return;
    }
    getRouteStatus.value = const ApiStatus.loading();
    final failureOrResult = await _repository.getRoute(
      startLocation.value!,
      endLocation.value!,
    );
    failureOrResult.fold(
      (final l) {
        getRouteStatus.value = ApiStatus.failure(l);
      },
      (final r) {
        getRouteStatus.value = ApiStatus.success(r);
      },
    );
  }

  final Rx<ApiStatus<List<LocationSearchModel>>> searchLocationStatus =
      const ApiStatus<List<LocationSearchModel>>.idle().obs;
  Future<void> searchLocation(
    final String searchString, {
    final String locale = 'fa',
  }) async {
    searchLocationStatus.value = const ApiStatus.loading();
    final failureOrResult = await _repository.searchLocation(
      searchString,
      locale: locale,
    );
    failureOrResult.fold(
      (final l) {
        searchLocationStatus.value = ApiStatus.failure(l);
      },
      (final r) {
        searchLocationStatus.value = ApiStatus.success(r);
      },
    );
  }

  void clearSearchResults() {
    searchLocationStatus.value = const ApiStatus.idle();
  }
}
