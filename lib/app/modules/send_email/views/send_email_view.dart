import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/send_email_controller.dart';

class SendEmailView extends GetView<SendEmailController> {
  const SendEmailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SendEmailView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SendEmailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
