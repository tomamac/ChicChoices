import 'package:chic_choices/features/authentication/models/user_model.dart';
import 'package:chic_choices/features/authentication/repository/authentication_repository/authentication_repository.dart';
import 'package:chic_choices/features/authentication/repository/user_repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpState extends GetxController {
  static SignUpState get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final birthDate = TextEditingController();
  final address = TextEditingController();
  final phoneNo = TextEditingController();

  final userRepo = Get.put(UserRepository());

  void registerUser(String email, String password) async {
    String? error = await AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password);
    if (error != null) {
      Get.showSnackbar(GetSnackBar(
        message: error.toString(),
        duration: const Duration(seconds: 5),
      ));
    }
  }

  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
    registerUser(user.email, user.password);
  }

  DateTime selectedDate = DateTime.now();
  List<int> years =
      List.generate(100, (int index) => DateTime.now().year - index);
  int selectedMonth = 1;
  int selectedDay = 1;

  void selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      selectedMonth = picked.month;
      selectedDay = picked.day;
      birthDate.text =
          '${selectedMonth.toString().padLeft(2, '0')}/${selectedDay.toString().padLeft(2, '0')}/${picked.year}';
    }
  }
}
