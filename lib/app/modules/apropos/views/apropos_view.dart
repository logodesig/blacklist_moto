import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/apropos_controller.dart';

class AproposView extends GetView<AproposController> {
  const AproposView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apropos de Blacklist Moto'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Apropos de Blacklist Moto',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
