import 'package:chic_choices/Reuse/reuse_widgets.dart';
import 'package:chic_choices/states/authentication/forgetpassword_state.dart';
import 'package:chic_choices/states/authentication/otp_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class OTPFormWidget extends StatelessWidget {
  const OTPFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var otp;
    var ForgetPasswordState_ = context.watch<ForgetPasswordState>();
    return SizedBox(
      width: LRPadding(context),
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Container(
                width: 200,
                decoration: BoxDecoration(
                  color: const Color(0xFFE59B57),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'กรอกรหัส OTP',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          OtpTextField(
            mainAxisAlignment: MainAxisAlignment.center,
            numberOfFields: 6,
            enabled: ForgetPasswordState_.isOtpEnabled,
            enabledBorderColor: const Color(0xFFE59B57),
            focusedBorderColor: const Color(0xFF5DBBE3),
            fillColor: const Color(0x90E59B57),
            filled: true,
            onSubmit: (code) {
              otp = code;
              OTPState.instance.verifyOTP(otp);
            },
          ),
          ElevatedButton(
            onPressed: ForgetPasswordState_.isOtpEnabled
                ? () {
                    if (otp == null) {
                      Get.showSnackbar(const GetSnackBar(
                        message: 'กรุณาใส่รหัส OTP 6 หลักให้ถูกต้อง',
                        duration: Duration(seconds: 5),
                      ));
                    } else {
                      OTPState.instance.verifyOTP(otp);
                    }
                  }
                : null,
            child: const Text(
              'ยืนยัน',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
