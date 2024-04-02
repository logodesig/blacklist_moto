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
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset("assets/images/logocamerounbon.png",
                          width: 50, height: 50, fit: BoxFit.cover),
                    ),
                    const SizedBox(width: 20),
                    const Text(
                      "MINATD",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Image.asset("assets/images/logo_app.png",
                          width: 80, height: 80, fit: BoxFit.cover),
                    ),
                    const Text(
                      "Bienvenue Sur Blacklist Moto",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                Container()
              ],
            ),
          ),
        ),
      );
    });
  }
}
