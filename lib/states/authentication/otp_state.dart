import 'package:chic_choices/features/authentication/repository/authentication_repository/authentication_repository.dart';
import 'package:chic_choices/features/core/pages/bottomPageSelector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OTPState extends GetxController {
  static OTPState get instance => Get.find();

  final email = TextEditingController();
  final phoneNo = TextEditingController();

  void phoneAuthentication(String phoneNo) {
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }

  void verifyOTP(String otp) async {
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified
        ? (
            Get.offAll(bottomPageSelector()),
            Get.showSnackbar(
              const GetSnackBar(
                message: 'ยืนยัน OTP สำเร็จ!',
                duration: Duration(seconds: 5),
              ),
            ),
          )
        : (
            Get.showSnackbar(
              const GetSnackBar(
                message: 'ใส่รหัส OTP ผิดพลาด',
                duration: Duration(seconds: 5),
              ),
            ),
          );
  }
}
