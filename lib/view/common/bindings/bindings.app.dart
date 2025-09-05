import 'package:get/get.dart';

import '../../../data/cache/repository.cache.app.dart';
import '../controllers/controller.app.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(() => AppCacheRepository())
      ..lazyPut(() => AppController(cache: Get.find<AppCacheRepository>()));
  }
}
