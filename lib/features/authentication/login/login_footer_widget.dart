import 'package:chic_choices/features/authentication/pages/signupPage.dart';
import 'package:chic_choices/states/authentication/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('ยังไม่ได้เป็นสมาชิก?'),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
          ),
          child: const Text('สมัครสมาชิก'),
          onPressed: () {
            Get.to(
              () => const signupPage(),
              binding: BindingsBuilder.put(
                () => SignUpState(),
              ),
            );
          },
        ),
      ],
    );
  }
}
