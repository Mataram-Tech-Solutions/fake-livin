import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import '../controllers/splahs_screen_controller.dart';

class SplashScreenView extends StatefulWidget {
  @override
  _SplashScreenViewState createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  final SplahsScreenController controller = Get.put(SplahsScreenController());
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
