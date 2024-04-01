import 'package:blacklist_moto/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  var db = FirebaseFirestore.instance;
  String fullName = '';
  String phoneNumber = Get.arguments['phoneNumber'] as String;
  String userId = Get.arguments['userId'] as String;
  bool registerLoading = false;

// Register a new user in the database
  Future<void> registerUser() async {
    registerLoading = true;
    update();
    // Create a new user with a first and last name
    final user = <String, dynamic>{
      "fullName": fullName,
      "phoneNumber": phoneNumber,
      "userId": userId,
      "createdAt": DateTime.now().toString(),
      "updatedAt": DateTime.now().toString()
    };

// Add a new document with a generated ID
    await db.collection("users").doc(userId).set(user).whenComplete(() {
      Get.toNamed(Routes.HOME);
      registerLoading = false;
      update();
      return Get.snackbar("Succès", "Utilisateur enregistré avec succès");
    }).catchError((_error) {
      print('Error adding document: $_error');
      Get.snackbar(
          "Error", "Erreur d'enregistrement de l'utilisateur: $_error");
      registerLoading = false;
      update();
    });
  }
}
