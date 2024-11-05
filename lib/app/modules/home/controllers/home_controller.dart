import 'package:fake_livin/app/modules/preview/controllers/preview_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  var selectedDateTime = ''.obs; // Reactive variable untuk menyimpan tanggal dan waktu
  var ref = ''.obs;
  var ANrek = ''.obs;
  var nobn = ''.obs;
  var curr = ''.obs;
  var ANrektu = ''.obs;
  var bank = ''.obs;
  var nobntu = ''.obs;
  var currtu = ''.obs;
  var jutf = ''.obs;
  var bitf = ''.obs;
  var norefpe = ''.obs;
  var deskripsi = ''.obs;

  final TextEditingController selectedDateTimeController = TextEditingController();
  final TextEditingController refController = TextEditingController();
  final TextEditingController ANrekController = TextEditingController();
  final TextEditingController nobnController = TextEditingController();
  final TextEditingController currController = TextEditingController();
  final TextEditingController ANrektuController = TextEditingController();
  final TextEditingController bankController = TextEditingController();
  final TextEditingController nobntuController = TextEditingController();
  final TextEditingController currtuController = TextEditingController();
  final TextEditingController jutfController = TextEditingController();
  final TextEditingController bitfController = TextEditingController();
  final TextEditingController norefpeController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();


  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    Get.lazyPut(() => PreviewController()); // Menginisialisasi PreviewController


    // Sinkronkan TextEditingController dengan nilai awal
    selectedDateTimeController.text = selectedDateTime.value;

    // Update TextEditingController ketika selectedDateTime berubah
    ever(selectedDateTime, (value) {
      selectedDateTimeController.text = value;
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
 void onClose() {
    selectedDateTimeController.dispose(); // Jangan lupa untuk dispose controller
    refController.dispose(); // Jangan lupa untuk dispose controller
    ANrekController.dispose(); // Jangan lupa untuk dispose controller
    nobnController.dispose(); // Jangan lupa untuk dispose controller
    currController.dispose(); // Jangan lupa untuk dispose controller
    ANrektuController.dispose(); // Jangan lupa untuk dispose controller
    bankController.dispose(); // Jangan lupa untuk dispose controller
    nobntuController.dispose(); // Jangan lupa untuk dispose controller
    currtuController.dispose(); // Jangan lupa untuk dispose controller
    jutfController.dispose(); // Jangan lupa untuk dispose controller
    bitfController.dispose(); // Jangan lupa untuk dispose controller
    norefpeController.dispose(); // Jangan lupa untuk dispose controller
    deskripsiController.dispose(); // Jangan lupa untuk dispose controller
    super.onClose();
  }

  void increment() => count.value++;
 void updateDateTime(String dateTime) {
    selectedDateTime.value = dateTime;
  }

  void updateFormData() {
    ref.value = refController.text.isEmpty ? "-" : refController.text;
    ANrek.value = ANrekController.text.isEmpty ? "-" : ANrekController.text;
    nobn.value = nobnController.text.isEmpty ? "-" : nobnController.text;
    curr.value = currController.text.isEmpty ? "-" : currController.text;
    ANrektu.value = ANrektuController.text.isEmpty ? "-" : ANrektuController.text;
    bank.value = bankController.text.isEmpty ? "-" : bankController.text;
    nobntu.value = nobntuController.text.isEmpty ? "-" : nobntuController.text;
    currtu.value = currtuController.text.isEmpty ? "-" : currtuController.text;
    jutf.value = jutfController.text.isEmpty ? "-" : jutfController.text;
    bitf.value = bitfController.text.isEmpty ? "-" : bitfController.text;
    norefpe.value = norefpeController.text.isEmpty ? "-" : norefpeController.text;
    deskripsi.value = deskripsiController.text.isEmpty ? "-" : deskripsiController.text;
  }

    void sendDataToPreview() {
       updateFormData(); // Update nilai field sebelum mengirim

    if (!Get.isRegistered<PreviewController>()) {
    Get.put(PreviewController()); // Memastikan PreviewController terdaftar
  }
  
  Get.find<PreviewController>().setPreviewData({
      'dttm': selectedDateTime.value,
      'dttmori': selectedDateTime.value,
      'ref': ref.value,
      'ANrek': ANrek.value,
      'nobn': nobn.value,
      'curr': curr.value,
      'ANrektu': ANrektu.value,
      'bank': bank.value,
      'nobntu': nobntu.value,
      'currtu': currtu.value,
      'jutf': jutf.value,
      'bitf': bitf.value,
      'norefpe': norefpe.value,
      'deskripsi': deskripsi.value
      // Tambahkan field lain di sini

      
    });

      // Cetak data ke konsol sebagai contoh
      print("Data yang dikirim ke Preview:");
      print("Tanggal/Waktu: ${selectedDateTime.value}");
      print("Reference: ${ref.value}");
      print("Asal Rekening: ${ANrek.value}");
      print("No BN: ${nobn.value}");
  }

}

