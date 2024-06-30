import 'package:chic_choices/features/authentication/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogInState extends GetxController {
  static LogInState get instance => Get.find();

  var passwordVisible = true.obs;

  final email = TextEditingController();
  final password = TextEditingController();

  Future<void> login() async {
    String? error = await AuthenticationRepository.instance
        .LoginWithEmailAndPassword(email.text.trim(), password.text.trim());
    if (error != null) {
      Get.showSnackbar(GetSnackBar(
        message: error.toString(),
        duration: const Duration(seconds: 5),
      ));
    }
  }

  bool visibleToggler() {
    passwordVisible.value = !passwordVisible.value;
    return passwordVisible.value;
  }

  void clearTextInput() {
    email.clear();
    password.clear();
  }
}
