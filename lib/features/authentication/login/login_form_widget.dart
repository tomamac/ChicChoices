import 'package:chic_choices/Reuse/reuse_widgets.dart';
import 'package:chic_choices/features/authentication/pages/forgetPassword.dart';
import 'package:chic_choices/states/authentication/login_state.dart';
import 'package:chic_choices/states/authentication/otp_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final _state = Get.put(LogInState());
    final _formKey = GlobalKey<FormState>();
    return Form(
      key: _formKey,
      child: SizedBox(
        width: LRPadding(context),
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
            Obx(
              () => TextFormField(
                controller: _state.password,
                validator: (value) {
                  if (value!.isEmpty) return 'กรุณาใส่รหัสผ่าน';
                  return null;
                },
                obscureText: _state.passwordVisible.value,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock_outline),
                  hintText: 'พาสเวิร์ด',
                  suffixIcon: IconButton(
                    onPressed: () {
                      _state.visibleToggler();
                    },
                    icon: Icon(_state.passwordVisible.value
                        ? Icons.visibility
                        : Icons.visibility_off),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text(
                  'เข้าสู่ระบบ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  _state.login();
                  _state.clearTextInput();
                },
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
              child: const Text('ลืมรหัสผ่าน'),
              onPressed: () {
                Get.to(() => const forgetPassword(),
                    binding: BindingsBuilder.put(() => OTPState()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
