import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PreviewController extends GetxController {
  //TODO: Implement PreviewController
  var dttm = ''.obs;
  var dttmori = ''.obs;
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
    String? originalDateTime = data['dttm'];

    // Format default jika nilai asli tidak ada atau tidak sesuai
    dttm.value = '-';

    if (originalDateTime != null && originalDateTime.isNotEmpty) {
        try {
            // Parsing tanggal/waktu dari string 'DD/MM/YY H:I:S'
            DateTime parsedDate = DateFormat('dd/MM/yy H:m:s').parse(originalDateTime);

            // Format ulang ke 'YYMMDD'
            dttm.value = DateFormat('yyyyMMdd').format(parsedDate);
        } catch (e) {
            print("Error parsing date: $e");
            // Tanggal tetap '-' jika ada kesalahan parsing
        }
    }
    
    dttmori.value = data['dttm'] ?? '-';
    ref.value = data['ref'] ?? '-';
    ANrek.value = data['ANrek'] ?? '-';
    nobn.value = data['nobn'] ?? '-';
    curr.value = data['curr'] ?? '-';
    ANrektu.value = data['ANrektu'] ?? '-';
    bank.value = data['bank'] ?? '-';
    nobntu.value = data['nobntu'] ?? '-';
    currtu.value = data['currtu'] ?? '-';

    // Format bitf dan jutf sebagai mata uang rupiah
    bitf.value = _formatCurrency(data['bitf'] ?? '-');
    jutf.value = _formatCurrency(data['jutf'] ?? '-');

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

String _formatCurrency(String value) {
    // Cek apakah value adalah angka
    if (value == '-' || value.isEmpty) return value;

    try {
        double number = double.parse(value);
        // Format ke mata uang Rupiah
        return NumberFormat.currency(locale: 'id_ID', symbol: '', decimalDigits: 2).format(number);
    } catch (e) {
        print("Error formatting currency: $e");
        return value; // Kembalikan nilai aslinya jika ada kesalahan
    }
}

}
