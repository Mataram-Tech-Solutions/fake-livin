import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart'; // Pastikan path sesuai

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController controller =
      Get.put(HomeController()); // Menginisialisasi controller

  Future<void> _selectDateTime(BuildContext context) async {
    // Memilih tanggal
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      // Memilih waktu
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        // Menggabungkan tanggal dan waktu
        final DateTime selectedDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );

        // Format output ke dalam d/m/y h:i:s
        String formattedDateTime =
            "${selectedDateTime.day}/${selectedDateTime.month}/${selectedDateTime.year} "
            "${selectedDateTime.hour}:${selectedDateTime.minute}:${selectedDateTime.second}";

        // Memperbarui nilai di controller
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
          height:
              MediaQuery.of(context).size.height, // Agar sesuai tinggi layar
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
                                  controller: TextEditingController(
                                      text: controller.selectedDateTime
                                          .value), // Menampilkan hasil pemilih
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.grey[
                                        300], // Warna latar belakang abu-abu
                                    hintText: 'D/M/Y H:I:S',
                                    prefixIcon: Icon(
                                      Icons
                                          .calendar_month, // Ikon yang cocok untuk tanggal/waktu
                                      color: Colors.grey[700],
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide
                                          .none, // Menghilangkan border
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical:
                                            15), // Pusatkan teks secara vertikal
                                  ),
                                )),
                          ),
                        ),
                      ),
                      SizedBox(width: 14), // Jarak antar TextField
                      Expanded(
                        child: TextField(
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
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors
                                .grey[300], // Warna latar belakang abu-abu
                            hintText: 'A.N Rekening',
                            prefixIcon: Icon(
                              Icons
                                  .person, // Ikon yang cocok untuk reference
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
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors
                                .grey[300], // Warna latar belakang abu-abu
                            hintText: 'Bank',
                            prefixIcon: Icon(
                              Icons
                                  .balance, // Ikon yang cocok untuk reference
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
                SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0), // Padding sisi kiri dan kanan
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Pusatkan di tengah layar
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 150,
                        child: TextField(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
