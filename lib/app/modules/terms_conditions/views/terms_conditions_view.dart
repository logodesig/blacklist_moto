import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/terms_conditions_controller.dart';

class TermsConditionsView extends GetView<TermsConditionsController> {
  const TermsConditionsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conditions d\'utilisations'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Conditions d\'utilisations',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
