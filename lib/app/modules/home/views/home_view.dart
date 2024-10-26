import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        height: MediaQuery.of(context).size.height, // Agar sesuai tinggi layar
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Item 1",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Icon(Icons.star, color: Colors.yellow),
                ],
              ),
              Container(
                height: 400,
                color: Colors.blue,
                child: Center(child: Text("Box 2")),
              ),
              Container(
                height: 400,
                color: Colors.green,
                child: Center(child: Text("Box 3")),
              ),
              // Tambah lebih banyak widget jika diperlukan
            ],
          ),
        ),
      )),
    );
  }
}
