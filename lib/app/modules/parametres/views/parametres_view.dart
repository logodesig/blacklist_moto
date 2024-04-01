import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/parametres_controller.dart';

class ParametresView extends GetView<ParametresController> {
  const ParametresView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parametres'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Parametres',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
