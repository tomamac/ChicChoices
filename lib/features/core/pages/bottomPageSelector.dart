import 'package:chic_choices/features/core/pages/announcementPage.dart';
import 'package:chic_choices/features/core/pages/historyPage.dart';
import 'package:chic_choices/features/core/pages/homePage.dart';
import 'package:chic_choices/features/core/pages/menuPage.dart';
import 'package:chic_choices/states/core/mainpage_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class bottomPageSelector extends StatelessWidget {
  final List<Widget> screens = [
    const homePage(),
    const announcementPage(),
    const historyPage(),
    const menuPage(),
  ];

  bottomPageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final PagesState = Get.put(MainPageState());

    return Scaffold(
      backgroundColor: const Color(0xFFF6C273),
      body: Obx(
        () => IndexedStack(
          index: PagesState.currentIndex.value,
          children: screens,
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xFFF6C273),
          currentIndex: PagesState.currentIndex.value,
          onTap: (index) {
            PagesState.setPage(index);
          },
          selectedItemColor: Theme.of(context).colorScheme.primary,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'หน้าหลัก',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'ประกาศ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'ประวัติ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: 'เมนู',
            ),
          ],
        ),
      ),
    );
  }
}
