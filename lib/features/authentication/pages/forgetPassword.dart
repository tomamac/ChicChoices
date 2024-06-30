import 'package:chic_choices/Reuse/reuse_widgets.dart';
import 'package:chic_choices/features/authentication/forgetpassword/forgetpassword_form_widget.dart';
import 'package:chic_choices/features/authentication/forgetpassword/forgetpassword_header_widget.dart';
import 'package:chic_choices/features/authentication/otp/otp_form_widget.dart';
import 'package:chic_choices/states/authentication/forgetpassword_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class forgetPassword extends StatelessWidget {
  const forgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ForgetPasswordState(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF6C273),
        body: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              height: screensizeNoBottom(context),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  hive(1),
                  const ForgetPasswordHeaderWidget(),
                  reuseDivider(),
                  const ForgetPasswordFormWidget(),
                  reuseDivider(),
                  const OTPFormWidget(),
                  hive(2)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
