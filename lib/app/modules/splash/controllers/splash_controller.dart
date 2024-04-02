import 'package:blacklist_moto/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  // final UserServices userServices = UserServices();
  var db = FirebaseFirestore.instance;
  @override
  void onInit() async {
    Future.delayed(100.milliseconds);
    await isUserLogin();
    super.onInit();
  }

  Future<void> isUserLogin() async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user != null) {
        await db.collection("users").doc(user.uid).get().then((value) {
          if (value.exists) {
            Get.offAllNamed(Routes.HOME);
          } else {
            Get.offAllNamed(Routes.LOGIN);
          }
        });
        // await userServices.getUser(user.uid).then((value) {
        //   Get.offAllNamed(Routes.HOME);
        // }).onError((error, stackTrace) {
        //   FirebaseAuth.instance.signOut();
        //   Get.offAllNamed(Routes.ONBOARDING);
        // });
      } else {
        Get.offAllNamed(Routes.LOGIN);
        // Get.offAllNamed(Routes.AFRO_ADMOB_ADS);
      }
    });
  }
}
