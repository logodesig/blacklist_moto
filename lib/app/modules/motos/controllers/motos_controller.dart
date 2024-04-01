import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class MotosController extends GetxController {
  var db = FirebaseFirestore.instance;
  bool isLoading = false;
  List<Map<String, dynamic>> motos = [];

  @override
  void onInit() async {
    await getUserMotos(FirebaseAuth.instance.currentUser!.uid);
    super.onInit();
  }

  // Get user motos from database

  Future<void> getUserMotos(String userId) async {
    isLoading = true;
    update();
    try {
      var motosDoc =
          await db.collection('motos').where('userId', isEqualTo: userId).get();
      if (motosDoc.docs.isNotEmpty) {
        var motosList = <Map<String, dynamic>>[];
        for (var moto in motosDoc.docs) {
          motosList.add(moto.data() as Map<String, dynamic>);
        }
        motos = motosList;
        update();
      }
      isLoading = false;
      update();
    } catch (e) {
      isLoading = false;
      update();
      Get.snackbar('Error', 'Error getting user motos');
      print(e);
    }
  }
}
