import 'package:get/get.dart';

import '../modules/code_otp/bindings/code_otp_binding.dart';
import '../modules/code_otp/views/code_otp_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/reset_password/bindings/reset_password_binding.dart';
import '../modules/reset_password/views/reset_password_view.dart';
import '../modules/send_email/bindings/send_email_binding.dart';
import '../modules/send_email/views/send_email_view.dart';
import '../modules/sign_in/bindings/sign_in_binding.dart';
import '../modules/sign_in/views/sign_in_view.dart';
import '../modules/sign_in_courier/bindings/sign_in_courier_binding.dart';
import '../modules/sign_in_courier/views/sign_in_courier_view.dart';
import '../modules/sign_up/bindings/sign_up_binding.dart';
import '../modules/sign_up/views/sign_up_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SIGN_IN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_IN,
      page: () => SignInView(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => const ResetPasswordView(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.CODE_OTP,
      page: () => CodeOtpView(),
      binding: CodeOtpBinding(),
    ),
    GetPage(
      name: _Paths.SEND_EMAIL,
      page: () => SendEmailView(),
      binding: SendEmailBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_IN_COURIER,
      page: () => SignInCourierView(),
      binding: SignInCourierBinding(),
    ),
  ];
}
