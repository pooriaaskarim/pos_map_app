import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../../../../utils/utils.dart';
import '../controller/controller.map_widget.dart';
import 'widgets/widget.map.dart';
import 'widgets/widget.map_app.drawer.dart';
import 'widgets/widget.map_bar.dart';
import 'widgets/widget.map_bottom_bar.dart';

class HomeScreen extends GetView<MapWidgetController> {
  const HomeScreen({super.key});

  static const routeName = '/home';
  static const path = '/home';

  @override
  Widget build(final BuildContext context) => SafeArea(
    child: Scaffold(
      resizeToAvoidBottomInset: true,
      endDrawer: const MapAppDrawer(),
      body: ResponsiveUtils.responsiveContent(
        context: context,

        child: Stack(
          children: [
            const MapWidget(),
            MapBar(
              suggestionsPosition: SearchSuggestionPosition.bottom,
              onSuggestionTap: (final item) => controller.mapController.move(
                LatLng(double.parse(item.lat), double.parse(item.lon)),
                15.0,
              ),
            ),
            const MapBottomBar(),
          ],
        ),
      ),
    ),
  );
}
