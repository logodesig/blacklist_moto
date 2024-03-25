import 'package:blacklist_moto/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: AppPages.INITIAL,
    title: 'Blacklist Moto',
    defaultTransition: Transition.fade,
    // initialBinding: SplashBinding(),
    getPages: AppPages.routes,
    // home: SplashPage(),
  ));
}
