// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/sign_in_courier_controller.dart';

class SignInCourierView extends GetView<SignInCourierController> {
  SignInCourierView({super.key});

  final _formKey = GlobalKey<FormBuilderState>();
  final _obscureText = true.obs;

  // Variables to track back button
  int _backButtonPressCount = 0;
  late Timer _timer;

  // Function to check if the keyboard is visible
  bool isKeyboardVisible(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return mediaQuery.viewInsets.bottom > 0;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_backButtonPressCount == 0) {
          // start a timer to reset the count if not pressed again
          _backButtonPressCount++;
          _timer = Timer(const Duration(seconds: 1), () {
            _backButtonPressCount = 0;
          });
          // Show a snackbar or toast indicating press again to exit
          Get.snackbar(
            "Informasi",
            "Tekan sekali lagi untuk keluar",
            animationDuration: const Duration(milliseconds: 200),
            duration: const Duration(milliseconds: 1650),
            backgroundColor: Color(0xFF1E2857),
            colorText: Colors.white,
            borderWidth: 5.0,
            snackPosition: SnackPosition.TOP,
            margin: const EdgeInsets.all(20.0),
            icon: const Icon(
              CupertinoIcons.info_circle,
              color: Colors.white,
            ),
          );
          return false; // Do not exit the app yet
        } else {
          // Second press within the timer duration, exit the app
          _timer.cancel(); // Cancel the timer
          return true; // Allow the app to exit
        }
      },
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            physics: isKeyboardVisible(context)
                ? const AlwaysScrollableScrollPhysics()
                : const NeverScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/logo_dikantin.png',
                      width: 180,
                      height: 180,
                    ),
                  ),
                  Center(
                    child: const Text(
                      'Selamat Datang Kurir',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E2857),
                      ),
                    ),
                  ),
                  Center(
                    child: const Text(
                      'Masuk ke akun anda untuk melanjutkan',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  FormBuilder(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FormBuilderTextField(
                          name: "email",
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black87,
                          ),
                          scrollPadding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              CupertinoIcons.mail,
                              size: 18,
                              color: Colors.black87,
                            ),
                            hintText: "Masukan email",
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.black54,
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                              borderSide: BorderSide(color: Colors.black87),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                              borderSide: BorderSide(color: Colors.black87),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 15,
                            ),
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.email(),
                          ]),
                        ),
                        const SizedBox(height: 15),
                        Obx(
                          () => FormBuilderTextField(
                            name: "password",
                            keyboardType: TextInputType.visiblePassword,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                            scrollPadding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom,
                            ),
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                CupertinoIcons.lock,
                                size: 18,
                                color: Colors.black87,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscureText.value
                                      ? CupertinoIcons.eye
                                      : CupertinoIcons.eye_slash,
                                  size: 18.0,
                                  color: Colors.black87,
                                ),
                                onPressed: () {
                                  _obscureText.toggle();
                                },
                              ),
                              hintText: "Masukan password",
                              hintStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.black54,
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                                borderSide: BorderSide(color: Colors.black87),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                                borderSide: BorderSide(color: Colors.black87),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 15,
                                horizontal: 15,
                              ),
                            ),
                            obscureText: _obscureText.value,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                            ]),
                          ),
                        ),
                        const SizedBox(height: 35),
                        SizedBox(
                          width: double.infinity,
                          height: 45,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF1E2857),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: Text(
                              "Masuk",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 70),
                  GestureDetector(
                    onTap: () {},
                    child: Center(
                      child: const Text(
                        "Lupa password?",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E2857),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () => Get.offAllNamed(Routes.SIGN_IN),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Masuk sebagai ",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF1E2857),
                          ),
                        ),
                        const Text(
                          "Pelanggan",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1E2857),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
