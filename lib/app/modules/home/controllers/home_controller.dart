import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  var selectedDateTime = ''.obs; // Reactive variable untuk menyimpan tanggal dan waktu

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
  void updateDateTime(String dateTime) {
    selectedDateTime.value = dateTime;
  }
}

