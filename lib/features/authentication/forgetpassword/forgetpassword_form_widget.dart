import 'package:chic_choices/Reuse/reuse_widgets.dart';
import 'package:chic_choices/states/authentication/forgetpassword_state.dart';
import 'package:chic_choices/states/authentication/otp_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ForgetPasswordFormWidget extends StatelessWidget {
  const ForgetPasswordFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var ForgetPasswordState_ = context.watch<ForgetPasswordState>();
    final _state = Get.put(OTPState());
    final _formKey = GlobalKey<FormState>();

    return SizedBox(
      width: LRPadding(context),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _state.email,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                hintText: 'อีเมล',
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _state.phoneNo,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.phone_android_outlined),
                hintText: 'เบอร์โทรศัพท์',
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: ForgetPasswordState_.isButtonEnabled
                    ? () {
                        ForgetPasswordState_.enableOtpTextField();
                        OTPState.instance
                            .phoneAuthentication(_state.phoneNo.text.trim());
                      }
                    : null,
                child: const Text(
                  'ส่ง OTP',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            if (!ForgetPasswordState_.isButtonEnabled)
              Text(
                'ส่ง OTP ได้อีกครั้งใน ${ForgetPasswordState_.countdown}s',
                style: const TextStyle(
                  color: Colors.red,
                ),
              ),
            TextButton(
              onPressed: () {
                Get.back();
                Get.delete();
              },
              child: const Text(
                'ยกเลิก',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
