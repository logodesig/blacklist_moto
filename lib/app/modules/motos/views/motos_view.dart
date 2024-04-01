import 'package:blacklist_moto/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/motos_controller.dart';

class MotosView extends GetView<MotosController> {
  const MotosView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Motos'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.ADD_MOTOS);
        },
        child: const Icon(Icons.add),
      ),
      body: GetBuilder<MotosController>(builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: controller.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.yellow,
                ))
              : Column(
                  children: [
                    ...controller.motos.map((moto) => ListTile(
                          title: Text(moto["marqueMoto"]),
                          leading: const Icon(Icons.motorcycle),
                          onTap: () {
                            // Get.toNamed(Routes.DETAIL_MOTOS,
                            //     arguments: moto);
                          },
                          subtitle: Text(moto["modelMoto"]),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              // controller.deleteMoto(moto.id);
                            },
                          ),
                        )),
                  ],
                ),
        );
      }),
    );
  }
}
