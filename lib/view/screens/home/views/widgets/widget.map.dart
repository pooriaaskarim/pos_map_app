import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../../../../../data/network/api_end_points.dart';
import '../../../../../utils/utils.dart';

import '../../../../common/controllers/controller.app.dart';
import '../../../../common/widgets/api_status_builder.dart';
import '../../../../common/widgets/app.text.dart';
import '../../controller/controller.map_widget.dart';

class MapWidget extends GetView<MapWidgetController> {
  const MapWidget({super.key});

  @override
  Widget build(final BuildContext context) {
    final themeData = Theme.of(context);

    return Obx(
      () => FlutterMap(
        mapController: controller.mapController,
        options: MapOptions(
          initialCenter: controller.defaultLocation,
          initialZoom: controller.defaultZoom,
          backgroundColor: themeData.colorScheme.surface,
          onTap: (final _, final point) => controller.toggleFullScreen(),
          onLongPress: (final tapPosition, final point) {
            _showPopupMenu(context, tapPosition, point);
          },
        ),
        children: [
          TileLayer(
            urlTemplate: ApiEndPoints.osmTileProvider,
            userAgentPackageName: 'com.example.pos_map_app',
            retinaMode: true,
            tileBuilder: Get.find<AppController>().mapTheme.value.tileBuilder,
          ),
          MarkerLayer(
            markers: [
              if (controller.startLocation.value != null)
                Marker(
                  alignment: Alignment.topCenter,
                  rotate: true,
                  point: controller.startLocation.value!,
                  child: const Icon(
                    Icons.location_on_rounded,
                    color: Colors.blueAccent,
                    size: AppSizes.points_40,
                  ),
                ),
              if (controller.endLocation.value != null)
                Marker(
                  alignment: Alignment.topCenter,
                  point: controller.endLocation.value!,
                  rotate: true,
                  child: const Icon(
                    Icons.my_location_sharp,
                    color: Colors.redAccent,
                    size: AppSizes.points_40,
                  ),
                ),
            ],
          ),
          CircleLayer(
            circles: [
              if (controller.userLocation.value != null)
                CircleMarker(
                  point: controller.userLocation.value!,
                  radius: AppSizes.points_8,
                  color: Colors.blue,
                  borderColor: themeData.colorScheme.onSurface,
                  borderStrokeWidth: 5,
                ),
            ],
          ),

          if (controller.startLocation.value != null &&
              controller.endLocation.value != null)
            ApiStatusBuilder(
              onRetry: controller.getRoute,
              apiStatus: controller.getRouteStatus,
              onSuccess: (final route) => PolylineLayer(
                polylines: [
                  Polyline(
                    color: Colors.blueAccent,
                    strokeWidth: 3,
                    points: [
                      controller.startLocation.value!,
                      ...route.routes.first.geometry.coordinates.map(
                        (final e) => LatLng(e.first, e.last),
                      ),

                      controller.endLocation.value!,
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _showPopupMenu(
    final BuildContext context,
    final TapPosition tapPosition,
    final LatLng point,
  ) async {
    final RenderBox? overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox?;

    if (overlay == null) {
      return;
    }
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(tapPosition.global, tapPosition.global),
      Offset.zero & overlay.size,
    );

    final String? selected = await showMenu<String>(
      context: context,
      position: position,
      items: [
        PopupMenuItem<String>(
          value: 'startLocation',
          child: AppText.bodyMedium('انتخاب به عنوان مبداء'),
        ),
        PopupMenuItem<String>(
          value: 'endLocation',
          child: AppText.bodyMedium('انتخاب به عنوان مقصد'),
        ),
      ],
      elevation: 8.0,
    );

    // Handle the selected value here (your logic)
    if (selected != null) {
      if (selected == 'startLocation') {
        controller.startLocation(point);
      } else if (selected == 'endLocation') {
        controller.endLocation(point);
      }
    }
  }
}
