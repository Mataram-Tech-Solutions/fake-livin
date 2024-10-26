import 'package:fake_livin/app/modules/home/views/home_view.dart';
import 'package:get/get.dart';

class SplahsScreenController extends GetxController {
  //TODO: Implement SplahsScreenController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    _navigateToNextPage();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

 void _navigateToNextPage() {
  Future.delayed(const Duration(seconds: 5), () {
    print("Navigating to HomeView");
    Get.off(
      () => HomeView(),
      transition: Transition.zoom, // Menggunakan animasi zoom
      duration: const Duration(milliseconds: 1200), // Durasi animasi
    );
  });
  }
}
