import 'package:blacklist_moto/app/components/black_phonefield_input.dart';
import 'package:blacklist_moto/app/modules/home/views/home.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (_) {
      return Scaffold(
        extendBody: true,
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: PageView(
            controller: controller.pageController,
            onPageChanged: (value) {
              controller.initialPage = value;
              controller.update();
            },
            physics: const NeverScrollableScrollPhysics(),
            children: [
              const LoginPhoneEnter(),
              LoginOtpView(controller: controller),
            ],
          ),
        ),
      );
    });
  }
}

class LoginOtpView extends StatelessWidget {
  const LoginOtpView({
    super.key,
    required this.controller,
  });

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
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
          "Connexion",
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
          "Confirmer votre numéro de téléphone",
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xff202020),
          ),
          textAlign: TextAlign.left,
        ),
        // const SizedBox(height: 10),
        Text(
          "Nous avons envoyé un code de vérification au numéro  ${controller.phoneNumber!.completeNumber}. ",
          style: const TextStyle(
            fontFamily: "Poppins",
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xff454545),
          ),
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 16),
        OTPTextField(
          length: 6,
          hasError: controller.smsCodeHasError,
          width: MediaQuery.of(context).size.width - 40,
          fieldWidth: 50,
          style: const TextStyle(fontSize: 17),
          textFieldAlignment: MainAxisAlignment.spaceAround,
          onChanged: (value) {},
          fieldStyle: FieldStyle.box,
          onCompleted: (pin) {
            controller.smsCode = pin;
            controller.validateOtp();
          },
        ),
        const SizedBox(height: 16),
        const Text(
          "Tu n'as pas reçu de code ?",
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.left,
        )
      ],
    );
  }
}

class LoginPhoneEnter extends StatelessWidget {
  const LoginPhoneEnter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          Image.asset(
            "assets/images/logo_app.png",
            width: 50,
            height: 50,
          ),
          const SizedBox(height: 60),
          const Text(
            'Conexion',
            style: TextStyle(
              fontFamily: "Manrope",
              fontSize: 34,
              fontWeight: FontWeight.w800,
              color: Color(0xff202020),
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 24),
          const Text(
            "Connectez-vous à votre compte pour utiliser l'application",
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xff454545),
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 34),
          BlackPhoneFieldInput(
            title: "Votre numéro de téléphone",
            hintText: "6 - -   - -   - -   - - ",
            onChanged: (p0) {
              controller.phoneNumber = p0;
            },
          ),
          const SizedBox(
            height: 24,
          ),
          controller.loginLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.yellow,
                  ),
                )
              : PrimaryBtn(
                  title: "Connexion",
                  onTap: () {
                    controller.login();
                  })
        ],
      );
    });
  }
}
