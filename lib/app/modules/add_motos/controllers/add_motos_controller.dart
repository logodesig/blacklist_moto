import 'dart:math';

import 'package:blacklist_moto/app/modules/motos/controllers/motos_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AddMotosController extends GetxController {
  String firstName = '';
  String lastName = '';
  String cniOrPassportNumber = '';
  String permiNumber = '';
  String marqueMoto = '';
  String modelMoto = '';
  String chassisNumberMoto = '';
  String registrationNumberMoto = '';
  String ville = '';
  String mairie = '';
  var db = FirebaseFirestore.instance;
  bool isLoading = false;
  final MotosController motosController = Get.find<MotosController>();
  // Generate a random string for the unique ID of the moto

  var _chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ01234567890';
  Random _rnd = Random();

  Future<void> addMoto() async {
    isLoading = true;
    update();
    // Add the moto to the database collection "motos"
    if (firstName.isEmpty ||
        lastName.isEmpty ||
        cniOrPassportNumber.isEmpty ||
        permiNumber.isEmpty ||
        marqueMoto.isEmpty ||
        modelMoto.isEmpty ||
        chassisNumberMoto.isEmpty ||
        registrationNumberMoto.isEmpty ||
        ville.isEmpty ||
        mairie.isEmpty) {
      Get.snackbar("Erreur", "Veuillez remplir tous les champs");
      isLoading = false;
      update();
      return;
    }
    // Generate a random string for the unique ID of the moto
    // String uniqueId = getRandomString(5);
    await db.collection("motos").add({
      "firstName": firstName,
      "lastName": lastName,
      "userId": FirebaseAuth.instance.currentUser!.uid,
      "cniOrPassportNumber": cniOrPassportNumber,
      "permiNumber": permiNumber,
      "uniqueId": getRandomString(5),
      "marqueMoto": marqueMoto,
      "modelMoto": modelMoto,
      "chassisNumberMoto": chassisNumberMoto,
      "registrationNumberMoto": registrationNumberMoto,
      "ville": ville,
      "mairie": mairie
    }).then((value) {
      isLoading = false;
      update();
      motosController.getUserMotos(FirebaseAuth.instance.currentUser!.uid);
      // Navigate back to the previous screen
      Get.back();

      Get.snackbar("Succès", "La moto a été ajoutée avec succès");
    }).catchError((error) => print("Failed to add moto: $error"));
  }

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
}
