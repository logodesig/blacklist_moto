import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/feedback_controller.dart';

class FeedbackView extends GetView<FeedbackController> {
  const FeedbackView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Laissez-nous vos commentaires !'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Laissez-nous vos commentaires !',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
