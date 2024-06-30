import 'package:chic_choices/features/authentication/login/login_footer_widget.dart';
import 'package:chic_choices/features/authentication/login/login_form_widget.dart';
import 'package:chic_choices/features/popup.dart';
import 'package:chic_choices/Reuse/reuse_widgets.dart';
import 'package:flutter/material.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      popup(context);
    });
  }

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
                logoWidget(
                  285,
                  285,
                ),
                const LoginForm(),
                reuseDivider(),
                const LoginFooterWidget(),
                hive(2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
