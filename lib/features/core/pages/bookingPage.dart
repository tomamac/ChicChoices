import 'package:chic_choices/Reuse/reuse_widgets.dart';
import 'package:chic_choices/features/authentication/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class bookingPage extends StatelessWidget {
  const bookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = Get.put(AuthenticationRepository());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFA939),
        title: Text('จองตั๋ว'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top -
                kBottomNavigationBarHeight -
                2,
            color: const Color(0xFFF6C273),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                hive(1),
                const Text(
                    'This is announcement page not only that but also a test for update page?'),
                ElevatedButton(
                    child: const Text('ออกจากระบบ'),
                    onPressed: () {
                      authState.logout();
                      Get.back();
                      Get.delete();
                    }),
                hive(2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
