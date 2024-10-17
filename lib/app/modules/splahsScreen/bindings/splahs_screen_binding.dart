import 'package:get/get.dart';

import '../controllers/splahs_screen_controller.dart';

class SplahsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplahsScreenController>(
      () => SplahsScreenController(),
    );
  }
}
