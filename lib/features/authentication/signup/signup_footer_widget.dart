import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpFooterWidget extends StatelessWidget {
  const SignUpFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.center,
          child: Text(
            'เป็นสมาชิกอยู่แล้ว?',
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
          ),
          child: const Text('ล็อคอิน'),
          onPressed: () {
            Get.back();
            Get.delete();
          },
        ),
      ],
    );
  }
}
