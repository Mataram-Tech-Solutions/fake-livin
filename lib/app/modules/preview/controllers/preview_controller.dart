import 'package:get/get.dart';

class PreviewController extends GetxController {
  //TODO: Implement PreviewController
  var dttm = ''.obs;
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
  void setPreviewData(Map<String, String> data) {
    dttm.value = data['dttm'] ?? '-';
    ref.value = data['ref'] ?? '-';
    ANrek.value = data['ANrek'] ?? '-';
    nobn.value = data['nobn'] ?? '-';
    curr.value = data['curr'] ?? '-';
    ANrektu.value = data['ANrektu'] ?? '-';
    bank.value = data['bank'] ?? '-';
    nobntu.value = data['nobntu'] ?? '-';
    currtu.value = data['currtu'] ?? '-';
    jutf.value = data['jutf'] ?? '-';
    bitf.value = data['bitf'] ?? '-';
    norefpe.value = data['norefpe'] ?? '-';
    deskripsi.value = data['deskripsi'] ?? '-';

    print("Tanggal/Waktu di preview: ${dttm.value}");
    print("ref di preview: ${ref.value}");
    print("anrek di preview: ${ANrek.value}");
    print("nobn di preview: ${nobn.value}");
    print("curr di preview: ${curr.value}");
    print("anrektu di preview: ${ANrektu.value}");
    print("bank di preview: ${bank.value}");
    print("nobntu di preview: ${nobntu.value}");
    print("currtu di preview: ${currtu.value}");
    print("juftu di preview: ${jutf.value}");
    print("bitf di preview: ${bitf.value}");
    print("norefpe di preview: ${norefpe.value}");
    print("deskripsi di preview: ${deskripsi.value}");

  }
}
