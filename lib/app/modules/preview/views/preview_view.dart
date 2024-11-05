import 'dart:ffi';

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
                    width: MediaQuery.of(context)
                        .size
                        .width, // Memenuhi lebar layar
                    color: Color(0xFFD7E8F0),
                    child: Center(
                      child: Image.asset(
                        'assets/livin.png', // Ganti dengan path gambar Anda
                        width: 100, // Lebar gambar
                        height: 100, // Tinggi gambar
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Obx(() => Column(
                            mainAxisSize: MainAxisSize
                                .min, // Mengatur ukuran kolom sesuai kebutuhan
                            children: [
                              Text(
                                'Ref: ${controller.dttm.value}${controller.ref.value}', // Menampilkan data dari controller
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'RobotoCondensed',
                                  letterSpacing: 0.5,
                                  color: Color(0xFFb0b0b0),
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                  'Waktu: ${controller.dttmori.value}', // Menampilkan data dari controller
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'RobotoCondensed',
                                    letterSpacing: 1.2,
                                    color: Color(0xFFb0b0b0),
                                    fontSize: 16,
                                  )),
                            ],
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: Row(
                    children: [
                      Text(
                        'Status Transaksi',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          // fontFamily: 'RobotoCondensed',
                          color: Color(0xff8f939c),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: Row(
                    children: [
                      Text(
                        'Berhasil',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          // fontFamily: 'RobotoCondensed',
                          color: Color(0xff2d2d2d),
                          fontSize: 20,
                          fontWeight: FontWeight.w400
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24,),
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: Row(
                    children: [
                       Text(
                        'Dari Rekening',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          // fontFamily: 'RobotoCondensed',
                          color: Color(0xff8f939c),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: Row(
                    children: [
                       Obx(() => Text(
                        '${controller.ANrek.value}',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'RobotoCondensed',
                          color: Color(0xff2d2d2d),
                          fontSize: 20,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w300, // Mengatur font menjadi light
                        ),
                       )),
                       Obx(() => Text(
                        ' - ${controller.nobn.value} (${controller.curr.value})',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'RobotoCondensed',
                          color: Color(0xffc7c7c7),
                          fontSize: 20,
                          // letterSpacing: 1,
                          // fontWeight: FontWeight.w400, // Mengatur font menjadi light
                        ),
                       )),
                    ],
                  ),
                ),
                SizedBox(height: 16,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: Row(
                    children: [
                         Text(
                        'Ke Rekening',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          // fontFamily: 'RobotoCondensed',
                          color: Color(0xff8f939c),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: Row(
                    children: [
                        Obx(() => Text(
                        '${controller.ANrektu.value}',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'RobotoCondensed',
                          color: Color(0xff2d2d2d),
                          fontSize: 20,
                          // letterSpacing: 1,
                          fontWeight: FontWeight.w300, // Mengatur font menjadi light
                        ),
                       )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: Row(
                    children: [
                        Obx(() => Text(
                        '${controller.bank.value}',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'RobotoCondensed',
                          color: Color(0xffc7c7c7),
                          fontSize: 20,
                          // letterSpacing: 1,
                          // fontWeight: FontWeight.w400, // Mengatur font menjadi light
                        ),
                       )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: Row(
                    children: [
                        Obx(() => Text(
                        '${controller.nobntu.value} (${controller.currtu.value})',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'RobotoCondensed',
                          color: Color(0xffc7c7c7),
                          fontSize: 20,
                          // letterSpacing: 1,
                          // fontWeight: FontWeight.w400, // Mengatur font menjadi light
                        ),
                       )),
                    ],
                  ),
                ),
                SizedBox(height: 24,),
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: Row(
                    children: [
                       Text(
                        'Jumlah',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          // fontFamily: 'RobotoCondensed',
                          color: Color(0xff8f939c),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: Row(
                    children: [
                       Obx(() => Text(
                        'IDR ${controller.jutf.value}',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'RobotoCondensed',
                          color: Color(0xff2d2d2d),
                          fontSize: 20,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w300, // Mengatur font menjadi light
                        ),
                       )),
                ]),),
                SizedBox(height: 24,),
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: Row(
                    children: [
                       Text(
                        'Biaya',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          // fontFamily: 'RobotoCondensed',
                          color: Color(0xff8f939c),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: Row(
                    children: [
                       Obx(() => Text(
                        'IDR ${controller.bitf.value}',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'RobotoCondensed',
                          color: Color(0xff2d2d2d),
                          fontSize: 20,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w300, // Mengatur font menjadi light
                        ),
                       )),
                ]),),
                SizedBox(height: 24,),
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: Row(
                    children: [
                       Text(
                        'Deskripsi',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          // fontFamily: 'RobotoCondensed',
                          color: Color(0xff8f939c),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: Row(
                    children: [
                       Obx(() => Text(
                        '${controller.deskripsi.value}',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'RobotoCondensed',
                          color: Color(0xff2d2d2d),
                          fontSize: 20,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w300, // Mengatur font menjadi light
                        ),
                       )),
                ]),),
                SizedBox(height: 24,),
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: Row(
                    children: [
                       Text(
                        'Jenis Transfer',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          // fontFamily: 'RobotoCondensed',
                          color: Color(0xff8f939c),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: Row(
                    children: [
                       Text(
                        'Online',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'RobotoCondensed',
                          color: Color(0xff2d2d2d),
                          fontSize: 20,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w300, // Mengatur font menjadi light
                        ),
                       ),
                ]),),
                SizedBox(height: 24,),
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: Row(
                    children: [
                       Text(
                        'Nomor Referensi Pelanggan',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          // fontFamily: 'RobotoCondensed',
                          color: Color(0xff8f939c),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: Row(
                    children: [
                       Obx(() => Text(
                        '${controller.norefpe.value}',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'RobotoCondensed',
                          color: Color(0xff2d2d2d),
                          fontSize: 20,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w400, // Mengatur font menjadi light
                        ),
                       )),
                ]),),
          ]),)
        ),
      ),
    );
  }
}
