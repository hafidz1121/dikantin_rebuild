import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/sign_in_controller.dart';

class SignInView extends GetView<SignInController> {
  SignInView({super.key});

  final _formKey = GlobalKey<FormBuilderState>();
  final _obscureText = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/logo_dikantin.png',
                    width: 200,
                    height: 200,
                  ),
                ),
                Center(
                  child: const Text(
                    'Selamat Datang',
                    style: TextStyle(
                      fontSize: 28,
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
                const SizedBox(height: 40),
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
                            vertical: 17,
                            horizontal: 17,
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
                              vertical: 17,
                              horizontal: 17,
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
                        height: 50,
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
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () => Get.offAllNamed(Routes.SIGN_UP),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: const BorderSide(
                                color: Color(0xFF1E2857),
                              ),
                            ),
                          ),
                          child: Text(
                            "Daftar",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF1E2857),
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
                  onTap: () {},
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
                        "Kurir",
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
    );
  }
}
