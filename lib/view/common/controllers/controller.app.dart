import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/cache/repository.cache.app.dart';

class AppController extends GetxController {
  AppController({required final AppCacheRepository cache}) : _cache = cache;

  final AppCacheRepository _cache;

  @override
  Future<void> onInit() async {
    super.onInit();
    await _initializeTheme;
  }

  final Rx<ThemeMode> themeMode = ThemeMode.system.obs;
  final Rx<MapTheme> mapTheme = MapTheme.standard.obs;

  Future<void> get _initializeTheme async {
    themeMode.value = await _cache.retrieveThemeMode();
    mapTheme.value = await _cache.retrieveMapTheme();
  }

  Future<void> toggleThemeMode() async {
    themeMode.value =
        ThemeMode.values.elementAtOrNull(
          ThemeMode.values.indexOf(themeMode.value) + 1,
        ) ??
        ThemeMode.values.first;

    await Future.delayed(const Duration(milliseconds: 480));
    _rebuildDescendantChildren(Get.context!);

    await _cache.setThemeMode(themeMode.value);
  }

  Future<void> toggleMapTheme() async {
    mapTheme.value =
        MapTheme.values.elementAtOrNull(
          MapTheme.values.indexOf(mapTheme.value) + 1,
        ) ??
        MapTheme.values.first;

    await _cache.setMapTheme(mapTheme.value);
  }

  void _rebuildDescendantChildren(final BuildContext context) {
    void rebuild(final Element el) {
      el
        ..markNeedsBuild()
        ..visitChildren(rebuild);
    }

    (context as Element).visitChildren(rebuild);
  }
}
