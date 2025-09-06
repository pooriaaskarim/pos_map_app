import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'i.repository.cache.dart';

const String _themeModeKey = 'themeMode';
const String _mapThemeKey = 'mapTheme';

class AppCacheRepository extends CacheRepository {
  AppCacheRepository();

  @override
  @protected
  String get instanceName => 'Cache';

  Future<ThemeMode> retrieveThemeMode() async {
    final db = await open();
    final String? value = db.get(_themeModeKey);

    switch (value) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  Future<void> setThemeMode(final ThemeMode themeMode) async {
    final db = await open();
    await db.put(_themeModeKey, themeMode.name);
  }

  Future<MapTheme> retrieveMapTheme() async {
    final db = await open();
    final String? value = db.get(_mapThemeKey);

    return MapTheme.resolve(value ?? 'standard');
  }

  Future<void> setMapTheme(final MapTheme mapTheme) async {
    final db = await open();
    await db.put(_mapThemeKey, mapTheme.name);
  }
}

enum MapTheme {
  standard,
  dark,
  inverted;

  static MapTheme resolve(final String name) => switch (name) {
    'standard' => standard,
    'dark' => dark,
    'inverted' => inverted,
    _ => standard,
  };

  String get faName => switch (this) {
    standard => 'استاندارد',
    dark => 'تیره',
    inverted => 'اینورت شده',
  };

  TileBuilder? get tileBuilder => switch (this) {
    standard => null,
    dark =>
      (
        final BuildContext context,
        final Widget tileWidget,
        final TileImage tile,
      ) => ColorFiltered(
        colorFilter: const ColorFilter.matrix(<double>[
          -0.2126, -0.7152, -0.0722, 0, 255, // R
          -0.2126, -0.7152, -0.0722, 0, 255, // G
          -0.2126, -0.7152, -0.0722, 0, 255, // B
          0, 0, 0, 1, 0, // A
        ]),
        child: tileWidget,
      ),
    inverted => darkModeTileBuilder,
  };
}
