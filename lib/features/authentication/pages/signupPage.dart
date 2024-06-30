import 'package:chic_choices/Reuse/reuse_widgets.dart';
import 'package:chic_choices/features/authentication/signup/signup_footer_widget.dart';
import 'package:chic_choices/features/authentication/signup/signup_form_widget.dart';
import 'package:chic_choices/features/authentication/signup/signup_header_widget.dart';
import 'package:flutter/material.dart';

class signupPage extends StatelessWidget {
  const signupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6C273),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: screensizeNoBottom(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                hive(1),
                const SignupHeaderWidget(),
                reuseDivider(),
                const SignUpFormWidget(),
                reuseDivider(),
                const SignUpFooterWidget(),
                hive(2)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
