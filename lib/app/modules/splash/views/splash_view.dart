import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(builder: (_) {
      return Scaffold(
        extendBody: true,
        backgroundColor: Colors.white,
        body: Center(
          child: Image.asset("assets/images/logo_app.png",
              width: 150, height: 150, fit: BoxFit.cover),
        ),
      );
    });
  }
}
