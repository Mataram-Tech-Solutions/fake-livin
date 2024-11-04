import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import '../controllers/preview_controller.dart';

class PreviewView extends GetView<PreviewController> {
  const PreviewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width, // Memenuhi lebar layar
                  height: 200, // Tinggi kotak persegi panjang
                  color: Colors.blueGrey, // Warna latar belakang kotak
                  child: Center(
                    // child: Image.asset(
                    //   'assets/your_image.png', // Ganti dengan path gambar Anda
                    //   width: 100, // Lebar gambar
                    //   height: 100, // Tinggi gambar
                    // ),
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
