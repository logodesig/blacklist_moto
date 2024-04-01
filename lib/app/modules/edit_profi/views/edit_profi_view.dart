import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_profi_controller.dart';

class EditProfiView extends GetView<EditProfiController> {
  const EditProfiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editer mon profil'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Editer mon profil',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
