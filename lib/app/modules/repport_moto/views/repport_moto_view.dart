import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/repport_moto_controller.dart';

class RepportMotoView extends GetView<RepportMotoController> {
  const RepportMotoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signaler une moto'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const Center(
              child: Text(
                'Fonctionalité en cours de développement...n\nVeuillez nous excuser pour le dérangement.',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
