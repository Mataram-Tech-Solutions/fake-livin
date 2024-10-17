import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import '../controllers/splahs_screen_controller.dart';

class SplahsScreenView extends GetView<SplahsScreenController> {
  const SplahsScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                height: 250,
                width: 250,
                child: Image.asset(
                  'assets/splash_logo.png',
                  fit: BoxFit.cover,
                ))));
  }
}
