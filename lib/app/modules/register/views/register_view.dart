import 'package:blacklist_moto/app/components/black_textfield_input.dart';
import 'package:blacklist_moto/app/modules/home/views/home.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Image.asset(
              "assets/images/logo_app.png",
              width: 50,
              height: 50,
            ),
            const SizedBox(height: 30),
            const Text(
              "Inscription",
              style: TextStyle(
                fontFamily: "Manrope",
                fontSize: 34,
                fontWeight: FontWeight.w800,
                color: Color(0xff202020),
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 34),
            const Text(
              "Entrez votre nom complet pour vous inscrirer à notre application",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xff202020),
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 34),
            BlackTextFieldInput(
              onChanged: (fullName) => controller.fullName = fullName,
              title: "Nom complet",
            ),
            const SizedBox(height: 34),
            controller.registerLoading
                ? const CircularProgressIndicator(
                    color: Colors.yellow,
                  )
                : PrimaryBtn(
                    title: "S'inscrire", onTap: controller.registerUser)
          ],
        ),
      ),
    );
  }
}
