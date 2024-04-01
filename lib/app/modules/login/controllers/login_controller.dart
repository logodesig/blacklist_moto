import 'dart:developer';

import 'package:blacklist_moto/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/phone_number.dart';

class LoginController extends GetxController {
  PhoneAuthCredential? phoneAuthCredential;
  final PageController pageController = PageController();
  int initialPage = 0;
  String smsCode = "";
  bool smsCodeHasError = false;
  PhoneNumber? phoneNumber;
  String afroVerificationId = '';
  bool loginLoading = false;
  var db = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    pageController.addListener(() {
      initialPage = pageController.page!.toInt();
      update();
    });
  }

  Future<void> login() async {
    loginLoading = true;
    update();

    if (phoneNumber == null || phoneNumber!.completeNumber.isEmpty) {
      loginLoading = false;
      update();
      Fluttertoast.showToast(
          msg: "Votre numéro de téléphone n'est pas correct");
      return;
    }

    try {
      log("object start");

      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber!.completeNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          log("object sent");
          phoneAuthCredential = credential;
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) {
            Get.toNamed(Routes.HOME);
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          log("object failed: $e");
          if (e.code == 'invalid-phone-number') {}
          loginLoading = false;
          update();
        },
        codeSent: (String verificationId, int? resendToken) {
          log("object code sent");
          afroVerificationId = verificationId;
          pageController.nextPage(
              duration: 300.milliseconds, curve: Curves.bounceIn);
          update();
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          log("object timeout");
        },
      );
    } catch (e) {
      loginLoading = false;
      Fluttertoast.showToast(
          backgroundColor: Colors.red,
          msg: "Un problème est survenu, veuillez réessayer");
      update();
    }
  }

  Future<void> validateOtp() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: afroVerificationId, smsCode: smsCode);

    // Sign the user in (or link) with the credential
    try {
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) async {
        await db
            .collection("users")
            .doc(value.user!.uid)
            .get()
            .then((valueDoc) {
          if (valueDoc.exists) {
            Get.toNamed(Routes.HOME);
          } else {
            Get.toNamed(Routes.REGISTER, arguments: {
              "phoneNumber": phoneNumber!.completeNumber,
              "userId": value.user!.uid,
            });
          }
        });
        // userServices.getUser(value.user!.uid);
      });
    } catch (e) {
      smsCodeHasError = true;
      update();
      Get.snackbar("Erorr", "message");
    }
  }
}
