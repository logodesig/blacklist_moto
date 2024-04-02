import 'package:blacklist_moto/app/components/black_textfield_input.dart';
import 'package:blacklist_moto/app/modules/home/views/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_motos_controller.dart';

class AddMotosView extends GetView<AddMotosController> {
  const AddMotosView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajouter une moto'),
        centerTitle: true,
      ),
      body: GetBuilder<AddMotosController>(builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Informations du proprietaire",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                BlackTextFieldInput(
                  title: 'Nom',
                  onChanged: (firstName) => controller.firstName = firstName,
                ),
                const SizedBox(height: 10),
                BlackTextFieldInput(
                    title: 'Prénom',
                    onChanged: (lastName) => controller.lastName = lastName),
                const SizedBox(height: 10),
                BlackTextFieldInput(
                    title: 'CNI ou Passeport N°',
                    onChanged: (cniNumber) =>
                        controller.cniOrPassportNumber = cniNumber),
                const SizedBox(height: 10),
                const Text(
                  "Ajouter photo CNI ou Passeport",
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    AddPhotoBtn(
                      title: "Photo recto",
                      onTap: () {},
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    AddPhotoBtn(
                      title: "Photo verso",
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                BlackTextFieldInput(
                    title: 'N° Permis de conduire',
                    onChanged: (password) => controller.permiNumber = password),
                const SizedBox(height: 10),
                const Text(
                  "Ajouter photo Permis",
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    AddPhotoBtn(
                      title: "Photo recto",
                      onTap: () {},
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    AddPhotoBtn(
                      title: "Photo verso",
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                // Moto informations
                const Text(
                  "Informations de la moto",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                BlackTextFieldInput(
                    title: 'Marque de la moto',
                    onChanged: (password) => controller.marqueMoto = password),
                const SizedBox(height: 10),

                BlackTextFieldInput(
                    title: 'Model de la moto',
                    onChanged: (password) => controller.modelMoto = password),
                const SizedBox(height: 10),
                BlackTextFieldInput(
                    title: "N° Plaque d'immatriculation",
                    onChanged: (password) =>
                        controller.registrationNumberMoto = password),

                const SizedBox(height: 10),
                BlackTextFieldInput(
                    title: 'N° Chassis',
                    onChanged: (password) =>
                        controller.chassisNumberMoto = password),
                const SizedBox(height: 10),
                const Text(
                  "Informations suplémentaires",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                BlackTextFieldInput(
                    title: 'Ville',
                    onChanged: (password) => controller.ville = password),
                const SizedBox(height: 10),
                BlackTextFieldInput(
                    title: 'Mairie',
                    onChanged: (password) => controller.mairie = password),
                const SizedBox(height: 10),
                controller.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                        color: Colors.yellow,
                      ))
                    : PrimaryBtn(
                        title: "Enregistrer La Moto",
                        onTap: () {
                          Get.dialog(Dialog(
                            shape: BeveledRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            child: Container(
                              width: double.infinity,
                              // height: 500,
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    "Paiement",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Divider(),
                                  const SizedBox(height: 15),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          width: 200,
                                          height: 100,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              image: const DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/orange-money.jpg"),
                                                  fit: BoxFit.cover),
                                              border: Border.all(),
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                        ),
                                      ),
                                      const SizedBox(width: 40),
                                      Expanded(
                                        child: Container(
                                          width: 200,
                                          height: 100,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              image: const DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/MobileMoney.jpg"),
                                                  fit: BoxFit.cover),
                                              border: Border.all(),
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 15),
                                  BlackTextFieldInput(
                                      title: 'Munero de paiement',
                                      keyboardType: TextInputType.phone,
                                      onChanged: (password) =>
                                          controller.phone = password),
                                  const SizedBox(height: 20),
                                  PrimaryBtn(
                                    title: "Payer La Taxe",
                                    onTap: () {
                                      Get.back();
                                      controller.addMoto();
                                    },
                                  )
                                ],
                              ),
                            ),
                          ));
                          // controller.addMoto();
                        })
              ],
            ),
          ),
        );
      }),
    );
  }
}

class AddPhotoBtn extends StatelessWidget {
  const AddPhotoBtn({
    super.key,
    this.title,
    this.onTap,
  });

  final String? title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 120,
        height: 80,
        decoration: BoxDecoration(
            border: Border.all(), borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [const Icon(Icons.add_a_photo_outlined), Text("$title ")],
          ),
        ),
      ),
    );
  }
}
