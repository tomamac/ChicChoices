import 'package:chic_choices/features/authentication/models/user_model.dart';
import 'package:chic_choices/states/authentication/signup_state.dart';
import 'package:chic_choices/reuse/reuse_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final _state = Get.put(SignUpState());
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
              controller: _state.password,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.lock_outlined),
                hintText: 'รหัสผ่าน',
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _state.fullName,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline),
                hintText: 'ชื่อจริง - นามสกุล',
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.calendar_month_outlined),
                hintText: 'วันเกิด',
              ),
              controller: _state.birthDate,
              onTap: () => _state.selectDate(context),
              readOnly: true,
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _state.address,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.location_city_outlined),
                hintText: 'ที่อยู่',
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
                child: const Text(
                  'ยืนยันการสมัครสมาชิก',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final user = UserModel(
                      email: _state.email.text.trim(),
                      password: _state.password.text.trim(),
                      fullName: _state.fullName.text.trim(),
                      phoneNo: _state.phoneNo.text.trim(),
                      address: _state.address.text.trim(),
                      birthDate: _state.birthDate.text.trim(),
                    );
                    _state.createUser(user);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
