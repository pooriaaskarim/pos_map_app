import 'package:get/get.dart';

import '../controller/controller.map_widget.dart';
import '../repository/repository.map_widget.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(() => MapWidgetRepository())
      ..lazyPut(
        () => MapWidgetController(repository: Get.find<MapWidgetRepository>()),
      );
  }
}
