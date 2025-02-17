import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/code_otp_controller.dart';

class CodeOtpView extends GetView<CodeOtpController> {
  const CodeOtpView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CodeOtpView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CodeOtpView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
