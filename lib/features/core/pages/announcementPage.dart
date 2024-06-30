import 'package:chic_choices/Reuse/reuse_widgets.dart';
import 'package:flutter/material.dart';

class announcementPage extends StatelessWidget {
  const announcementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          height: screensizeWithBottom(context),
          color: const Color(0xFFF6C273),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              hive(1),
              Container(
                color: const Color.fromARGB(255, 118, 239, 255),
                child: ListTile(
                  tileColor: Color.fromARGB(255, 49, 165, 101),
                  leading: SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.asset(
                      'images/pro1.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text("ประกาศ#1"),
                  subtitle: Text('dd/mm/yyyy'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
              ),
              Container(
                color: const Color.fromARGB(255, 118, 239, 255),
                child: ListTile(
                  tileColor: Color.fromARGB(255, 49, 165, 101),
                  leading: SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.asset(
                      'images/pro2.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text("ประกาศ#2"),
                  subtitle: Text('dd/mm/yyyy'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
              ),
              Container(
                color: const Color.fromARGB(255, 118, 239, 255),
                child: ListTile(
                  tileColor: Color.fromARGB(255, 49, 165, 101),
                  leading: SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.asset(
                      'images/pro3.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text("ประกาศ#3"),
                  subtitle: Text('dd/mm/yyyy'),
                  trailing: Icon(Icons.keyboard_arrow_right),
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
