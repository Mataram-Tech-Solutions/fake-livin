import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController controller = Get.put(HomeController());

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        final DateTime selectedDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );

        String formattedDateTime =
            "${selectedDateTime.day}/${selectedDateTime.month}/${selectedDateTime.year} "
            "${selectedDateTime.hour}:${selectedDateTime.minute}:${selectedDateTime.second}";

        controller.updateDateTime(formattedDateTime);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Form Data',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20), // Jarak dari AppBar
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0), // Padding sisi kiri dan kanan
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Pusatkan di tengah layar
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 215,
                        child: GestureDetector(
                          onTap: () => _selectDateTime(context),
                          child: AbsorbPointer(
                            // Mencegah interaksi langsung dengan TextField
                            child: Obx(() => TextField(
                              controller : TextEditingController(
                                      text: controller.selectedDateTime
                                          .value), 
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[300], // Warna latar belakang abu-abu
                                hintText: 'D/M/Y H:I:S',
                                prefixIcon: Icon(
                                  Icons.calendar_month, // Ikon yang cocok untuk tanggal/waktu
                                  color: Colors.grey[700],
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none, // Menghilangkan border
                                ),
                                contentPadding: EdgeInsets.symmetric(vertical: 15),
                              ),
                              onChanged: (value) {
                                controller.updateDateTime(value);
                              },
                            )),
                          ),
                        ),
                      ),
                      SizedBox(width: 14), // Jarak antar TextField
                      Expanded(
                        child: TextField(
                          controller: controller.refController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors
                                .grey[300], // Warna latar belakang abu-abu
                            hintText: 'Reference',
                            prefixIcon: Icon(
                              Icons.bookmark, // Ikon yang cocok untuk reference
                              color: Colors.grey[700],
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  BorderSide.none, // Menghilangkan border
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15), // Pusatkan teks secara vertikal
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: Row(
                    children: [
                      Text(
                        'Asal Rekening :',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextField(
                      controller: controller.ANrekController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor:
                            Colors.grey[300], // Warna latar belakang abu-abu
                        hintText: 'A.N Rekening',
                        prefixIcon: Icon(
                          Icons.person, // Ikon yang cocok untuk reference
                          color: Colors.grey[700],
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none, // Menghilangkan border
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 15), // Pusatkan teks secara vertikal
                      ),
                    )),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0), // Padding sisi kiri dan kanan
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Pusatkan di tengah layar
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 200,
                        child: TextField(
                          controller: controller.nobnController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors
                                .grey[300], // Warna latar belakang abu-abu
                            hintText: 'No. Rekening',
                            prefixIcon: Icon(
                              Icons
                                  .account_balance, // Ikon yang cocok untuk reference
                              color: Colors.grey[700],
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  BorderSide.none, // Menghilangkan border
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15), // Pusatkan teks secara vertikal
                          ),
                        ),
                      ),
                      SizedBox(width: 14), // Jarak antar TextField
                      Expanded(
                        child: TextField(
                          controller: controller.currController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors
                                .grey[300], // Warna latar belakang abu-abu
                            hintText: 'Currency',
                            prefixIcon: Icon(
                              Icons
                                  .currency_exchange, // Ikon yang cocok untuk reference
                              color: Colors.grey[700],
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  BorderSide.none, // Menghilangkan border
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15), // Pusatkan teks secara vertikal
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: Row(
                    children: [
                      Text(
                        'Tujuan Rekening :',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0), // Padding sisi kiri dan kanan
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Pusatkan di tengah layar
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 250,
                        child: TextField(
                          controller: controller.ANrektuController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors
                                .grey[300], // Warna latar belakang abu-abu
                            hintText: 'A.N Rekening',
                            prefixIcon: Icon(
                              Icons.person, // Ikon yang cocok untuk reference
                              color: Colors.grey[700],
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  BorderSide.none, // Menghilangkan border
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15), // Pusatkan teks secara vertikal
                          ),
                        ),
                      ),
                      SizedBox(width: 14), // Jarak antar TextField
                      Expanded(
                        child: TextField(
                          controller: controller.bankController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors
                                .grey[300], // Warna latar belakang abu-abu
                            hintText: 'Bank',
                            prefixIcon: Icon(
                              Icons.balance, // Ikon yang cocok untuk reference
                              color: Colors.grey[700],
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  BorderSide.none, // Menghilangkan border
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15), // Pusatkan teks secara vertikal
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0), // Padding sisi kiri dan kanan
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Pusatkan di tengah layar
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 200,
                        child: TextField(
                          controller: controller.nobntuController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors
                                .grey[300], // Warna latar belakang abu-abu
                            hintText: 'No. Rekening',
                            prefixIcon: Icon(
                              Icons
                                  .account_balance, // Ikon yang cocok untuk reference
                              color: Colors.grey[700],
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  BorderSide.none, // Menghilangkan border
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15), // Pusatkan teks secara vertikal
                          ),
                        ),
                      ),
                      SizedBox(width: 14), // Jarak antar TextField
                      Expanded(
                        child: TextField(
                          controller: controller.currtuController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors
                                .grey[300], // Warna latar belakang abu-abu
                            hintText: 'Currency',
                            prefixIcon: Icon(
                              Icons
                                  .currency_exchange, // Ikon yang cocok untuk reference
                              color: Colors.grey[700],
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  BorderSide.none, // Menghilangkan border
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15), // Pusatkan teks secara vertikal
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0), // Padding sisi kiri dan kanan
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Pusatkan di tengah layar
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 180,
                        child: TextField(
                          controller: controller.jutfController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors
                                .grey[300], // Warna latar belakang abu-abu
                            hintText: 'Jumlah Tranfer',
                            prefixIcon: Icon(
                              Icons
                                  .attach_money, // Ikon yang cocok untuk reference
                              color: Colors.grey[700],
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  BorderSide.none, // Menghilangkan border
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15), // Pusatkan teks secara vertikal
                          ),
                        ),
                      ),
                      SizedBox(width: 14), // Jarak antar TextField
                      Expanded(
                        child: TextField(
                          controller: controller.bitfController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors
                                .grey[300], // Warna latar belakang abu-abu
                            hintText: 'Biaya Tranfer',
                            prefixIcon: Icon(
                              Icons
                                  .attach_money, // Ikon yang cocok untuk reference
                              color: Colors.grey[700],
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  BorderSide.none, // Menghilangkan border
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15), // Pusatkan teks secara vertikal
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: Row(
                    children: [
                      Text(
                        'Lainya :',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextField(
                      controller: controller.norefpeController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor:
                            Colors.grey[300], // Warna latar belakang abu-abu
                        hintText: 'No. Referensi Pelanggan (Opsional)',
                        prefixIcon: Icon(
                          Icons.bookmark, // Ikon yang cocok untuk reference
                          color: Colors.grey[700],
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none, // Menghilangkan border
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 15), // Pusatkan teks secara vertikal
                      ),
                    )),
                SizedBox(
                  height: 15,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextField(
                      controller: controller.deskripsiController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor:
                            Colors.grey[300], // Warna latar belakang abu-abu
                        hintText: 'Deskripsi (Opsional)',
                        prefixIcon: Icon(
                          Icons.description, // Ikon yang cocok untuk reference
                          color: Colors.grey[700],
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none, // Menghilangkan border
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 15), // Pusatkan teks secara vertikal
                      ),
                    )),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20, horizontal: 16.0),
                  child: ElevatedButton.icon(
                     onPressed: () {
                        controller.sendDataToPreview();
                        Get.toNamed('/preview'); // Navigasi ke halaman preview
                      },
                    icon: Icon(
                      Icons.visibility,
                      color: const Color.fromARGB(255, 255, 255, 255), // Ubah warna ikon di sini
                    ),
                    label: Text(''),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 31, 232, 9),
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 160),
                      textStyle:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
