import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

enum MotoState {
  initial,
  loading,
  loaded,
  error,
}

class HomeController extends GetxController {
  int selectedIndex = 0;
  var db = FirebaseFirestore.instance;
  Map<String, dynamic> user = {};
  Map<String, dynamic> motoInfo = {};
  String findMotoId = "";

  var findMotoState = MotoState.initial;

  void changeFindMotoState(MotoState newState) {
    findMotoState = newState;
    update();
  }

  onItemTapped(int index) {
    selectedIndex = index;
    update();
  }

  @override
  void onInit() async {
    await getUser();
    super.onInit();
  }

  Future<void> getUser() async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user != null) {
        await db.collection("users").doc(user.uid).get().then((value) {
          if (value.exists) {
            this.user = value.data()!;
            update();
          }
        });
      }
    });
  }

  Future<void> findMoto() async {
    changeFindMotoState(MotoState.loading);
    await db
        .collection("motos")
        .where("uniqueId", isEqualTo: findMotoId)
        .limit(1)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty && value.docs[0].exists) {
        changeFindMotoState(MotoState.loaded);
        motoInfo = value.docs[0].data();
        update();
      } else if (value.docs.isEmpty) {
        changeFindMotoState(MotoState.error);

        update();
      } else {
        changeFindMotoState(MotoState.error);
      }
    });
  }
}
