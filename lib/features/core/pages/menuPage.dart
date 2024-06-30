import 'package:chic_choices/Reuse/reuse_widgets.dart';
import 'package:chic_choices/features/authentication/repository/authentication_repository/authentication_repository.dart';
import 'package:chic_choices/features/core/pages/alluserPage.dart';
import 'package:chic_choices/features/core/pages/update_profile_screen.dart';
import 'package:chic_choices/features/core/profile/profile_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class menuPage extends StatelessWidget {
  const menuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = Get.put(AuthenticationRepository());

    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          height: screensizeWithBottom(context),
          color: const Color(0xFFF6C273),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              hive(1),
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset('images/userprofile.png'),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                          child: const Icon(
                            Icons.edit,
                            color: Color(0xFF84D2FF),
                            size: 20,
                          )),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                'UserName',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              const Text(
                'UserEmail@mail.a.a',
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(),
                  onPressed: () => Get.to(() => const UpdateProfileScreen()),
                  child: const Text('แก้ไขข้อมูลผู้ใช้งาน'),
                ),
              ),
              const SizedBox(height: 30),
              reuseDivider(),
              const SizedBox(height: 30),

              ///MENU
              SizedBox(
                width: LRPadding(context),
                child: Column(
                  children: [
                    ProfileMenuWidget(
                        title: 'ติดต่อศูนย์ช่วยเหลือ',
                        icon: Icons.chat,
                        onPress: () {}),
                    ProfileMenuWidget(
                        title: 'เกี่ยวกับ', icon: Icons.info, onPress: () {}),
                    ProfileMenuWidget(
                        title: '(admin)ดูข้อมูลผู้ใช้งาน',
                        icon: Icons.person_3,
                        onPress: () {
                          Get.to(const alluserPage());
                        }),
                    const SizedBox(height: 30),
                    reuseDivider(),
                    const SizedBox(height: 10),
                    ProfileMenuWidget(
                        title: 'ออกจากระบบ',
                        icon: Icons.logout,
                        textColor: Colors.red,
                        endIcon: false,
                        onPress: () {
                          authState.logout();
                          Get.back();
                          Get.delete();
                        }),
                  ],
                ),
              ),
              hive(2),
            ],
          ),
        ),
      ),
    );
  }
}
