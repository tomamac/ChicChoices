import 'package:chic_choices/features/core/pages/bookingPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../1main_pages/home_page.dart';

double screensizeNoBottom(BuildContext context) {
  return MediaQuery.of(context).size.height -
      MediaQuery.of(context).padding.top;
}

double screensizeWithBottom(BuildContext context) {
  return MediaQuery.of(context).size.height -
      MediaQuery.of(context).padding.top -
      kBottomNavigationBarHeight -
      2;
}

double LRPadding(BuildContext context) {
  return MediaQuery.of(context).size.width - 40;
}

Container logoWidget(double lwidth, double lheight) {
  return Container(
    width: lwidth,
    height: lheight,
    decoration: const BoxDecoration(
      color: Color(0xFFD9D9D9),
      shape: BoxShape.circle,
    ),
    child: Image.asset(
      'images/logo.png',
    ),
  );
}

Image hive(int num) {
  return Image.asset('images/hive$num.png');
}

Padding reuseDivider() {
  return const Padding(
    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
    child: Divider(
      thickness: 1,
      color: Color(0xFF3B96B2),
    ),
  );
}

ElevatedButton TopIconButton(
    IconData icon, String text, bool active, BuildContext context) {
  return ElevatedButton(
    onPressed: active
        ? () {
            Future.delayed(
              const Duration(milliseconds: 500),
              () => Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 500),
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      HomePage(
                    routeTransitionValue: animation,
                  ),
                ),
              ),
            );
          }
        : null,
    child: SizedBox(
      width: 60,
      height: 50,
      child: Column(
        children: [
          Icon(
            icon,
          ),
          Text(text),
        ],
      ),
    ),
  );
}
