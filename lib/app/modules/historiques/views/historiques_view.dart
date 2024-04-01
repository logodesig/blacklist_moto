import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/historiques_controller.dart';

class HistoriquesView extends GetView<HistoriquesController> {
  const HistoriquesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historiques'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Historiques des recherches effectuées',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
