import 'dart:async';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    startSplash();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

 void startSplash() {
    Timer(Duration(seconds: 3), () {
      Get.offAllNamed(Routes.SIGN_IN); 
    });
  }
}
