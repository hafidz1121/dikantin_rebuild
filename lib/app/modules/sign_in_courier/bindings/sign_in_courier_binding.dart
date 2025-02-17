import 'package:get/get.dart';

import '../controllers/sign_in_courier_controller.dart';

class SignInCourierBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInCourierController>(
      () => SignInCourierController(),
    );
  }
}
