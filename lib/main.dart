import 'package:flutter/material.dart';

import 'map_app.dart';
import 'view/common/bindings/bindings.app.dart';

void main() {
  AppBindings().dependencies();

  runApp(const MapApp());
}
