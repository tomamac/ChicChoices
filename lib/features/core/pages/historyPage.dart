import 'package:chic_choices/Reuse/reuse_widgets.dart';
import 'package:flutter/material.dart';

class historyPage extends StatelessWidget {
  const historyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: const Color(0xFFF6C273),
        height: screensizeWithBottom(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            hive(1),
            Column(
              children: [
                Container(
                  color: const Color.fromARGB(255, 118, 239, 255),
                  child: const ListTile(
                    tileColor: Color.fromARGB(255, 49, 165, 101),
                    leading: SizedBox(
                      width: 100,
                      height: 100,
                      child: Icon(Icons.flight),
                    ),
                    title: Text("ตั๋วเดินทาง#0001"),
                    subtitle: Text('ภูเก็ต ไป กรุงเทพ'),
                    trailing: Icon(Icons.keyboard_arrow_right),
                  ),
                ),
                Container(
                  color: const Color.fromARGB(255, 118, 239, 255),
                  child: const ListTile(
                    tileColor: Color.fromARGB(255, 49, 165, 101),
                    leading: SizedBox(
                      width: 100,
                      height: 100,
                      child: Icon(Icons.flight),
                    ),
                    title: Text("ตั๋วเดินทาง#0002"),
                    subtitle: Text('กรุงเทพ ไป เชียงใหม่'),
                    trailing: Icon(Icons.keyboard_arrow_right),
                  ),
                ),
              ],
            ),
            hive(2)
          ],
        ),
      ),
    );
  }
}
