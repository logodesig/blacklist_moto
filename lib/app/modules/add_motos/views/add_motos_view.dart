import 'package:blacklist_moto/app/components/black_textfield_input.dart';
import 'package:blacklist_moto/app/modules/home/views/home.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_motos_controller.dart';

class AddMotosView extends GetView<AddMotosController> {
  const AddMotosView({Key? key}) : super(key: key);
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
                    title: 'CNi ou Passeport N°',
                    onChanged: (cniNumber) =>
                        controller.cniOrPassportNumber = cniNumber),
                const SizedBox(height: 10),
                BlackTextFieldInput(
                    title: 'N° Permis de conduire',
                    onChanged: (password) => controller.permiNumber = password),
                const SizedBox(height: 10),
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
                          controller.addMoto();
                        })
              ],
            ),
          ),
        );
      }),
    );
  }
}
