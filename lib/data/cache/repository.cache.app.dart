import 'dart:async';

import 'package:flutter/material.dart';

import 'i.repository.cache.dart';

const String _themeModeKey = 'themeMode';

class AppCacheRepository extends CacheRepository {
  AppCacheRepository();

  @override
  @protected
  String get instanceName => 'Settings';

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
}
